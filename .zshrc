HISTFILE=""

autoload -U compinit promptinit
compinit 
promptinit

PS1="%B%F{blue}%T %F{green}%m %B%F{white}$ "
PS2="%T %m $ "
RPROMPT='%'

# Автодополнение в режиме меню
zstyle ':completion:*' menu yes select

# Автодополнение номеров процессов
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

export MAILTO=""
export EDITOR="vim"
export BROWSER=firefox
#export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export GTK_IM_MODULE="xim"
export JDK_HOME=/usr/lib/jvm/java-8-openjdk/
export VBOX_USER_HOME=/osvrt/.VirtualBox
export PATH=$PATH:~/scripts/:/usr/local/bin:/opt/java/bin:/osvrt/android-sdk/tools:/osvrt/android-sdk/platform-tools:/osvrt/android-ndk-r10d:~/tools/gsutil:/home/taras/.gem/ruby/2.2.0/bin
export ANDROID_TMP=/osvrt/android-tmp
export KEYSTORE_PROPERTIES=/home/taras/spd/tgsoft/keys/keystore.properties
if [ -d /cry/scripts ] ; then
  PATH=/cry/scripts:"${PATH}"
fi

[ "$PREFIX" ] || export PREFIX="/usr"
[ "$XDG_CACHE_HOME" ] || export XDG_CACHE_HOME="$HOME/.cache"
[ "$XDG_CONFIG_HOME" ] || export XDG_CONFIG_HOME="$HOME/.config"
[ "$XDG_DATA_HOME" ] || export XDG_DATA_HOME="$HOME/.local/share"

autoload zkbd
[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
[[ ! -f ~/.zkbd/dell_kbd ]] && zkbd
source  ~/.zkbd/dell_kbd

# настроить клавиши в соответствии
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# не пищать при дополнении или ошибках
setopt NO_BEEP

alias vpi='vim +PluginInstall +qall'
alias vpl='vim +PluginList'
alias vpc='vim +PluginClean'
alias rhtp='sudo systemctl start php-fpm.service httpd.service'
alias shtp='sudo systemctl stop php-fpm.service httpd.service'
alias vng='sudo vim /etc/nginx/nginx.conf'
alias vphp='sudo vim /etc/php/php.ini'
alias colors='zenity --color-selection'
alias ss='systemd-analyze blame'
alias ..='cd ..'
alias cl='clear'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias x='startx'
alias ej='sudo eject'
alias grep='grep --exclude="*.svn*"'
alias network='sudo /etc/rc.d/network start'
alias wifi='wifidhcp.sh'
alias pacup='sudo pacman -Syu'
alias pac="sudo pacman -S"
alias srv="sudo sysctemctl"
alias ya="yaourt"
alias vimrc="sudo vim /etc/rc.conf"
alias pc="proxychains"
alias viproxy="vim ~/.proxychains/proxychains.conf"
alias pacman='sudo pacman'
alias incorn='sudo /etc/rc.d/incron'
alias fan='sudo /etc/rc.d/dellfand'
alias poweroff='sudo shutdown -h now'
alias reboot='sudo shutdown -r now'
alias timeroff='sudo shutdown -h -P 30'
alias nmap='sudo nmap'
alias mount='sudo mount'
alias router='ssh root@192.168.1.1'
#alias mc='mc --nocolor'
alias rss='snownews -u'
alias cdw='cd ~/work/eldos/Projects/SolFS_2/JNI/'
alias powertop='sudo powertop'
alias modem='sudo wvdial'
alias speedtest='php ~/scripts/speedtest/speedtest.php'
alias compose='setxkbmap -option compose:ralt'
alias killwifi='sudo ifconfig wlan0 down'
alias games='cd  .wine/drive_c/Games'
alias apacherun='sudo /etc/rc.d/httpd restart'
alias mysqlrun='sudo /etc/rc.d/mysqld restart'
alias edvideo='avidemux2_gtk'
alias mails='mutt'
alias qemu='qemu-system-x86_64 -enable-kvm'
alias sppp='sudo pppoe-start'
alias webcam='xawtv -c /dev/video0'
alias email='mail -A eldos'
alias umusb='sudo umount /tmp/usb'
alias storesound='sudo alsactl -f /var/lib/alsa/asound.state store'

# настройка ассоциаций
alias -s {html,org,php,com,net}=$BROWSER
alias -s {png,jpg,gif,bmp}=feh
alias -s {avi,mpeg,mpg,mov,m2v}=vlc
alias -s {ogg,mp3,wav,wma}=xmms
alias -s pdf=apvlv
