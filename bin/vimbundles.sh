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

get_bundle duff vim-bufonly
get_bundle flazz vim-colorschemes
get_bundle godlygeek tabular
get_bundle jimenezrick vimerl
get_bundle leshill vim-json
get_bundle pangloss vim-javascript
get_bundle rking ag.vim
get_bundle scrooloose nerdcommenter
get_bundle scrooloose nerdtree
get_bundle tpope vim-abolish
get_bundle tpope vim-bundler
get_bundle tpope vim-cucumber
get_bundle tpope vim-endwise
get_bundle tpope vim-fugitive
get_bundle tpope vim-git
get_bundle tpope vim-haml
get_bundle tpope vim-markdown
get_bundle tpope vim-pathogen
get_bundle tpope vim-rake
get_bundle tpope vim-ragtag
get_bundle tpope vim-rails
get_bundle tpope vim-repeat
get_bundle tpope vim-speeddating
get_bundle tpope vim-surround
get_bundle tpope vim-unimpaired
get_bundle vim-ruby vim-ruby
