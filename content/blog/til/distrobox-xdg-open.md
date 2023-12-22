---
title:  Öffnen von Links aus exportierten Distrobox-Anwendungen
tags:
    - til
lang: de
date: 2023-12-22
---

Damit von exportieren Anwendungen einer Distrobox aus andere Anwendungen mit xdg-open gestartet werden können, muss eine symbolische Verknüpfung erstellt werden. Dazu muss man in die Distrobox wechseln und folgenden Befehl ausführen:

```bash
sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open
```

Referenz: https://github.com/89luca89/distrobox/issues/645#issuecomment-1462560668