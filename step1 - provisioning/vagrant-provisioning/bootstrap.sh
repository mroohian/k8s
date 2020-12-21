#!/bin/bash

## !IMPORTANT ##
#
## This script is tested only in the generic/ubuntu2004 Vagrant box
## If you use a different version of Ubuntu or a different Ubuntu Vagrant box test this again
#

echo "[TASK 1] Disable and turn off SWAP"
sed -i '/swap/d' /etc/fstab
swapoff -a

echo "[TASK 2] Stop and Disable firewall"
systemctl disable --now ufw >/dev/null 2>&1

echo "[TASK 3] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "[TASK 4] Set root password"
echo -e "toor\ntoor" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc

echo "[TASK 5] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.16.16.99    nfs-server.example.com  nfs-server
172.16.16.100   kmaster.example.com     kmaster
172.16.16.101   kworker1.example.com    kworker1
172.16.16.102   kworker2.example.com    kworker2
172.16.16.103   kworker2.example.com    kworker3
EOF
