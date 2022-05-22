# ProxmoxTools
📦 A collection of stuff that I and others wrote for Proxmox 📦


[![License][license-shield]](LICENSE.md)

![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Github][github]][github]

<!-- 🎉 Release of ProxmoxTools 0.0.2 -->

### Features

-<--->-
<!-- also includes... -->

____________________________________________________________________________________________
</details>

<details>
<summary markdown="span"> Remove Proxmox Nag </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" alt="@home-assistant" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Remove Proxmox Nag | Tested 5.1-3 - 7.1-12 </h1>

To remove the Proxmox Nag, run the following in the Proxmox Shell

```yaml
bash -c "$(wget -qLO - https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/ProxmoxNag.sh)"
```

____________________________________________________________________________________________
</details>

<details>
<summary markdown="span"> 🔸Remove Proxmox Nag & Add Community Repo </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" alt="@home-assistant" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Remove Proxmox Nag & Add Community Repo | Tested 5.1-3 - 7.1-12 </h1>

To remove the Proxmox Nag & add Community Repo, run the following in the Proxmox Shell

```yaml
bash -c "$(wget -qLO - https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/proxmoxve_community.sh)"
```
 
____________________________________________________________________________________________
</details>

<details>
<summary markdown="span"> Proxmox CPU Scaling Governor </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Proxmox CPU Scaling Governor </h1>

CPU Scaling Governor enables the operating system to scale the CPU frequency up or down in order to save power or improve performance.


