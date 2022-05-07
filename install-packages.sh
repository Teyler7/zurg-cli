# Check for Homebrew, install if it does not exist
    echo "Looking for Homebrew..."
    if test ! $(which brew); then
        echo "Installing homebrew..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        echo "Homebrew Installed ✅"

        echo "Installing packages..."
        brew install ${PACKAGES[@]}
        echo "Packages installed 📦"

        # Moving .zprofile to home directory. This points default zsh to use zurg instead.
        cp ${HOME}/zurg-cli/.zprofile ${HOME}

        # Install Oh My ZSH
        echo "Installing Oh My ZSH and plugins"
        if [ ! -d "/Users/${USER}/.oh-my-zsh" ]; then
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            else
                echo "Oh My ZSH is already installed ✅" #duplicated code
        fi

        # Node Version Manager
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

        echo "Cleaning up 🧹"
        brew cleanup
    fi