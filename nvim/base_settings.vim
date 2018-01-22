"vim basic settings
let mapleader=","

set number
set nowrap
set autoread
set lazyredraw

inoremap jk <Esc>
inoremap <Esc> <Nop>

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set completeopt=longest,menu
set complete=.,w,b,u,t

"set spell spelllang=en_us

map <Leader><space> :TrimSpaces<CR>
nnoremap <silent> <esc> :noh<CR>

"Splitting windows
nmap <silent> ss :sp<CR>
nmap <silent> vv :vs<CR>


"UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

"jsx setting
let g:jsx_ext_required = 0

"Ctrl HJKL navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-H> <C-W><C-H>


"Visual block indent
vnoremap < <gv
vnoremap > >gv

if !isdirectory($HOME."/.config/nvim/undo-dir")
  call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif

set undodir=~/.config/nvim/undo-dir
set undofile

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/temp

"NerdTree is back
let g:NERDTreeWinPos = "right"
nnoremap <silent> <Leader><Tab> :NERDTreeToggle<CR>

"vim-test options
" make test commands execute using dispatch.vim
let test#strategy = "neomake"

nmap <Leader>x :TestNearest<CR>
nmap <Leader>T :TestFile<CR>
nmap <Leader>a :TestSuite<CR>
nmap <Leader>l :TestLast<CR>
nmap <Leader>g :TestVisit<CR>

nmap <Leader>s :Gstatus<CR>
nmap <Leader>w :Gw<CR>
nmap <Leader>ww :Gcommit<CR>
nmap <Leader>n :bprev<CR>
nmap <Leader>m :bnext<CR>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l

  nnoremap <a-h> <c-w>h
  nnoremap <a-j> <c-w>j
  nnoremap <a-k> <c-w>k
  nnoremap <a-l> <c-w>l

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let g:loaded_python_provider=1                   " Disable python 2 interface
  let g:python_host_skip_check=1                   " Skip python 2 host check
  let g:python3_host_prog='/usr/local/bin/python3' " Set python 3 host program
  set inccommand=nosplit
endif

set foldlevelstart=99
nnoremap zO zczO
nnoremap <Space> za

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

augroup ft_ruby
  au!
  au Filetype ruby setlocal foldmethod=syntax
  au BufRead,BufNewFile Capfile setlocal filetype=ruby
augroup END


let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

hi Visual term=reverse cterm=reverse guibg=Grey

command! Json silent! :%!python -m json.tool

augroup ft_php
  au!
  au FileType php packadd php.vim
  au Filetype php setlocal ts=4 sts=4 sw=4
augroup END

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

function! LoadSnippets()
  packadd ultisnips
  packadd vim-snippets
  packadd vim-react-snippets
  echom "snippets loaded"
endfunction

command! LoadSnippets call LoadSnippets()

let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_warnings = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/pack/minpac/start/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:rustfmt_autosave = 1
