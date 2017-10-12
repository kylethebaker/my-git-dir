" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
execute pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" disable the splash screen
set shortmess+=I

set history=50
set showcmd
set number
set undolevels=1000
set nowrap
set list
set listchars=tab:··
set listchars+=extends:»,precedes:«
set listchars+=trail:◥
"·•◦܁
"├ ─
"˖˒
"» «
"→ ¬ …
"❘|∣ǀ׀|
set hidden

" where those pesky swap files go
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/

" ignore non-code directories from ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" eneable matchit for better % matching
packadd! matchit

" default filetype indent options
set autoindent
set expandtab
set copyindent
set tabstop=2
set shiftwidth=2

" search will center what it finds
map N Nzz
map n nzz

" other nice search options
set incsearch
set ignorecase
set smartcase
set hlsearch

" for buffer navigation
let mapleader=","
noremap <Leader>m :bnext<CR>
noremap <Leader>n :bprev<CR>
noremap <Leader>q :bd<CR>

" nerdtree
map <F2> :NERDTreeToggle<CR>

" colorscheme
set t_Co=256
colorscheme jellybeans-X

" give the command line bash-like bindings
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <C-u>  <C-e><C-u>

" status line stuff 
set noruler
set laststatus=2
set statusline=
"set statusline+=%#tabline#
set statusline+=%=
"set statusline+=[%{fugitive#statusline()}]
"set statusline+=%#statuscustom#
set statusline+=[%t
"set statusline+=%#statusstatus#
set statusline+=%H%M%R%W
"set statusline+=%#statuscustom#
set statusline+=]
"set statusline+=%#tabline#
set statusline+=\ [%P\ %c]
set statusline+=


" dont have to scroll all the way to top or bottom anymore
set scrolloff=5

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif
