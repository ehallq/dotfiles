set encoding=utf-8

packadd minpac
call minpac#init()

call minpac#add('morhetz/gruvbox')
call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
call minpac#add('nono/vim-handlebars')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('kana/vim-textobj-user')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('skwp/greplace.vim')
call minpac#add('klen/python-mode')

"Group dependencies, vim-snippets depends on ultisnips
"call minpac#add('Valloric/YouCompleteMe')
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')
call minpac#add('epilande/vim-react-snippets',{'type': 'opt'})

"COMMON
call minpac#add('neomake/neomake')
call minpac#add('tpope/vim-surround')
call minpac#add('mattn/emmet-vim', {'type': 'opt'})
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('christoomey/vim-tmux-navigator')

"On-demand loading
call minpac#add('scrooloose/nerdtree')
call minpac#add('tpope/vim-endwise')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('itchyny/lightline.vim')

"call minpac#ad(in outside ~/.vim/plugged with post-update hook
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-fugitive')

"PHP
call minpac#add('stanangeloff/php.vim', {'type': 'opt'})

"RUBY
call minpac#add('janko-m/vim-test')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rbenv')
call minpac#add('rdolgushin/groovy.vim', {'type': 'opt'})
call minpac#add('tpope/vim-bundler')

"JAVASCRIPT
call minpac#add('pangloss/vim-javascript')
call minpac#add('moll/vim-node')
call minpac#add('posva/vim-vue', {'type': 'opt'})
call minpac#add('mxw/vim-jsx', {'type': 'opt'})

"COMPILED
call minpac#add('rust-lang/rust.vim', {'type': 'opt'})
call minpac#add('elixir-lang/vim-elixir', {'type': 'opt'})

"GOLANG
call minpac#add('nsf/gocode')
call minpac#add('fatih/vim-go')
call minpac#add('neovimhaskell/haskell-vim')

"Language server
call minpac#add('prabirshrestha/asyncomplete.vim')
call minpac#add('prabirshrestha/async.vim')
call minpac#add('prabirshrestha/vim-lsp')
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
call minpac#add('prabirshrestha/asyncomplete-buffer.vim')
call minpac#add('prabirshrestha/asyncomplete-file.vim')
call minpac#add('prabirshrestha/asyncomplete-ultisnips.vim')
call minpac#add('felixfbecker/php-language-server')
call minpac#add('prabirshrestha/asyncomplete-gocode.vim')
call minpac#add('prabirshrestha/asyncomplete-tags.vim')
call minpac#add('ludovicchabant/vim-gutentags')

packloadall
"match it with methods
runtime macros/matchit.vim

source ~/dotfiles/nvim/base_settings.vim
source ~/dotfiles/nvim/neomake_settings.vim
source ~/dotfiles/nvim/lightline_settings.vim
source ~/dotfiles/nvim/fzf_settings.vim
source ~/dotfiles/nvim/search_settings.vim
source ~/dotfiles/nvim/completion_settings.vim

"minpac commands:
command! PlugUpdate call minpac#update()
command! PlugClean call minpac#clean()


