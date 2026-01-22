---
title: Pangolin
date: 2026-01-22
tags:
    - til
lang: de
---

# Pangolin

Pangolin ist eine self-hosted Alternative zu Tailscale, die es ermöglicht, ein privates VPN-Netzwerk (Virtual Private Network) aufzubauen. Im Gegensatz zu traditionellen VPN-Lösungen bietet Pangolin eine mesh-basierte Netzwerkarchitektur, bei der Geräte direkt miteinander kommunizieren können.

## Vorteile

- **Self-hosted**: Volle Kontrolle über die eigene Infrastruktur und Daten
- **Kosteneffizient**: Ein einfacher VPS reicht als zentraler Koordinationsserver
- **Mesh-Networking**: Direkte Peer-to-Peer-Verbindungen zwischen Geräten
- **WireGuard-basiert**: Nutzt das moderne und performante WireGuard-Protokoll

## Architektur

Pangolin besteht aus zwei Komponenten:
- **Pangolin-Server**: Koordinationsserver für die Verwaltung der Netzwerktopologie
- **newt-Client**: Auf jedem Gerät installierter Agent für die VPN-Verbindung

```bash
curl -fsSL https://static.pangolin.net/get-installer.sh | bash
sudo ./installer
```

Der Installer richtet den Pangolin-Server ein, der als zentrale Koordinationsstelle dient. Nach der Installation ist der Server über eine Web-Oberfläche erreichbar, wo "Sites" (Standorte) und Geräte verwaltet werden können.

## Client-Installation

Auf den Clients muss der `newt`-Agent installiert werden. Dieser stellt die tatsächliche VPN-Verbindung her und registriert sich beim Pangolin-Server.

### Schritt 1: newt-Binary herunterladen

```bash
curl -fsSL https://static.pangolin.net/get-newt.sh | bash
```

Dies lädt den `newt`-Client herunter und installiert ihn nach `/usr/local/bin/newt`.

### Schritt 2: Systemd-Service konfigurieren

Erstelle eine Service-Datei unter `/etc/systemd/system/newt.service`:

```bash
sudo vi /etc/systemd/system/newt.service
```

Mit folgendem Inhalt:

```ini
[Unit]
Description=Newt VPN Client für Pangolin
After=network.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/local/bin/newt <CONNECTION_STRING>
Restart=always
RestartSec=5
User=root
# Sicherheit: Isoliere den Prozess
ProtectSystem=strict
ProtectHome=yes
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
```

**Wichtig**: Ersetze `<CONNECTION_STRING>` durch den tatsächlichen Connection-String, der beim Einrichten eines Standorts (Site) in der Pangolin-Weboberfläche generiert wird. Dieser String enthält alle notwendigen Authentifizierungsinformationen.

### Schritt 3: Service aktivieren und starten

```bash
sudo systemctl daemon-reload
sudo systemctl enable newt
sudo systemctl start newt
```

### Verbindung prüfen

Status des Services überprüfen:

```bash
sudo systemctl status newt
```

Logs anzeigen:

```bash
sudo journalctl -u newt -f
```

## Netzwerkzugriff testen

Nach erfolgreicher Verbindung können Geräte im Pangolin-Netzwerk über ihre zugewiesenen privaten IP-Adressen erreicht werden. Diese IPs werden in der Pangolin-Weboberfläche angezeigt.

```bash
# Ping zu einem anderen Gerät im Netzwerk
ping <PANGOLIN_IP_DES_ZIELGERÄTS>
```
