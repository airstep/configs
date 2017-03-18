if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then	
  export GDK_BACKEND=wayland
  export QT_QPA_PLATFORM=wayland-egl
  
  export _JAVA_AWT_WM_NONREPARENTING=1
  export QT_WAYLAND_DISABLE_WINDOWSDECORATION=1
  
  export XKB_DEFAULT_LAYOUT=us,ru
  export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,compose:caps,terminate:ctrl_alt_bksp

  sway
fi

