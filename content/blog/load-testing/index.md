---
title: Spin up Real Infrastructure for Load Testing on HetznerCloud
date: "2020-12-15"
---

Imagine you have developed an API-service, but you do not know how much load it could handle or which server configuration you need to handle the anticipated load.

In this blog post I will show you how you can spin up your infrastructure run a load testing suite and tear your infrastructure down again.

## CLI or SDK for your Cloud Provider

In this day and age almost all cloud provider have a CLI tool or SDKs for most common programming languages for managing your instance on their service. Here is a list of CLI tools for popular services:

* [Google Cloud SDK](https://cloud.google.com/sdk/)
* [AWS CLI](https://aws.amazon.com/de/cli/)
* [DigitalOcean CLI](https://www.digitalocean.com/docs/apis-clis/doctl/)
* [HetznerCloud CLI](https://github.com/hetznercloud/cli)

In this blog post I will use [HetznerCloud](https://www.hetzner.com/cloud) for managing my servers, but the other CLI tools or SDKs work similarly.

In all cases you will need an API Token with is your authentication for the service. For HetznerCloud you need to go into a project. Under the security tab you can create a new API Token. Be sure to select the right permissions - for HetznerCloud you need to select read and right. Copy the generated API Token into a save space. Be sure to not commit the API Token to your repository (happened to me multiple times 🙈), otherwise you need to do clean your repository, for example with [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/).


## Writing a Wrapper for Load Testing

For your load testing purposes you probably want to write a wrapper around the CLI or SDK of your cloud provider to spin up and tear down your desired infrastructre.

You can write this wrapper in any language — Java, Python, Node or even as a Bash Script. In my case I will use Python, because I am familiar with the language and it is easy to achieve our goal.

For this blog post will use the [HetznerCloud Python SDK](https://github.com/hetznercloud/hcloud-python)

The wrapper we need to create has a simple interface:

```bash
python infrastructre.py up # creates the infrastructre
python infrastructre.py down # deletes the infrastructre
```

We will create two procedures — one called `up` and one called `down`.

The up procedure looks like this:

```python
from hcloud import Client
from hcloud.images.domain import Image
from hcloud.servers.client import BoundServer, CreateServerResponse
from hcloud.server_types.client import ServerType

def up(server_type="cx11"):
    client = Client(token=os.getenv("HCLOUD_API_TOKEN"))

    response: CreateServerResponse = client.servers.create(
        name="load-testing",
        server_type=ServerType(name=server_type),
        image=Image(name="ubuntu-20.04"),
        ssh_keys=client.ssh_keys.get_all(),
    )
    server: BoundServer = response.server
    return server.public_net.ipv4.ip
```

The down procedure is even shorter:

```python
def down():
    client = Client(token=os.getenv("HCLOUD_API_TOKEN"))

    server: BoundServer = client.servers.get_by_name("load-testing")
    server.delete()
```

Now we need an entry point for our script, and done:

```python
if __name__ == "__main__":
    command = sys.argv[1]
    if command == "up":
        up()
    elif command == "down":
        down()
```

Unfortunately that is not the whole setup. With this code we can create a server and destroy it later on, but we missed a key point: How do we start our service on the newly created server?

### Get our Service Running on the Server

On HetznerCloud the can provide `user_data` to the create procedure. This parameter needs to be the content of a yaml file which contains information and what to run after the creation of the server is complete. Because our service is a docker container — like everything today —, we need to install docker, create a network and run our container. Depending on the service you are running other container like database should also run. In my case another docker image (`runner-java`) needs to be present and a special network (`openpatch-runner-net`) needs to be created.

```yaml
#cloud-config
package_update: true
package_upgrade: true

# create the docker group
groups:
  - docker

packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg-agent
  - software-properties-common

runcmd:
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  - apt-get update -y
  - apt-get install -y docker-ce docker-ce-cli containerd.io
  - systemctl start docker
  - systemctl enable docker
  - docker pull "registry.gitlab.com/openpatch/runner-java:v1.0.0"
  - docker network create "openpatch-runner-net"
  - docker run -d --restart=unless-stopped --name=runner -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock --net openpatch-runner-net registry.gitlab.com/openpatch/runner:v1.0.1
```

Great not we can load the file and passed it as an argument to the procedure:

```python
def up(server_type="cx11"):
    client = Client(token=os.getenv("HCLOUD_API_TOKEN"))

    with open("cloud-config.yml", "r") as user_data:
        response: CreateServerResponse = client.servers.create(
            name="load-testing",
            server_type=ServerType(name=server_type),
            image=Image(name="ubuntu-20.04"),
            ssh_keys=client.ssh_keys.get_all(),
            user_data=user_data.read()
        )
        server: BoundServer = response.server
        return server.public_net.ipv4.ip
```

Now we step into the next problem. When is the installation of the packages ready? When are the docker container up and running? The HetznerCloud SDK does not provide functionality to check that. We need to check it our self. Fortunatly for us a file is created when the processing of the user data is finished. Its location is at `/var/lib/cloud/instance/boot-finished`. We need to check whether this file is present or not.

For this purpose we write a new procedure which test is a file is avaible on a remote host:

```python
import subprocess

def exists_remote(host, path):
    """Test if a file exists at path on a host accessible with SSH."""
    status = subprocess.call(
        ["ssh", host, "test -f {}".format(pipes.quote(path))],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    if status == 0:
        return True
    if status == 1 or status == 255:
        return False
```

Directly after creating the server the ssh service will probably not be up — it takes a while. This will lead to `ssh` return a 255, which we handle as if the file is not present. Only if the file is present — ssh will return 0 — the procedure will return `True`. Great now we can incorporate this procedure in our script:

```python
if __name__ == "__main__":
    command = sys.argv[1]
    if command == "up":
        try:
            start_time = time.time()
            ip = up()

            print(f"Wait for {ip} to become ready")
            while not exists_remote(
                f"root@{ip}", "/var/lib/cloud/instance/boot-finished"
            ):
                print(".", end="", flush=True)
                time.sleep(5)

            print("")
            end_time = time.time()
            print(f"{ip} is up and initialized in {round(end_time - start_time)}s")
        except KeyboardInterrupt:
            print(f"Abort! Start deleting {ip}")
            down()
    elif command == "down":
        down()
```

We also added some print statements to let the user know what is happening at the moment.

## Load Testing

Puhh! That was hard work. Of course, you could also use `ansible` and/or `terraform` but this is another topic. Now we can finally start with load testing our service.

For load testing we will use [locust](https://locust.io/). Easy to use, has over 14.000 stars on GitHub and is a Python 🐍 library. What more can you ask from your load testing framework?

Here is the locusfile we will use:

```python
import json
from locust import HttpUser, between, task


# Simple Java Hello World
hello_world_src = """
public class HelloWorld {
    private static String msg = "HelloWorld";

    public static void main (String[] args) {
        System.out.println(msg);
    }

    public String getMsg(){
        return msg;
    }
}
"""

# A successful test for Java Hello World
hello_world_test_ok_src = """
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class HelloWorldTestOk {
    HelloWorld hw = new HelloWorld();

    @Test
    public void testPrintMessage() {
        assertEquals("HelloWorld", hw.getMsg()); // A successfull test
    }
}
"""


class WebsiteRunner(HttpUser):
    wait_time = between(5, 8)

    @task
    def run(self):
        runner_data = {
            "image": "registry.gitlab.com/openpatch/runner-java:v1.0.0",
            "user": "locust",
            "timeout": 600,
            "payload": {
                "sources": [
                    {
                        "fqcn": "mypkg.HelloWorld",
                        "code": "package mypkg;\n" + hello_world_src,
                    }
                ],
                "tests": [
                    {
                        "fqcn": "mypkg.HelloWorldTestOk",
                        "code": "package mypkg;\n" + hello_world_test_ok_src,
                    }
                ],
            },
        }
        response = self.client.post("/api/v1/run", json=runner_data)
```

The service which I want to load test has one API endpoint. Therefore, we create one task which calls the API endpoint. We can run the locustfile by calling:

```bash
locust -f locustfile.py
```

A nice website will popup. Here you can input the IP-Address which you got from starting your infrastructure. You can determine how many users are simulated and at which rate they will call the service.

## Example Results 

In this section I will present to load testing results of the `runner` service and what I got out of it.

If have tested my service in different configuration and got these results:

Only the environmental variables OPENPATCH_MEM_LIMIT and OPENPATCH_PROCESSES were set. The subtitles indicate the used configuration: Runner-OPENPATCH_MEM_LIMIT-OPENPATCH_PROCESSES.

### Runner-250-5

| Users | Hatch Rate (User per Second) | Cloud Provider | Instance | RAM (GB) | (v)CPU | Average (ms) | Min (ms) | Max (ms) | Runs | Runner | Concrete Runner |
| ------ | ------ | --- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| 10 | 2 | HetznerCloud | cx21 | 4 | v2 | 14346 | 8699 | 18869 | 4 | v1.1.0 | java-v1.0.0 |
| 20 | 2 | HetznerCloud | cx21 | 4 | v2 | 22673 | 8218 | 34793 | 4 | v1.1.0 | java-v1.0.0 |
| 50 | 2 | HetznerCloud | cx21 | 4 | v2 | 48596 | 8487 | 86336 | 4 | v1.1.0 | java-v1.0.0 |

### Runner-250-12

| Users | Hatch Rate (User per Second) | Cloud Provider | Instance | RAM (GB) | (v)CPU | Average (ms) | Min (ms) | Max (ms) | Runs | Runner | Concrete Runner |
| ------ | ------ | --- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| 10 | 2 | HetznerCloud | cx21 | 4 | v2 | 17960 | 14670 | 19381 | 2 | v1.1.0 | java-v1.0.0 |
| 20 | 2 | HetznerCloud | cx21 | 4 | v2 | 30789 | 18375 | 39677 | 2 | v1.1.0 | java-v1.0.0 |
| 50 | 2 | HetznerCloud | cx21 | 4 | v2 | 60650 | 19302 | 94243 | 2 | v1.1.0 | java-v1.0.0 |
| 10 | 2 | HetznerCloud | cpx41 | 16 | v8 | 6811 | 4563 | 9227 | 2 | v1.1.0 | java-v1.0.0 |
| 20 | 2 | HetznerCloud | cpx41 | 16 | v8 | 8701 | 4716 | 13914 | 2 | v1.1.0 | java-v1.0.0 |
| 50 | 2 | HetznerCloud | cpx41 | 16 | v8 | 14948 | 4742 | 25560 | 2 | v1.1.0 | java-v1.0.0 |
| 50 | 50 | HetznerCloud | cpx41 | 16 | v8 | 24601 | 6880 | 42951 | 2 | v1.1.0 | java-v1.0.0 |

### Runner-250-16
| Users | Hatch Rate (User per Second) | Cloud Provider | Instance | RAM (GB) | (v)CPU | Average (ms) | Min (ms) | Max (ms) | Runs | Runner | Concrete Runner |
| ------ | ------ | --- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| 10 | 2 | HetznerCloud | cpx51 | 32 | v16 | 2110 | 1176 | 2892 | 2 | v1.1.0 | java-v1.0.0 |
| 20 | 2 | HetznerCloud | cpx51 | 32 | v16 | 2917 | 1593 | 5104 | 2 | v1.1.0 | java-v1.0.0 |
| 50 | 2 | HetznerCloud | cpx51 | 32 | v16 | 4347 | 1745 | 7930 | 2 | v1.1.0 | java-v1.0.0 |
| 50 | 50 | HetznerCloud | cpx51 | 32 | v16 | 16540 | 1789 | 31728 | 2 | v1.1.0 | java-v1.0.0 |


### Meaning

Before I got into detail which configuration is best for different use-cases. Let us take a closer look at two results: Runner-250-5; 10 Users; 2s Hatch-Rate and Runner-250-12; 10 Users; 2s Hatch-Rate.

You can see that the number of processes, which are defined in the environment variable `OPENPATCH_PROCESSES`, does influence the results. In this case a larger process number leads to poorer results — for example the average response time went up. A simple explanation for this one is that the number of (v)CPU should lead the number of processes. At best the process should not be in conflict with each other when it comes to execution time. 

Keep in mind to tweak your service to fit your server!

Now we come to what the results mean to me for running the service. Which server instance should I choose?

It would choose like so:

- 10 concurrent user expected ⇒ cx21 (5,68€ per month)
- 20 concurrent user expected ⇒ cpx41 (26,56€ per month)
- 50 concurrent user expected ⇒ cpx51 (57,88€ per month)

If I want to reduce my cost I would probably look into load balancing and renting more smaller server.

## Conclusion

Load testing is a good practice to get a feel on how your service will run once deployed to public. In this blog post you saw how the creation and initialization of server instances can be done programmatically via a cloud providers CLI or SDK. You also saw how locust can be used for load testing your service. At the end of the blog post I presented load testing results of my `runner` service and explained what I read out of the data.

I am curious if you have done load testing before and how you handle it. Please leave a comment and happy to discuss load testing practices with you 🙂.

## Source Code

You can find the source code of the `runner` service and the load testing files in my GitLab repository: https://gitlab.com/openpatch/runner/.