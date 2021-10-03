function showfunc () {
    echo "----------------------------  Functions  ----------------------------"
    echo "------------------------------  Shell  ------------------------------"

    echo ""
    echo "cl: code ~/zsh-config"
    echo "rosetta: Appends the -x86_64 flag before the given command"
}

function cl () {
    cd "$@" && ll
}

function rosetta () {
    arch -x86_64 "$@"
}