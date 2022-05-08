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

        echo "Cleaning up 🧹"
        brew cleanup
    fi
