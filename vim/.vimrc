""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       3AM
"       3amhuang@gmail.com
"
" Version:
"       0.1.0 - 29/05/17 02:41:10
"
" Secitons:
"   -> General
"   -> VIM User Interface
"   -> Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""
" Leader
let mapleader = ","
let g:mapleader = ","

nmap <c-a> 0
nmap <c-e> $

" Fast saving
nmap <Leader>s :w!<cr>
noremap <C-Z> :update<CR>

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Automatic reloading of .vimrc
autocmd bufwritepost .vimrc source %

" Quick quit command
nmap <Leader>e :quit<CR> " Quit current window
nmap <Leader>E :qa!<CR> " Quit all windows

""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WILD menu
set wildmenu

" Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Make search case insensitive
" Ignore case when searching 
set ignorecase

" When searching try to be smart about cases
set smartcase

" HighLight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros 
set lazyredraw

" For regular expressions turn magic on
set magic

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set nocompatible
filetype off
syntax on
set guifont=DejaVu\ Sans\ Mono\ Bold\ Nerd\ Font\ Complete:h14
set encoding=utf8
set fencs=utf-8


" Show line numbers and length
set number " show line numbers
set relativenumber " set relative number
set tw=79 " width of document
set nowrap "don't automatically wrap on load
set fo-=t "don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set undolevels=700
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
set showcmd
set showmatch
set backspace=2
set autoindent
set textwidth=100
set background=dark
set clipboard=unnamed

" Set the runtime path to include Vundle and initialized
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" My Bundles
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-commentary'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'raimondi/delimitmate'
Plugin 'nvie/vim-flake8'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'shougo/neocomplete.vim'
Plugin 'briancollins/vim-jst'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'moll/vim-node'
Plugin 'dyng/ctrlsf.vim'
Plugin 'othree/html5.vim'
Plugin 'isruslan/vim-es6'
Plugin 'eslint/eslint'
Plugin 'ryanoasis/vim-devicons'
Plugin 'google/vim-searchindex'
Plugin 'itchyny/lightline.vim'
Plugin 'posva/vim-vue'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'

" Color Schemes
Plugin 'google/vim-colorscheme-primary'

call vundle#end()

" YouCompleteMe
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1	
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<M-;>'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

" Python-mode
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 79
let g:pymode_folding = 1
let g:pymode_lint_on_write = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_self = g:pymode_syntax_all

" Tabbar
nmap <C-t> :TagbarToggle<CR>

" Google Primary Schemes
syntax enable
set t_Co=256
set background=dark
colorscheme primary

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:loaded_syntastic_html_eslint_checker = 1

let g:syntastic_javascript_checkers = ["exlint"]
let g:syntastic_html_javascript_exec = 'exlint'
let g:syntastic_html_checkers = ['html']
let g:syntastic_html_eslint_exec = 'exlint'

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix 

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

" NerdTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,jsx,vue EmmetInstall

" JavaScript
let javascript_enable_domhtmlcss = 1

"Indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=yellow ctermbg=4
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Tmux Color Configuration
if exists('$TMUX')
  set term=screen-256color
endif

" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_ctrlp = 1

" Lightline Configuration
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