[Generic Scaling Governors](https://www.kernel.org/doc/html/latest/admin-guide/pm/cpufreq.html?#generic-scaling-governors)

Run the following in the Proxmox Shell.

```yaml
bash -c "$(wget -qLO - https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/scaling-governor.sh)"
```

____________________________________________________________________________________________
</details>

<details>
<summary markdown="span"> Backup Proxmox Config </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Backup Proxmox Config Manual </h1>

To create a new Proxmox Node Config Backup, do the following in the Proxmox Shell

```yaml
* Download the [script](https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/prox_config_backup.sh)  
```cd /root/; wget -qO- https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/prox_config_backup.sh > prox_config_backup.sh```
* Set the permanent backups directory ```export BACKUP_DIR="/root/proxmox_backups/"```
* Create a proxmox_backups folder and make the script executable ```mkdir /root/proxmox_backups/; chmod +x ./prox_config_backup.sh```
* Shut down ALL VMs + LXC Containers if you want to go the save way. (Not required) ```service pve-manager stop```
* Run the script ```./prox_config_backup.sh```
```

____________________________________________________________________________________________

</details>

<details>
<summary markdown="span"> Restore Proxmox Config </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" alt="@proxmox" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Restore Proxmox Config </h1>

On machine, you end up with a GZipped file of about 1-10 MB with a name like "proxmox_backup_proxmoxhostname_2017-12-02.15.48.10.tar.gz".  
Depending upon how you schedule it and the size of your server, that could eventually become a space issue so don't  
forget to set up some kind of archive maintenance.

To restore, move the file back to proxmox with cp, scp, webmin, a thumb drive, whatever.  
I place it back into the /var/tmp directory from where it came. 

```
# Unpack the original backup
tar -zxvf proxmox_backup_proxmoxhostname_2017-12-02.15.48.10.tar.gz
# unpack the tared contents
tar -xvf proxmoxpve.2017-12-02.15.48.10.tar
tar -xvf proxmoxetc.2017-12-02.15.48.10.tar
tar -xvf proxmoxroot.2017-12-02.15.48.10.tar

# If the services are running, stop them:
for i in pve-cluster pvedaemon vz qemu-server; do systemctl stop $i ; done

# Copy the old content to the original directory:
cp -avr /var/tmp/var/tmp/etc/* /etc/
cp -avr /var/tmp/var/tmp/var/* /var/
cp -avr /var/tmp/var/tmp/root/* /root/


# And, finally, restart services:
for i in qemu-server vz pvedaemon pve-cluster; do systemctl start $i ; done
```

If nothing goes wrong, and you have separately restored the VM images using the default ProxMox process.  
You should be back where you started. But let's hope it never comes to that.

____________________________________________________________________________________________

</details>


<details>
<summary markdown="span"> Leave Proxmox Cluster </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" alt="@home-assistant" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Leave Proxmox Cluster </h1>

To leave a Proxmox-Cluster, run the following in the Proxmox Node shell, which should leave the cluster.

```yaml
bash -c "$(wget -qLO - https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/leave-cluster.sh)"
```

____________________________________________________________________________________________ 

</details>


<details>
<summary markdown="span"> Proxmox API - Guest Actions </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/2678585?s=200&amp;v=4" alt="@home-assistant" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Guest Actions </h1>

The Proxmox API scripts are located in the API folder.

```
/api/lxc: startlxc.sh, stoplxc.sh, shutdownlxc.sh, restartlxc.sh, suspendlxc.sh and resumelxc.sh
/api/vm: startvm.sh, stopvm.sh, shutdownvm.sh, restartvm.sh, resetvm.sh, suspendvm.sh and resumevm.sh
```

____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> 🔸Proxmox LXC Updater</summary>
 
<p align="center"><img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Felpuig.xeill.net%2FMembers%2Fvcarceler%2Farticulos%2Fcontenedores-con-lxd-lxc%2Fcontainers.png&f=1&nofb=1" height="100"/></p>

<h1 align="center" id="heading">Proxmox LXC Updater </h1>

Update All LXC's Fast & Easy
 
Run the following in the Proxmox Shell.

```yaml
bash -c "$(wget -qLO - https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/upgrade-lxcs.sh)"
```


____________________________________________________________________________________________ 

</details>


<details>
<summary markdown="span"> Home Assistant OS VM </summary>
 
<p align="center"><img src="https://avatars.githubusercontent.com/u/13844975?s=200&amp;v=4" alt="@home-assistant" width="100" height="100"/></p>
 
<h1 align="center" id="heading"> Home Assistant OS VM </h1>

To create a new Proxmox Home Assistant OS VM, run the following in the Proxmox Shell

```yaml
bash -c "$(wget -qLO - https://raw.githubusercontent.com/marrobHD/proxmox-tools/master/install-HAOS.sh)"
```
<h3 align="center" id="heading">⚡ Default Settings:  4GB RAM - 32GB Storage - 2vCPU ⚡</h3>
 
After the script completes, click on the VM, then on the **_Summary_** tab to find the VM IP.

**Home Assistant Interface - IP:8123**


____________________________________________________________________________________________ 

</details>


### Sources
http://ziemecki.net/content/proxmox-config-backups



Feel free to post issues

## Authors & contributors

The original setup of this repository is by [Marlon][TechHome].

For a full list of all authors and contributors,
check [the contributor's page][contributors].



[Troubleshooting]()

[commits-shield]: https://img.shields.io/github/commit-activity/y/marrobHD/proxmox-tools.svg?style=for-the-badge
[commits]: https://github.com/marrobHD/proxmox-tools/commits/master
[contributors]: https://github.com/marrobHD/proxmox-tools/graphs/contributors
[license-shield]: https://img.shields.io/github/license/marrobHD/proxmox-tools.svg?style=for-the-badge
[maintenance-shield]: https://img.shields.io/badge/maintainer-TechHome-blue.svg?style=for-the-badge
[TechHome]: https://github.com/marrobHD
[releases-shield]: https://img.shields.io/github/release/marrobHD/proxmox-tools.svg?style=for-the-badge
[releases]: https://github.com/marrobHD/proxmox-tools/releases
[contributors]: https://github.com/hassio-addons/addon-ssh/graphs/contributors
[license-shield]: https://img.shields.io/github/license/marrobHD/proxmox-tools.svg?style=for-the-badge
[maintenance-shield]: https://img.shields.io/badge/maintainer-Marlon-blue.svg?style=for-the-badge
[releases-shield]: https://img.shields.io/github/release/marrobHD/proxmox-tools.svg?style=for-the-badge
[releases]: https://github.com/marrobHD/proxmox-tools/releases
[github]: https://img.shields.io/github/followers/marrobHD.svg?style=social
