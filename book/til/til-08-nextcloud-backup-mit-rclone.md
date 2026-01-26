---
title: Nextcloud Backup mit RClone
date: 2026-01-26
tags:
    - til
lang: de
---

# Nextcloud Backup mit RClone

Meine Nextcloud (Storage Share) soll regelmäßig auf meinem Home-Server gesichert werden.

Dazu habe ich RClone installiert und anschließend konfiguriert.

```bash
sudo apt install rclone
```

Dann habe ich einen Systemd-Service erstellt, der das Backup automatisch durchführt.

```bash
[Unit]
Description=Rclone sync from Hetzner Storage Share to Home-Server
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
User=lxcshare
Group=lxcshare
ExecStart=/usr/bin/rclone sync hs: /mnt/nextcloud \
  --progress \
  --fast-list \
  --log-level INFO
```

Wie in meinem [vorherigen TIL](./til-07-lxc-share-proxmox.md) verwende ich immer den Benutzer `lxcshare`.

Jetzt noch einen Timer erstellen, der den Service regelmäßig ausführt.

```bash
[Unit]
Description=Run rclone Nextcloud sync regularly

[Timer]
OnBootSec=5min
OnUnitActiveSec=30min
Persistent=true

[Install]
WantedBy=timers.target
```

Und anschließend den Systemd daemon neu laden und den Timer aktivieren.

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now rclone-nextcloud-sync.timer
```

Fertig! Jetzt wird meine Nextcloud regelmäßig auf meinem Home-Server gesichert.
