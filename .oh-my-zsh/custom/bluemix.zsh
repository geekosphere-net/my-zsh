#
# Custom setup

alias mark="figlet -f big -Wc \$(date +%T); \$*"
alias ls='ls -FC --color=auto'
export VISUAL=vim
export EDITOR=vim

[[ -f /usr/local/Bluemix/bx/zsh_autocomplete ]] && source /usr/local/Bluemix/bx/zsh_autocomplete
[[ -f ~/.ssh/bluemix.json ]] &&  export BLUEMIX_API_KEY=$(grep apiKey ~/.ssh/bluemix.json | awk -F\" '{print $4}')


