# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="spaceship"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-zsh-plugin)

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

# Iterm2
# source $HOME/.iterm2_shell_integration.zsh

# Import from .bash_profile
export PATH="$PATH:/usr/local/sbin:$HOME/bin:$HOME/.composer/vendor/bin"

# Zurg Binaries
export PATH="$PATH:/usr/local/sbin:$HOME/bin:$HOME/zurg-cli/bin"

# Disable annoying confirm for recursive remove
setopt rmstarsilent

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Path to additional addons to .zshrc
source $HOME/zurg-cli/.zurg

export LANG=en_US.UTF-8

# asdf version manager prefix
. /opt/homebrew/opt/asdf/asdf.sh
. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash

# rbenv
eval "$(rbenv init - zsh)"

# Starship

# TODO: Make zurg-cli a path variable
export STARSHIP_CONFIG=~/zurg-cli/starship.toml
eval "$(starship init zsh)"