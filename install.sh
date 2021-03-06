ZURG=$HOME/zurg-cli
source $ZURG/packages.txt

InstallCore () {
    # Create custom.sh file
    touch custom.sh

    # Install Brew and zurg Brew packages
    sh install-packages.sh

    # Check for Homebrew, install if it does not exist
    echo "Looking for Homebrew..."
    if test ! $(which brew); then
        echo "Installing homebrew..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    echo "Homebrew Installed โ"

    echo "Installing and upgrading packages..."
    brew install ${PACKAGES[@]}
    echo "Packages installed ๐ฆ"

    echo "Cleaning up ๐งน"
    brew cleanup

    # Moving .zprofile to home directory. This points default zsh to use zurg instead.
    cp ${HOME}/zurg-cli/.zprofile ${HOME}

    # Install Oh My ZSH
    echo "Installing Oh My ZSH and plugins"
    if [ ! -d "/Users/${USER}/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        else
            echo "Oh My ZSH is already installed โ" #duplicated code
    fi

    # Node Version Manager
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
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
        echo "zsh-autosuggestions is already installed โ" #duplicated code
    fi

    # zsh-syntax-highlighting
    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        else
        echo "zsh-syntax-highlighting is already installed โ" #duplicated code
    fi

    # fzf-zsh-plugin
    if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin ]; then
        git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
        else
        echo "fzf-zsh-plugin is already installed โ" #duplicated code
    fi

    # -> Powerline fonts for Spaceship theme (with clean up)
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    # Install yarn globally
    sudo npm install --global yarn

    # Install Lunar Vim (Without Dependencies). Currently there is a limitation and this needs to be ran manually in it's own shell.
    # bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

    # Overwrite config.lua to core config.lua for lvim
    # cp -f "$ZURG/lunarvim/config.lua" ~/.config/lvim/config.lua
}

InstallFinish () {
    echo "Changing default shell ๐"
    chsh -s /bin/zsh

    echo "Zurg install complete โ"
    echo "Please quit your terminal and restart for changes to take effect."
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
