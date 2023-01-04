#!/bin/sh
# wrapper script for mako

USER_CONFIG_PATH="${HOME}/.config/mako.ini"

if [ -f "$USER_CONFIG_PATH" ]; then
    USER_CONFIG=$USER_CONFIG_PATH
fi

mako -c "${USER_CONFIG:-"$HOME/.config/mako.ini"}" "$@"
