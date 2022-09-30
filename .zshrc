# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-zsh-plugin)

# Use oh-my-zsh shell
source $ZSH/oh-my-zsh.sh

# Add ssh keys to keychain quietly
ssh-add --apple-use-keychain ~/.ssh/id_rsa -q

# Zurg init image and text
echo ""
printf '%b\n' "$(cat $HOME/zurg-cli/ascii-zurg.ans)"
echo " ------------------------------ Zurg initialized -----------------------------"

export EDITOR='vim'

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Disable annoying confirm for recursive remove
setopt rmstarsilent

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Always default Vim to Neovim
alias vi="nvim"
alias vim="vim"

# Path to additional addons to .zshrc
source $HOME/zurg-cli/.zurg

# Language
export LANG=en_US.UTF-8

# rbenv
eval "$(rbenv init - zsh)"

# Starship (and custom .toml file)
export STARSHIP_CONFIG=$ZURG/starship.toml
eval "$(starship init zsh)"
