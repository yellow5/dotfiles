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

script_rails() {
  if [ -f "`rails_root`/script/rails" ]; then
    "`rails_root`/script/rails" "$@"
  else
    local name
    name="$1"
    shift
    "`rails_root`/script/$name" "$@"
  fi
}

twiki () {
  rake db:migrate && rake db:migrate:redo && rake db:test:prepare
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

function reegc {
  export RUBY_HEAP_MIN_SLOTS=1000000
  export RUBY_HEAP_SLOTS_INCREMENT=1000000
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  export RUBY_HEAP_FREE_MIN=500000
  export RUBY_GC_MALLOC_LIMIT=1000000000
  "$@"
  export RUBY_HEAP_MIN_SLOTS=
  export RUBY_HEAP_SLOTS_INCREMENT=
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=
  export RUBY_HEAP_FREE_MIN=
  export RUBY_GC_MALLOC_LIMIT=
}

function rubygc {
  export RUBY_GC_MALLOC_LIMIT=1000000000
  export RUBY_FREE_MIN=500000
  "$@"
  export RUBY_GC_MALLOC_LIMIT=
  export RUBY_FREE_MIN=
}
