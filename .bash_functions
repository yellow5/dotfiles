# ~/.bash_functions

[ ! -f "$HOME/.bash_functions.local" ] || . "$HOME/.bash_functions.local"

rails_root() {
  (
  dir=${1:-$(pwd)}
  i=0
  while [ "/" != "$dir" -a "$i" -ne 16 ]; do
    if [ -f "$dir/config/environment.rb" ]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
    i=$(expr $i + 1)
  done
  return 1
  )
}

function parse_git_deleted {
  [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}
function parse_git_added {
  [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
}
function parse_git_dirty {
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
