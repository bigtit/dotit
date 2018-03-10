#!/bin/sh
sudo -i
echo N> /sys/module/drm_kms_helper/parameters/poll
#echo "drm_kms_helper" >> /etc/modprobe.d/mouse-lag.conf
echo "options drm_kms_helper poll=N">/etc/modprobe.d/mouse-lag.conf
