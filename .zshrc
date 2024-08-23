export PATH=$PATH:~/.local/bin

# Load oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins managed by Zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Other user configurations
bindkey '^@' autosuggest-accept

alias nvm-init='source ~/.nvm/nvm.sh'
alias code='com.visualstudio.code'
alias test-db='mongod --port 27018 --dbpath /data/db'
alias project_autostream_client='~/scripts/project-startup/setup_autostram_client.sh'

# NVM setup
export NVM_DIR="$HOME/.nvm"
source ~/.nvm/nvm.sh

# Load Angular CLI autocompletion
source <(ng completion script)

# Update PATH
export PATH=$PATH:~/.local/bin
export PATH=~/.console-ninja/.bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
source ~/powerlevel10k/powerlevel10k.zsh-theme
