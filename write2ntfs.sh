#!/bin/sh
# only for mac darwin
os=$(uname)
[[ ${os} != "Darwin" ]] && echo "os type is not Darwin, exit" && exit -1

[[ -f "/sbin/mount_ntfs" ]] && echo 'no mount_ntfs found' && exit 1

type=$(file -b --mime-type /sbin/mount_ntfs|sed 's|/.*||')
[[ ${type} = "text" ]] && echo "/sbin/mount_ntfs is already replaced, exit" && exit 1

mv /sbin/mount_ntfs /sbin/mount_ntfs_bin
cat <<EOT > /sbin/mount_ntfs
#!/bin/sh
/sbin/mount_ntfs_bin -o rw,nobrowse "\$@"
EOT
chmod a+x /sbin/mount_ntfs
echo "mission complete, please reboot manually"
exit
