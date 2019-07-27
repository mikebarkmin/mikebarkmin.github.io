---
title: Renovate Your Gitlab Projects Automatically
date: "2018-10-29"
---

“Gitlab application screengrab” by Pankaj Patel on Unsplash

Keeping your dependencies up-to-date is something many of us are struggling with. Of course, we want the latest and greatest. We want the latest security fixes. But the time of a developer is better spent on something more useful than checking every day if there is an update to a dependency and if this update does not break the current build.

### Automate the process

To fix this problem you could use an external service like [greenkeeper](https://greenkeeper.io/) or [renovate](https://renovatebot.com/). But both are only working with GitHub at the time of writing, when you are using their provided service. In the case of renovate there is an alternative to using their service. They keep the [source code of renovate](https://github.com/renovatebot/renovate) open and allow everyone to set up a self-hosted renovate bot. This sounds like a great hassle. Rent a new server, setup renovate, link to GitLab, setup a cron-job or something like this to check continuously.

### **Gitlab-CI to the rescue**

![GitLab-CI Pipeline View](https://cdn-images-1.medium.com/max/2542/1*P2aylb0tE7ODbUlND17oQQ.png)*GitLab-CI Pipeline View*

The[ CI part of GitLab](https://about.gitlab.com/product/continuous-integration/) is my favorite feature. For every repository, which I create I instantly setup a .gitlab-ci.yml. Whenever I push something to any branch of the repository, the code will be tested, a docker container will be build, and the documentation will be deployed. By manually activating the deployment job the project will be deployed to a production server. This part of GitLab is really worth checking out.

But now to the fun part. Let’s use GitLab-CI to check chosen repositories for outdated dependencies and create merge request to update them. All we need is to create a new repository with three files:

**config.js** for configuring renovate

```javascript
    module.exports = {
     platform: ‘gitlab’,
     endpoint: ‘https://gitlab.com/api/v4/',
     assignees: [‘mikebarkmin’],
     baseBranches: [‘master’],
     labels: [‘renovate’],
     extends: [‘config:base’]
    };
```

**repositories.txt** for keeping track which repositories we want to check

```shell
    openpatch/ui-core
    openpatch/template
```

**.gitlab-ci.yml** the heart which runs renovate

```yaml
    image: docker:latest
    
    services:
      - docker:dind
    
    renovate:
      stage: build
      script:
        - docker run -e GITLAB_TOKEN="$GITLAB_TOKEN" -e GITHUB_TOKEN="$GITHUB_TOKEN" -v $PWD/config.js:/usr/src/app/config.js renovate/renovate:13 $(cat repositories.txt | xargs)
      only:
        - master
```

As you can see I am using two GitLab [Secret CI Variables](https://docs.gitlab.com/ce/ci/variables/README.html#secret-variables) which needs to be configured. GITLAB_TOKEN needs to be a [Personal Access Token](https://docs.gitlab.com/ce/user/profile/personal_access_tokens.html) with the scope api and GITHUB_TOKEN needs to be a [Personal Access Token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/#creating-a-token) with the scope repos.

Now everything is finished. When you run the pipeline renovate will check the repositories in repositories.txt and create merge request if a dependency needs to be updated.

![Pipeline Schedule Overview](https://cdn-images-1.medium.com/max/2554/1*kAJqSk45_mE2HISVcjvbSQ.png)*Pipeline Schedule Overview*

At last, we can create a [Pipeline Schedule](https://gitlab.com/help/user/project/pipelines/schedules) to run the pipeline every x hours or x day or whatever you like.

### Summary

![Merge Request by Renovate](https://cdn-images-1.medium.com/max/2524/1*NVewoZL3fkvwljmuFz25Aw.png)*Merge Request by Renovate*

We have created a way to automate the dependency updating with GitLab-CI. We now just have to keep waiting for the merge requests and see if our test suites are successful. Afterwards we can happily merge (Assuming that your test suite is quite good). If you are really trusting your test suite, you can even let renovate auto-merge the request, if the pipeline succeeds. The last thing we could do is to create a separate user just for the renovate task. I hope you can now all optimize your workflow and never ever (OK most likely not ever) have to worry about updating your dependencies again.
