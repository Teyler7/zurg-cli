source ./packages.txt

Uninstall() {
    echo "Removing .zprofile to restore default config"
    if [ ! -d "${HOME}/.zprofile" ]; then
        rm "${HOME}/.zprofile"
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
            echo "Uninstall successful ✅";
            echo "Please restart the terminal to see changes"
            break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
