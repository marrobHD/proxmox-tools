# Disable Commercial Repo
sed -i "s/^deb/\#deb/" /etc/apt/sources.list.d/pbs-enterprise.list && apt-get update

# Add PBS Community Repo
echo "deb http://download.proxmox.com/debian/pbs $(grep "VERSION=" /etc/os-release | sed -n 's/.*(\(.*\)).*/\1/p') pbs-no-subscription" > /etc/apt/sources.list.d/pbs-no-enterprise.list && apt-get update

# Remove nag
echo "DPkg::Post-Invoke { \"dpkg -V proxmox-widget-toolkit | grep -q '/proxmoxlib\.js$'; if [ \$? -eq 1 ]; then { echo 'Removing subscription nag from UI...'; sed -i '/data.status/{s/\!//;s/Active/NoMoreNagging/}' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js; }; fi\"; };" > /etc/apt/apt.conf.d/no-nag-script && apt --reinstall install proxmox-widget-toolkit

