#filename=bootstrap_nfs.sh

# Update hosts file
echo "nfs [TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.16.16.99    nfs-server.example.com  nfs-server
172.16.16.100   kmaster.example.com     kmaster
172.16.16.101   kworker1.example.com    kworker1
172.16.16.102   kworker2.example.com    kworker2
172.16.16.103   kworker2.example.com    kworker3
EOF

echo "nfs [TASK 2] Download and install NFS server"
sudo apt update -qq >/dev/null 2>&1
sudo apt install -qq -y nfs-kernel-server >/dev/null 2>&1

echo "nfs [TASK 3] Create a kubedata directory"
mkdir -p /srv/nfs/kubedata

echo "nfs [TASK 4] Update the shared folder access"
chmod -R 777 /srv/nfs/kubedata

echo nfs "[TASK 5] Make the kubedata directory available on the network"
cat >>/etc/exports<<EOF
/srv/nfs/kubedata   *(rw,sync,no_subtree_check,no_root_squash)
EOF

echo "nfs [TASK 6] Export the updates"
sudo exportfs -rav >/dev/null 2>&1

echo "nfs [TASK 7] Enable NFS Server"
sudo systemctl enable nfs-kernel-server >/dev/null 2>&1

echo "nfs [TASK 8] Start NFS Server"
sudo systemctl start nfs-kernel-server
