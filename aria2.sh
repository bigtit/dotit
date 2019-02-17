#!/bin/sh
mkdir -p ~/.config/aria2
touch ~/.config/aria2/aria2.conf
echo "dir=/home/$(whoami)/Downloads" > ~/.config/aria2/aria2.conf
echo "rpc-secret=secret" >> ~/.config/aria2/aria2.conf
touch ~/.config/aria2/session.lock
#curl https://raw.githubusercontent.com/gutenye/systemd-units/master/aria2/aria2.service > aria2.service
sudo cp ./aria2.service /etc/systemd/user/

systemctl --user enable aria2
systemctl --user start aria2

