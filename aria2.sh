#!/bin/sh
mkdir -p ~/.config/aria2
touch ~/.config/aria2/aria2.conf
touch ~/.config/aria2/session.lock

cat ./aria2.conf <<EOL
dir=/home/$(whoami)/Downloads/
rpc-secret=secret
max-overall-download-limit=7M
EOL
mv ./aria2.conf ~/.config/aria2/

cat ./aria2.service <<EOL
[Unit]
Description=Aria2 Service
After=network.target

[Service]
ExecStart=/usr/bin/aria2c --enable-rpc --rpc-listen-all --rpc-allow-origin-all --save-session %h/.config/aria2/session.lock --input-file %h/.config/aria2/session.lock --conf-path=%h/.config/aria2/aria2.conf

[Install]
WantedBy=default.target
EOL
sudo mv ./aria2.service /etc/systemd/user/

systemctl --user enable aria2
systemctl --user start aria2
