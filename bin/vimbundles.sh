#!/usr/bin/env bash
#------------------------------------------------------------------------------
#   P  L  U  G  I  N  S
#------------------------------------------------------------------------------
#
# Vim 8+ native packages (see :help packages) — no plugin manager needed.
#   pack/plugins/start/  -> loaded automatically at startup
#   pack/plugins/opt/    -> dormant until you run  :packadd <name>

PACK=~/.vim/pack/plugins
mkdir -p "$PACK/start" "$PACK/opt"

# get_bundle <owner> <repo> [start|opt]   (target dir defaults to start)
get_bundle() {
  (
    dir="$PACK/${3:-start}"
    cd "$dir" || exit
    if [ -d "$2" ]; then
      echo "Updating $1's $2"
      cd "$2" || exit
      git pull --rebase
    else
      git clone "https://github.com/$1/$2.git"
    fi
  )
}

# --- UI / colorschemes / editor tooling (language-agnostic) ---
get_bundle chriskempson base16-vim
get_bundle morhetz gruvbox
get_bundle vim-airline vim-airline
get_bundle vim-airline vim-airline-themes
get_bundle godlygeek tabular
get_bundle qpkorr vim-bufkill

# --- fuzzy finder / project search (needs `fzf` + `rg` on PATH: brew install fzf ripgrep) ---
get_bundle junegunn fzf     # base fzf vim plugin (:FZF)
get_bundle junegunn fzf.vim # :Files, :Buffers, :Rg (ripgrep-backed search)

# --- file explorer / commenting ---
get_bundle preservim nerdtree
get_bundle preservim nerdcommenter

# --- tpope suite ---
get_bundle tpope vim-endwise
get_bundle tpope vim-fugitive # git
get_bundle tpope vim-repeat
get_bundle tpope vim-speeddating
get_bundle tpope vim-surround opt # OPTIONAL (:packadd vim-surround) — cs/ds/ys around quotes, brackets, tags

# --- ruby / rails ---
get_bundle vim-ruby vim-ruby     # ruby colors + indent (vim's upstream ruby files)
get_bundle tpope vim-rails       # rails-aware navigation/commands (:A, :R, gf)
get_bundle tpope vim-rake        # rails.vim-style navigation for non-rails ruby (gems/libs)
get_bundle tpope vim-bundler opt # OPTIONAL (:packadd vim-bundler) — bundler commands + gf into gem source

# --- elixir / phoenix / erlang ---
get_bundle elixir-editors vim-elixir         # NOT native to vim, required for colors
get_bundle vim-erlang vim-erlang-runtime opt # OPTIONAL (:packadd vim-erlang-runtime) — fresher erlang syntax + indent

# --- javascript / typescript / nextjs / adonisjs ---
get_bundle pangloss vim-javascript # richer JS highlighting + indent (TS/TSX syntax is native to vim)

# --- python / django ---
get_bundle vim-python python-syntax # richer python highlighting (base python syntax is native to vim)

# Generate :help tags for every installed plugin (start + opt) in one vim run.
cmds=()
for d in "$PACK"/start/*/doc "$PACK"/opt/*/doc; do
  [ -d "$d" ] && cmds+=(-c "helptags $d")
done
[ ${#cmds[@]} -gt 0 ] && vim -u NONE -esN "${cmds[@]}" -c 'qa!' 2> /dev/null

echo "Done. Plugins installed under $PACK (start = auto-loaded, opt = :packadd <name>)."
