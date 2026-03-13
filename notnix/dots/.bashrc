# ALIASES #
# trailing space so sudo works with aliases #
alias sudo="sudo "
# BASH #
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias mkdir="mkdir -p"
# NIX #
alias cdn="cd /etc/nixos"
alias ns="sudo nixos-rebuild switch"
alias ns-update="sudo nixos-rebuild switch --upgrade"
alias ng="sudo nix-collect-garbage -d"
alias ncg="sudo nix-collect-garbage -d"
# NVIM #
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
# GIT #
alias gi="git init"
alias gs="git status"
alias ga="git add ."
alias gcm="git commit -m"
alias gp="git push -u origin main"
alias gl='git log --oneline --graph --decorate --all'

# SHORTEN DIR NAMES #
short_pwd() {
    local dir="${PWD/#$HOME/~}"
    IFS='/' read -ra parts <<< "$dir"
    local result=""

    for ((i=0; i<${#parts[@]}; i++)); do
        if [[ $i -lt $((${#parts[@]}-1)) && -n "${parts[i]}" ]]; then
            result+="/${parts[i]:0:1}"
        else
            result+="/${parts[i]}"
        fi
    done

    echo "${result#/}"
}

# COLORS FOR INPUT #
DIR_COLOR="\[\033[38;2;255;230;153m\]"
ARROW_COLOR="\[\033[38;2;255;230;153m\]"
RESET="\[\033[0m\]"

PS1="${DIR_COLOR}\$(short_pwd) ${ARROW_COLOR}> ${RESET}"
