""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       3AMHuang
"       3amhuang@gmail.com
"
" Version:
"       1.0 - 10/04/16 12:16:10
"
" Secitons:
"   -> General
"   -> 
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
noremap <C-Z> :update<CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Quick quit command
nmap <Leader>e :quit<CR> " Quit current window
nmap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

set nocompatible
filetype off
filetype plugin indent on
syntax on

" Show line numbers and length
set number " show line numbers
set tw=79 " width of document
set nowrap "don't automatically wrap on load
set fo-=t "don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab
set showcmd
set showmatch
set backspace=2
set autoindent
set textwidth=100
set ruler
set background=dark
set clipboard=unnamed

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set the runtime path to include Vundle and initialized
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" My Bundles
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe' " completion
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'lokaltog/vim-powerline'
Plugin 'tpope/vim-commentary'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'raimondi/delimitmate'
Plugin 'nvie/vim-flake8'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'airblade/vim-gitgutter' " show git diff

" Color Schemes
Plugin 'git@github.com:fugalh/desert.vim.git'

call vundle#end()

" Use the desert color scheme
colorscheme desert
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix 

let python_highlight_all=1

" NerdTree{
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set nocompatible

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"javascript
let javascript_enable_domhtmlcss = 1

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
       set ttimeoutlen=10
       augroup FastEscape
           autocmd!
           au InsertEnter * set timeoutlen=0
           au InsertLeave * set timeoutlen=1000
        augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim