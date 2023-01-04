#!/bin/sh
# wrapper script for foot

USER_CONFIG_PATH="${HOME}/.config/foot.ini"

if [ -f "$USER_CONFIG_PATH" ]; then
    USER_CONFIG=$USER_CONFIG_PATH
fi

foot -c "${USER_CONFIG:-"$HOME/.config/foot.ini"}" "$@" &
