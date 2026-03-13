
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
DIR_COLOR="\[\033[38;2;255;230;153m\]"
ARROW_COLOR="\[\033[38;2;255;230;153m\]"
RESET="\[\033[0m\]"

PS1="${DIR_COLOR}\$(short_pwd) ${ARROW_COLOR}> ${RESET}"
