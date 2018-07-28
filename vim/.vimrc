""" General """ {{{
set nocompatible    " sets comapatibility to VI
set encoding=utf-8    "set characterencoding in vim
set history=50        "number of : commands remembered
set viminfo='1000,f1,:1000,/1000 
set shortmess+=aI    "avoids hint-enter prompts
set ruler        "show line and column number
let mapleader=","    " leader is comma
set autoread
set formatoptions+=j
set t_Co=256
" Have some context around the current line always on screen
set scrolloff=3
set sidescrolloff=5

""" General """ }}}

""" Vundle """ {{{
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Airline Plugin {{{
Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme = 'badwolf'
" }}}

" VIM-Colorschemes {{{
Plugin 'flazz/vim-colorschemes'
" }}}

" Nerdcommenter {{{
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" }}}

" Syntastic {{{
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" vim-fugetive {{{
Plugin 'tpope/vim-fugitive'
" }}}

" nerdtree {{{
Plugin 'scrooloose/nerdtree'
" }}}

" nerdtree-git-plugin {{{
Plugin 'Xuyuanp/nerdtree-git-plugin'
" }}}

" undotree {{{
Plugin 'mbbill/undotree'
if has("persistent_undo")
    set undodir=~/.vim/.undodir/
    set undofile
endif
let g:undotree_WindowLayout = 3
" }}}

" indent guides {{{
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}}

" vim-jedi {{{
Plugin 'davidhalter/jedi-vim'
let g:jedi#use_splits_not_buffers = "bottom"
" }}}

" supertab {{{
Plugin 'ervandew/supertab'
" }}}

" Tabular {{{
Plugin 'godlygeek/tabular'
" }}}

" vim-markdown {{{
Plugin 'plasticboy/vim-markdown'"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
let g:vim_markdown_json_frontmatter = 1
" }}}

" vim-json {{{
Plugin 'elzr/vim-json'
" }}}

" delimitmate {{{
Plugin 'raimondi/delimitmate'
" }}}

" pyhton-mode {{{
Plugin 'klen/python-mode'
" }}}

" javascript {{{
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" }}}

" javascript-syntax {{{
Plugin 'jelera/vim-javascript-syntax'
" }}}

" tern-for-vim {{{
Plugin 'marijnh/tern_for_vim'
" }}}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""" Vundle """ }}}

""" Colors """ {{{

set background=dark
colorscheme badwolf
syntax enable        " enable syntax processing

"Change highlighting for Comments
hi Comment ctermfg=red guifg=red

""" Colors """ }}}

""" Spaces $ Tabs """ {{{
set tabstop=4        " number of visual spaces per TAB
set softtabstop=4    " number of spaces when editing
set shiftwidth=4
set textwidth=79
set expandtab        " tabs are spaces
set smarttab        " in fron of a line inserts blanks
set shiftround        " Round indent on multiple of shiftwidth
""" Spaces $ Tabs """ }}}

""" UI Config """ {{{
set number        " show line numbers
" set relativenumber
set showcmd        " show command in bottom bar
set cursorline        " highlight current line
set cursorcolumn        " highlight current column
filetype plugin indent on    " load filetype-specific indent files
set wildmenu        " visuak autocomplete for command menu
" set lazyredraw        " redraw only when we need to
set showmatch        " highlight matching brackets
set mouse+=a        " use mouse
set wrap        " Wrap at end of window
set linebreak   " Wrap only at valid chars
set listchars=tab:>-,trail:-,extends:»,precedes:«,eol:$,space:·
set iskeyword+=-
set list        " Show tab as CTRL-I, EOL = $
set equalalways        " Set windowsize to equal
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set laststatus=2

" Set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=:\"
set comments+=n::

""" UI Confi g """ }}}

""" Searching """ {{{
set incsearch        " search as chars are entered
set hlsearch        " highlight matches

" turn of search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

set ignorecase        " Ignore case in search
set gdefault        " All matches in a line are substituted

""" Searching """ }}}

""" Folding """ {{{
set foldenable        " enable folding
set foldlevelstart=10    " open most folds by default
set foldnestmax=10    " 10 nested fold max

" space open/close folds
nnoremap <space> za

set foldmethod=indent    " fold based on indent level

""" Folding """ }}}

""" Movement """ {{{

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to Beginning/End of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

set backspace=eol,start,indent

""" Movement """ }}}

""" Keymappings """ {{{

" Navigation through Tabs
nmap <C-up>    :tabr<CR>
nmap <C-down>    :tabl<CR>
nmap <C-left>    :tabp<CR>
nmap <C-right>    :tabn<CR>
imap <C-up>    <ESC>:tabr<CR>i
imap <C-down>    <ESC>:tabl<CR>i
imap <C-left>    <ESC>:tabp<CR>i
imap <C-right>    <ESC>:tabn<CR>i
imap <C-c> <CR><Esc>O
" Map Tab to indent
nmap <tab> <s->><s->>
nmap <s-tab> <s-<><s-<>
vmap <tab> >gv
vmap <s-tab> <gv
" Easy help
map! <F1> <C-C><F1>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
nnoremap <F1> :help<Space>

nnoremap <F4> :NERDTreeToggle<cr>
nnoremap <F5> :UndotreeToggle<cr>

nnoremap <F10> :set list!<CR>

" Toggle line numbers
nnoremap <F11> :set number!<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Toggel autoident
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>

" Fast quit
map qq :q<CR>

" Fast quit without saving
map Q :qa!<CR>

" remove trailing whitespaces
noremap <silent> <leader>tr :%s/\s\+$//e<CR>

" add python utf8 header
noremap <silent> <leader>ph i# -*- coding: utf-8 -*-<CR><ESC>

""" Keymappings """ }}}

""" Leader Shortcuts """ {{{

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

""" Leader Shortcuts """ }}}

""" Modlines """ {{{
set modelines=1        " check for modlines

""" Modlines """ }}}

""" Autocommands """ {{{

" au vimenter * NERDTree
au vimenter * wincmd p

" Python PEP8 Standard
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ let python_highlight_all = 1

au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END

" Resize Bufferwindow when resizing terminal
au VimResized * wincmd =

au InsertEnter * hi StatusLine term=reverse ctermbg=1 ctermfg=0 guifg=Red guibg=Gray
au InsertLeave * hi StatusLine term=reverse ctermbg=2 ctermfg=0 guifg=Green guibg=Gray
au InsertEnter * setlocal cursorline
au InsertLeave * setlocal nocursorline

" Set Termtitle
au BufEnter * let &titlestring = hostname() . ": editing " . expand("%:t")

" When editing a file, always jump to the last cursor position
au BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

augroup mail " {
    autocmd!
    au BufRead,BufNewFile /tmp/neomutt-* set tw=72
    au FileType mail setlocal formatoptions+=w
augroup END " }

""" Autocommands """ }}}

" vim:foldmethod=marker:foldlevel=0
