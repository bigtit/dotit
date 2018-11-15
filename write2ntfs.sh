#!/bin/sh
# only for mac darwin
os=$(uname)
if [[ ${os} != "Darwin" ]]; then
  echo "os type is not Darwin, exit"
  exit -1
fi
type=$(file -b --mime-type /sbin/mount_ntfs|sed 's|/.*||')
if [[ ${type} = "text" ]]; then
  echo "/sbin/mount_ntfs is already replaced, exit"
  exit -1
fi
mv /sbin/mount_ntfs /sbin/mount_ntfs_
cat <<EOT > /sbin/mount_ntfs
#!/bin/sh
/sbin/mount_ntfs_ -o rw,nobrowse "\$@"
EOT
chmod a+x /sbin/mount_ntfs
echo "mission complete, please reboot manually"
exit
