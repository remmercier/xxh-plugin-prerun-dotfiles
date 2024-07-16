" https://nvie.com/posts/how-i-boosted-my-vim/
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" This must be first, because it changes other options as side effect
set nocompatible

" Set leader key to space
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Persistent undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undofile
set undodir=$HOME/.vim/undo
" Use many muchos levels of undo
set undolevels=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Turn on the Wild menu
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class

" Display relative line number
set number
set relativenumber

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable
" Change line number color to grey
highlight LineNr ctermfg=grey

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Display hidden characters by default
set list
set listchars=tab:>-,trail:-,nbsp:+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Open split view to right
set splitright

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Replace status line by lightline plugin
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch ':' to ';'
nnoremap ; :

" Fast saving
nmap <leader>w :w!<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" https://stackoverflow.com/a/48237738
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" 'U' as redo
map U <C-r>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Toggle search highlight
map <silent> <C-l> :set hlsearch!<cr>

" To not jump over current line when the current line is long and wrapped
nnoremap j gj
nnoremap k gk

" Jump to first non-white character and end of line easierly
map H ^
map L $

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" To display line number in vinegar
" https://github.com/tpope/vim-vinegar/issues/38
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Toggle automatically number on window focus
" https://github.com/jeffkreeftmeijer/vim-numbertoggle/blob/main/plugin/number_toggle.vim
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" https://github.com/tpope/vim-vinegar/issues/89
function! NetrwBuf()
  nmap <buffer> h -
  nmap <buffer> l <CR>
endfunction

augroup FILETYPES
  autocmd FileType netrw call NetrwBuf()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-install vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Editor plugins
Plug 'terryma/vim-smooth-scroll'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
" UI plugins
if v:version >= 705
  Plug 'tribela/vim-transparent'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'jdhao/better-escape.vim'
endif
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options that need to be applied after plugins were loaded
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim') && v:version >= 705
  colorscheme dracula
endif

" Add cwd path into the status line
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'cwd' ] ]
      \ },
      \ 'component': {
      \   'cwd': '%{getcwd()}',
      \   'charvaluehex': '0x%B'
      \ },
      \ }

" Better scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Activate rainbow parentheses by default
autocmd VimEnter * RainbowParentheses

" Better escape than escape key
let g:better_escape_shortcut = ['jk', 'jj', 'kj']
if v:version < 705
    inoremap jk <esc>
    vnoremap jk <esc>
endif

