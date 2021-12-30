source ~/zurg-cli/packages.txt

InstallCore () {
    # Create custom.sh file
    touch custom.sh

    # Check for Homebrew, install if it does not exist
    echo "Looking for Homebrew..."
    if test ! $(which brew); then
        echo "Installing homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        echo "Installing packages..."
         brew install ${PACKAGES[@]}
        else
        fi
    fi
    echo "Homebrew and Zurg Packages Installed ✅"

    # Moving .zprofile to home directory. This points default zsh to use zurg instead.
    cp ${HOME}/zurg-cli/.zprofile ${HOME}

    # Install Oh My ZSH
    echo "Installing Oh My ZSH and plugins"
    if [ ! -d "/Users/${USER}/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        else
            echo "Oh My ZSH is already installed ✅" #duplicated code
    fi

    echo "Cleaning up 🧹"
    brew cleanup
}

InstallPlugins () {
    # Install useful key bindings and fuzzy completion
    $(brew --prefix)/opt/fzf/install

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

    #Spaceship
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 

    # -> Powerline fonts for Spaceship theme
    git clone git@github.com:powerline/fonts.git ${HOME}/Documents/Github

    # Iterm2 Integrated Shell Commands
    curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash

    # Install fzf terminal integrations
    /usr/local/opt/fzf/install

    # Install yarn globally
    sudo npm install --global yarn
}

InstallFinish () {
    echo "Changing default shell 🔀"
    chsh -s /bin/zsh

    echo "Zurg install complete ✅"
    echo "Please restart your session for changes to take effect"
}

# Verify the user wants to install
while true; do
    read -p "Would you like to install Zurg CLI tools? (y/n): " yn
    case $yn in
        [Yy]* ) 
            InstallCore;
            InstallPlugins;
            InstallFinish;
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done