
#Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
#Autocompletes with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		


#Creates a lfcd function that opens lf, exiting to the working directory. Binds it to CTRL + o.
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
bindkey "^?" backward-delete-char


# Use beam shape cursor on startup.
#echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
#preexec() {
#   echo -ne '\e[5 q'
#}

#feh --bg-scale /usr/share/pixmaps/triss.jpg
export PATH=$PATH:/home/christopher/scripts
export PATH=$PATH:/sbin



#Sets Aliases
#alias sx=openimage.sh 
alias ls='lsd -hA --group-dirs first'
alias vim='nvim'

source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


