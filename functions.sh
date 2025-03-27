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

alias yh="git rev-parse --verify HEAD | tr -d "\n" | pbcopy"

function coauth() {
  gh api repos/{owner}/{repo}/collaborators --paginate --jq '.[] | .login + " <" + .html_url + ">"' | fzf --multi | xargs -I _ printf "Co-authored-by: %s\n" "_"| pbcopy
}
function gspin() {
  if [ $# -ne 1 ]; then
    echo "Usage: gspin <branch_name>"
    return 1
  fi
  spinoff_from_branch=$(git branch --show-current)
  spinoff_from_reset_sha=$(git rev-parse origin/$spinoff_from_branch)
  git checkout -b $1
  git update-ref -m "gspin: moving $spinoff_from_branch to $spinoff_from_reset_sha" refs/heads/$spinoff_from_branch $spinoff_from_reset_sha
}

function gpop() {
  git stash list | fzf --preview 'git stash show --color -p $(cut -d: -f1 <<< {})'| cut -d: -f1 | xargs git stash pop
}
