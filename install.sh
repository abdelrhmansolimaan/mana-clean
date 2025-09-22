
---

## ⚙️ سكريبت التثبيت `install.sh`

```bash
#!/bin/bash

echo "[+] Detecting OS..."
if grep -qi "kali" /etc/os-release; then
    OS="kali"
elif grep -qi "ubuntu" /etc/os-release; then
    OS="ubuntu"
else
    echo "[-] Unsupported OS"
    exit 1
fi

echo "[+] Installing dependencies..."
apt update
apt install -y build-essential libnl-3-dev libnl-genl-3-dev libssl-dev \
    hostapd apache2 python3-pip git

echo "[+] Building hostapd-mana..."
cd hostapd-mana
make clean && make
cd ..

echo "[+] Setup complete."
