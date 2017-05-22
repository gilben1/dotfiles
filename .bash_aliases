# Sets warnings and details for remove, copy, move, and other common navigation commands
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -v'

# Alows quick search of history using grep
alias hisgrep='history | grep'

# hdrive mounting, changing, and unmounting
function hdrive()
{
    prev=$(pwd)
    cd /media/hdrive
    if [[ $(ls) == "" ]] ; then
        echo "hdrive is not currently mounted"
        cd $prev
    fi
}

alias hdrive-mnt='mount /media/hdrive && echo "hdrive mounted"'
alias hdrive-umnt='umount /media/hdrive && echo "hdrive unmounted"'



# Changes into a directory, then displays its contents
function cds()
{
   cd "$@" && ls 
}

# Battery status
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT1'

# Ssh aliases
alias ada-cs='ssh -4 gnick@ada.cs.pdx.edu'
alias ada-cat='ssh -4 nickg@ada.cs.pdx.edu'
alias babbage='ssh -4 nickg@babbage.cs.pdx.edu'
alias serenity='ssh -4 nickg@serenity.cat.pdx.edu'

function irc()
{
    if ! ps -eo args | grep "[l]isten.sh" > /dev/null ; then
        echo "Starting up notification script"
        listen.sh &
    else
        echo "Notification script already running" 
    fi
    ssh -4 nickg@serenity.cat.pdx.edu
}

function set-title() {
    if [[ -z "$ORIG" ]]; then
        ORIG=$PS1
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1=${ORIG}${TITLE}
}


alias stargate='ssh -4 nickg@stargate.cat.pdx.edu'
alias rita='ssh -4 nickg@rita.cat.pdx.edu'
alias ruby='ssh -4 nickg@ruby.cat.pdx.edu'

# Allows direct modification and update of the aliases file
alias alias-modify='vim ~/.bash_aliases; source ~/.bashrc'
alias alias-update='source ~/.bashrc'
alias alias-view='less ~/.bash_aliases'


# Fixing stuff
alias remount='sudo mount -a';
alias fix-wifi='sudo service network-manager restart && echo "Restarted network manager"'
alias wifi-restart='sudo service network-manager restart && echo "Restarted network manager"'
alias fix-gdrive='google-drive-ocamlfuse -cc'

# Shows current IP address
alias myip='curl http://ipecho.net/plain; echo'
alias games='echo ./2048, bastet, greed, nethack, ninvaders, nsnake, pacman4console'

alias mcecs-vpn='cd ~/.config/openvpn; sudo openvpn --config cecs.ovpn'

alias check-for-updates='sudo apt-get -u upgrade --assume-no'

alias i3-modify='vim ~/.config/i3/config'
alias i3status-modify='vim ~/.config/i3/i3status.conf'
alias compton-modify='vim ~/.config/compton.conf'

alias temps="sensors | grep Core"
