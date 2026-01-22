---
title: Pangolin
date: 2026-01-22
tags:
    - til
lang: de
---

# Pangolin

Pangolin ist ein self-hosted Ersatz für Tailscale.

Ein VPS als Pangolin-Server reicht aus, um ein eigenes VPN aufzubauen.

```bash
curl -fsSL https://static.pangolin.net/get-installer.sh | bash
sudo ./installer
```

Auf den Clients muss newt installiert werden und dann ein Systemd-Service eingerichtet werden.

```bash
curl -fsSL https://static.pangolin.net/get-newt.sh | bash
vi /etc/systemd/system/newt.service
```

```
[Unit]
Description=Newt
After=network.target

[Service]
ExecStart=/usr/local/bin/newt <wird beim einrichten eines Standorts (Site) generiert>
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```

Diese Datei wird unter `/etc/systemd/system/newt.service` gespeichert.

Danach mit `systemctl enable newt` und `systemctl start newt` den Dienst starten.
