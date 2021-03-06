source $ZURG/packages.txt

Uninstall() {
    echo "Uninstalling packages ๐ฆ"
    brew uninstall ${PACKAGES[@]}

    echo "Cleaning up ๐งน"
    brew cleanup

    echo "Removing .zprofile to restore default config"
    if [ ! -d "/Users/${USER}/.zprofile" ]; then
        rm "/Users/${USER}/.zprofile"
    else
        echo ".zprofile has already been removed" #duplicated code
    fi
}

# Verify the user wants to uninstall
while true; do
    read -p "Would you like to uninstall Zurg CLI tools? (y/n): " yn
    case $yn in
        [Yy]* ) 
            Uninstall;
            echo "Uninstall successful โ";
            echo "Please restart the terminal to see changes"
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
