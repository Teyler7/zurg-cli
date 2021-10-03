function showfunc () {
    echo "----------------------------  Functions  ----------------------------"

    echo ""
    echo "cl: code ~/zsh-config"
    echo "rosetta: Appends the -x86_64 flag before the given command"
    echo "lg: Lazy git with dir changing upon exit"
}

function cl () {
    cd "$@" && ll
}

# Preprends Apple Rosetta x86 flag to use the cli in Rosetta mode
function rosetta () {
    arch -x86_64 "$@"
}

# Change directory into selected repo upon exiting lazygit
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}