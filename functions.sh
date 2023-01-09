function showfunc () {
    echo "----------------------------  Functions  ----------------------------"

    echo ""
    echo "cl: code ~/zsh-config"
    echo "lg: Lazy git with dir changing upon exit"
    echo "fd: Fuzzy find and switch directory"
    echo "fch: Fuzzy find remote directoy and checkout"
    echo "fshow: Fuzzy find and show file"
    echo "fbr: Fuzzy find and checkout branch"
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

# fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fch() {
    git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
  FZF-EOF"
}
