# history is useful
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory notify
unsetopt beep
bindkey -e

zstyle :compinstall filename '/home/taras/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# hello console
PS1="%B%F{blue}%T %F{green}%m %B%F{white}$ "
PS2="%T %m $ "
RPROMPT='%'

export EDITOR="vim"
export MAILTO="back.neomind@gmail.com"
export BROWSER="chromium"

# android
#export ANDROID_HOME=/osvrt/android/sdk
#export ANDROID_TOOLS=/osvrt/android/sdk/platform-tools
#export ANDROID_SDK=/osvrt/android/sdk
#export ANDROID_NDK=/osvrt/android/ndk/android-ndk-r10e
#export ANDROID_TMP=/osvrt/android/tmp

# path
export PATH=$PATH:~/.scripts/
export PATH=$PATH:/opt/android/sdk/platform-tools

# Автодополнение в режиме меню
zstyle ':completion:*' menu yes select

# Автодополнение номеров процессов
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# не пищать при дополнении или ошибках
setopt NO_BEEP

# не прекращать выполнение приложений
setopt NO_HUP
setopt NO_CHECK_JOBS

# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# aliases
alias g='googler -n10'
alias vlog='logcat-color | egrep $1'
alias vpi='vim +PluginInstall +qall'
alias vpl='vim +PluginList'
alias vpc='vim +PluginClean'

alias colors='zenity --color-selection'
alias ss='systemd-analyze blame'
alias sv='sudo systemctl'
alias ..='cd ..'
alias cl='clear'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias x='swayx'
alias grep='grep --exclude="*.svn*"'
alias wifi='sudo wifi-menu'
alias pacup='sudo pacman -Syu'
alias pac="sudo pacman -S"
alias srv="sudo sysctemctl"
alias ya="yaourt"
alias pacman='sudo pacman'
alias poweroff='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias timeroff='sudo shutdown -h -P 30'
alias nmap='sudo nmap'
alias mount='sudo mount'
alias router='ssh root@192.168.1.1'
alias powertop='sudo powertop'
alias speedtest='php ~/scripts/speedtest/speedtest.php'
alias compose='setxkbmap -option compose:ralt'
alias killwifi='sudo ifconfig wlan0 down'
alias qemu='qemu-system-x86_64 -enable-kvm'
alias webcam='xawtv -c /dev/video0'
alias umusb='sudo umount /mnt/usb'
alias getkey='pacman-key -r'
alias umount='sudo umount'
alias fumount='fusermount -u'
alias net='sudo netctl'
alias nets='sudo netctl start'
alias slog='sudo journalctl -rb -1'
alias sstat='systemd-analyze blame'

# настройка ассоциаций
alias -s {html,org,php,com,net}=$BROWSER
alias -s {png,jpg,gif,bmp}=feh
alias -s {avi,mpeg,mpg,mov,m2v}=vlc
alias -s {ogg,mp3,wav,wma}=xmms
alias -s pdf=apvlv


