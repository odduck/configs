#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h\W]\$ '
PS1='\[\e[0;36m\]\u\[\e[m\] \[\e[1;32m\]\w\[\e[m\] \[\e[1;36m\]\$\[\e[m\] \[\e[1;37m\]'

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# modified commands
alias ls='ls --color=auto'
alias wp='feh --bg-scale'
alias rb='sudo shutdown -r now'
alias shut='sudo shutdown -h now'
alias df='df -h'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

# moving around
alias home='cd ~/'
alias build='cd /var/abs/local/'

# pacman commands
alias pacupg='sudo pacman -Syu'
alias pacins='sudo pacman -S'
alias pacrem='sudo pacman -Rns'
alias pacqi='pacman -Qi'
alias pacqs='pacman -Qs'
alias pacsi='pacman -Si'
alias pacss='pacman -Ss'

# enable easy extraction of compressed files
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
               c='bsdtar xvf';;
        *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
        *.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
        *.gz)  c='gunzip';;
        *.rar) c='unrar x';;
        *.xz)  c='unxz';;
        *.zip) c='unzip';;
        *)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?
    done

    return $e
}

# colorized man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;37m") \
		LESS_TERMCAP_md=$(printf "\e[1;37m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[0;36m") \
			man "$@"
}

