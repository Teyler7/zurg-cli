ZURG=$HOME/zurg-cli
source $ZURG/packages.txt

InstallCore () {
    # Create custom.sh file
    touch custom.sh

    # Check for Homebrew, install if it does not exist
    echo "Looking for Homebrew..."
    if test ! $(which brew); then
        echo "Installing homebrew..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    echo "Homebrew Installed ✅"

    echo "Installing and upgrading packages..."
    brew install ${PACKAGES[@]}
    echo "Packages installed 📦"

    echo "Cleaning up 🧹"
    brew cleanup

    # Moving .zprofile to home directory. This points default zsh to use zurg instead.
    cp ${HOME}/zurg-cli/.zprofile ${HOME}

    # Node Version Manager
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

    # If the default shell is not zsh, switch to it. This will require a password.
    echo "Changing default shell 🔀"
    chsh -s /bin/zsh

    # Install Oh My ZSH. Install last because it auto detects .zshrc files and tries to switch
    echo "Installing Oh My ZSH and configuring plugins 🛠"
    if [ ! -d "/Users/${USER}/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        else
            echo "Oh My ZSH is already installed ✅" #duplicated code
    fi
}

InstallPlugins () {
    # Install useful key bindings and fuzzy completion
    $(brew --prefix)/opt/fzf/install

    # Install fzf terminal integrations
    /usr/local/opt/fzf/install

    # zsh-autosuggestions
    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        else
        echo "zsh-autosuggestions is already installed ✅" #duplicated code
    fi

    # zsh-syntax-highlighting
    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        else
        echo "zsh-syntax-highlighting is already installed ✅" #duplicated code
    fi

    # fzf-zsh-plugin
    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin ]; then
        git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
        else
        echo "fzf-zsh-plugin is already installed ✅" #duplicated code
    fi

    # Install Meslo Nerd Font 
    brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font

    # Install yarn globally
    sudo npm install --global yarn
}

InstallFinish () {
    echo "Zurg install complete ✅"
    echo "Please quit your terminal and restart for changes to take effect."
}

# Verify the user wants to install
while true; do
    read -p "Would you like to install zurg CLI tools? (y/n): " yn
    case $yn in
        [Yy]* ) 
            InstallPlugins;
            InstallCore;
            InstallFinish;
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
