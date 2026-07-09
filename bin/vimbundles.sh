mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

get_bundle() {
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "https://github.com/$1/$2.git"
  fi
  )
}

#------------------------------------------------------------------------------
#   P  L  U  G  I  N  S
#------------------------------------------------------------------------------

# --- UI / colorschemes / editor tooling (language-agnostic) ---
get_bundle chriskempson base16-vim
get_bundle morhetz gruvbox
get_bundle vim-airline vim-airline
get_bundle vim-airline vim-airline-themes
get_bundle godlygeek tabular
get_bundle qpkorr vim-bufkill

# --- fuzzy finder / project search (needs `fzf` + `rg` on PATH: brew install fzf ripgrep) ---
get_bundle junegunn fzf              # base fzf vim plugin (:FZF)
get_bundle junegunn fzf.vim         # :Files, :Buffers, :Rg (ripgrep-backed search) — replaces ag.vim

# --- file explorer / commenting ---
get_bundle preservim nerdtree
get_bundle preservim nerdcommenter

# --- tpope suite (mature/stable, language-agnostic) ---
get_bundle tpope vim-endwise
get_bundle tpope vim-fugitive       # git
get_bundle tpope vim-repeat
get_bundle tpope vim-speeddating
# get_bundle tpope vim-surround      # OPTIONAL: cs/ds/ys to change/delete/add surrounding quotes, brackets, tags
get_bundle tpope vim-pathogen       # NOTE: plugin manager, normally lives in ~/.vim/autoload

# --- ruby / rails ---
get_bundle vim-ruby vim-ruby         # ruby colors + indent (vim's upstream ruby files)
get_bundle tpope vim-rails           # rails-aware navigation/commands (:A, :R, gf)
get_bundle tpope vim-rake            # rails.vim-style navigation for non-rails ruby (gems/libs)
# get_bundle tpope vim-bundler       # OPTIONAL: bundler commands (:Bundle) + gf into gem source

# --- elixir / phoenix / erlang ---
get_bundle elixir-editors vim-elixir # NOT native to vim, required for colors
# get_bundle vim-erlang vim-erlang-runtime  # OPTIONAL: fresher erlang syntax + indent (native colors already cover casual use)

# --- javascript / typescript / nextjs / adonisjs ---
get_bundle pangloss vim-javascript   # richer JS highlighting + indent (TS/TSX syntax is native to vim)

# --- python / django ---
get_bundle vim-python python-syntax  # richer python highlighting (base python syntax is native to vim)
