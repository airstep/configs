if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export QT_QPA_PLATFORM=wayland
  export QT_WAYLAND_DISABLE_WINDOWSDECORATION="1"
  exec sway
fi

