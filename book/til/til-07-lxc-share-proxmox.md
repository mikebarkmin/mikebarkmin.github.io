---
title: LXC Share Storage in Proxmox
date: 2026-01-25
---

# LXC Share Storage in Proxmox

Damit LXC Container in Proxmox auf gemeinsam genutzten Speicher zugreifen können, musst du einige Schritte befolgen, um den Speicher korrekt zu konfigurieren und zu mounten. Diese Anleitung zeigt, wie du einen gemeinsamen Speicher zwischen mehreren Containern einrichtest.

## Benutzer und Gruppe erstellen

Um konsistente Berechtigungen über mehrere Container hinweg zu gewährleisten, erstellst du zunächst einen dedizierten Benutzer mit einer festen UID/GID. Dieser Benutzer sollte in jedem LXC Container existieren, der auf den gemeinsam genutzten Speicher zugreifen soll.

**Auf dem Proxmox Host und in jedem Container ausführen:**

```bash
groupadd -g 1005 lxcshare
useradd -u 1005 -g lxcshare -s /bin/bash lxcshare
```

## LXC Bind Mount konfigurieren

Um den gemeinsam genutzten Speicher in einem LXC Container zu mounten, musst du die Konfigurationsdatei des Containers anpassen. 

**Container stoppen und Konfiguration bearbeiten:**

```bash
pct stop 100
vim /etc/pve/lxc/100.conf
```

**Mount-Point hinzufügen:**

```
...
mp0: /mnt/pve/share,mp=/mnt/media
...
```

Diese Zeile bindet das Verzeichnis `/mnt/pve/share` auf dem Host in das Verzeichnis `/mnt/media` im Container ein.

**Verzeichnisrechte auf dem Host anpassen:**

```bash
chown -R lxcshare:lxcshare /mnt/pve/share
```

**Container starten:**

```bash
pct start 100
```

## Anwendungsbeispiel: Jellyfin

Damit Jellyfin auf den gemeinsamen Speicher zugreifen kann, muss der Dienst unter dem `lxcshare`-Benutzer laufen.

**Systemd-Service anpassen:**

```bash
mkdir -p /etc/systemd/system/jellyfin.service.d/
vim /etc/systemd/system/jellyfin.service.d/override.conf
```

```ini
[Service]
User=lxcshare
Group=lxcshare
```

**Besitzerrechte für Jellyfin-Verzeichnisse ändern:**

```bash
chown -R lxcshare:lxcshare /etc/default/jellyfin
chown -R lxcshare:lxcshare /var/lib/jellyfin/
chown -R lxcshare:lxcshare /etc/jellyfin/
chown -R lxcshare:lxcshare /var/log/jellyfin/
chown -R lxcshare:lxcshare /var/cache/jellyfin/
```

**Dienst neu laden und starten:**

```bash
systemctl daemon-reload
systemctl restart jellyfin
```

## Anwendungsbeispiel: Samba

Um den gemeinsamen Speicher über Samba im Netzwerk freizugeben, konfigurierst du Samba so, dass es den `lxcshare`-Benutzer verwendet.

**Samba-Konfiguration bearbeiten:**

```bash
vim /etc/samba/smb.conf
```

**Share-Konfiguration hinzufügen:**

```ini
[media]
   comment = Shared Media Storage
   path = /mnt/media
   force group = lxcshare
   force user = lxcshare
   read only = no
   browsable = yes
   writable = yes
   create mask = 0664
   directory mask = 0775
```

**Samba-Benutzer erstellen:**

```bash
smbpasswd -a lxcshare
```

**Samba-Dienst neu starten:**

```bash
systemctl restart smbd
```

## Zusammenfassung

Mit dieser Konfiguration können mehrere LXC Container auf denselben Speicher zugreifen, wobei konsistente Berechtigungen durch den gemeinsamen Benutzer `lxcshare` gewährleistet werden. Dies ist besonders nützlich für Media-Server-Setups mit Jellyfin, Samba oder ähnlichen Diensten.
