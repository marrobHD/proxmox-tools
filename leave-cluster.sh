#SSH into proxmox cluster node
#1. Shutdown all containers and vms
pvesh create /nodes/localhost/stopall


#2. stop services
systemctl stop pvestatd.service
systemctl stop pvedaemon.service
systemctl stop pve-cluster.service
systemctl stop corosync
systemctl stop pve-cluster


#3. edit through sqlite, check, delete, verify
sqlite3 /var/lib/pve-cluster/config.db
sqlite> select * from tree where name = 'corosync.conf';
sqlite> delete from tree where name = 'corosync.conf';
sqlite> select * from tree where name = 'corosync.conf';
sqlite> .quit


#3. Remove directories
pmxcfs -l
rm /etc/pve/corosync.conf
rm /etc/corosync/*
rm /var/lib/corosync/*
#rm -rf /etc/pve/nodes/* #Do this only if you want to delete all nodes

#Dont forget to remove nodes that you dont want from /etc/pve/priv/authorized_keys
reboot
