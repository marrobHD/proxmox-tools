# Disable Commercial Repos
sed -i "s/^deb/\#deb/" /etc/apt/sources.list.d/pve-enterprise.list && sed -i "s/^deb/\#deb/" /etc/apt/sources.list.d/ceph.list && apt-get update

# Add PVE Community Repo
echo "deb http://download.proxmox.com/debian/pve $(grep "VERSION=" /etc/os-release | sed -n 's/.*(\(.*\)).*/\1/p') pve-no-subscription" > /etc/apt/sources.list.d/pve-no-enterprise.list && apt update

# Add Proxmox Ceph Community Repo
echo "deb http://download.proxmox.com/debian/ceph-quincy $(grep "VERSION=" /etc/os-release | sed -n 's/.*(\(.*\)).*/\1/p') no-subscription" > /etc/apt/sources.list.d/ceph-no-enterprise.list && apt-get update

# Remove nag
echo "DPkg::Post-Invoke { \"dpkg -V proxmox-widget-toolkit | grep -q '/proxmoxlib\.js$'; if [ \$? -eq 1 ]; then { echo 'Removing subscription nag from UI...'; sed -i '/data.status/{s/\!//;s/Active/NoMoreNagging/}' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js; }; fi\"; };" > /etc/apt/apt.conf.d/no-nag-script && apt --reinstall install proxmox-widget-toolkit

