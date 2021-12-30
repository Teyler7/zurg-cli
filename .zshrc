# ZSH_THEME="spaceship"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-zsh-plugin)

# Zurg init image and text
echo ""
printf '%b\n' "$(cat $HOME/zurg-cli/ascii-zurg.ans)"
echo " ------------------------------ Zurg initialized -----------------------------"

export EDITOR='vim'

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Iterm2
source $HOME/.iterm2_shell_integration.zsh

# Import from .bash_profile
export PATH="$PATH:/usr/local/sbin:$HOME/bin:$HOME/.composer/vendor/bin"

# Zurg Binaries
export PATH="$PATH:/usr/local/sbin:$HOME/bin:$HOME/zurg-cli/bin"

# Disable annoying confirm for recursive remove
setopt rmstarsilent

# Path to additional addons to .zshrc
source $HOME/zurg-cli/.zurg

export LC_CTYPE=C 
export LANG=C

# Starship

# TODO: Make zurg-cli a path variable
export STARSHIP_CONFIG=~/zurg-cli/starship.toml
eval "$(starship init zsh)"
