#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#!/bin/sh
# make default editor vim
export EDITOR=vim

# Most pure GTK3 apps use wayland by default, but some,
# like Firefox, need the backend to be explicitely selected.
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export GTK_CSD=0

# qt wayland
# export QT_QPA_PLATFORM="wayland"
eval which qt5ct
[[ $? -eq 0 ]] && export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=kvantum
# export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

#Java XWayland blank screens fix
export _JAVA_AWT_WM_NONREPARENTING=1

# set default shell and terminal
# export SHELL=/usr/bin/bash
# export TERMINAL_COMMAND=/usr/share/sway/scripts/foot.sh

# add default location for zeit.db
# export ZEIT_DB=~/.config/zeit.db

# WLR fixes for NVIDIA
# export WLR_NO_HARDWARE_CURSORS=1
# export WLR_RENDERER=vulkan

# AMDGPU
# export RADV_PERFTEST=aco

# fcitx5
eval which fcitx5
if [[ $? -eq 0 ]]; then
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export SDL_IM_MODULE=fcitx
    export INPUT_METHOD=fcitx
    export GLFW_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
fi

