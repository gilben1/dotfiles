# Sets warnings and details for remove, copy, move, and other common navigation commands
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -v'

# Alows quick search of history using grep
alias hisgrep='history | grep'

# Changes into a directory, then displays its contents
function cds()
{
   cd "$@" && ls 
}

# Ssh aliases
alias ada-cs='ssh -4 gnick@ada.cs.pdx.edu'
alias ada-cat='ssh -4 nickg@ada.cs.pdx.edu'
alias babbage-cat='ssh -4 nickg@babbage.cs.pdx.edu'
alias babbage-cs='ssh -4 gnick@babbage.cs.pdx.edu'
alias serenity='ssh -4 nickg@serenity.cat.pdx.edu'

function irc()
{
    #wal -r
    if [ "$1" = "-v" ] ; then
        echo "Starting up notification script"
        listen.sh &
    fi

    mosh gilben@kloe.life
    kill $(ps -s $$ -o pid=)
}

function irc_back()
{
    #wal -r
    if [ "$1" = "-v" ] ; then
        echo "Starting up notification script"
        listen.sh &
    fi

    mosh nickg@serenity.cat.pdx.edu
    kill $(ps -s $$ -o pid=)
}

function set-title() {
    if [[ -z "$ORIG" ]]; then
        ORIG=$PS1
    fi
    TITLE="\[\e]2;$*\a\]"
    PS1=${ORIG}${TITLE}
}

alias gephi='~/gephi-0.9.2/bin/gephi'

alias stargate='ssh -4 nickg@stargate.cat.pdx.edu'
alias rita='ssh -4 nickg@rita.cat.pdx.edu'
alias ruby='ssh -4 nickg@ruby.cat.pdx.edu'
alias videocats='ssh -4 videocats@video.cat.pdx.edu'

# Allows direct modification and update of the aliases file
alias alias-modify='vim ~/.bash_aliases; source ~/.bashrc'
alias alias-update='source ~/.bashrc'
alias alias-view='less ~/.bash_aliases'


# Fixing stuff
alias fix-wifi='sudo service network-manager restart && echo "Restarted network manager"'
alias wifi-restart='sudo service network-manager restart && echo "Restarted network manager"'

# Shows current IP address
alias myip='curl http://ipecho.net/plain; echo'

alias mcecs-vpn='cd ~/.config/openvpn; sudo openvpn --config cecs.ovpn'

alias check-for-updates='sudo apt-get -u upgrade --assume-no'

#alias fix-firefox="sudo sed -i 's/Exec=firefox/Exec=bash -c \'GTK_THEME=\" \"\' firefox/' /usr/share/applications/firefox.desktop"
