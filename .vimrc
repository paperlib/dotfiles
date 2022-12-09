
" If the world were perfect, it wouldn’t be. - Yogi Berra.
" s/the world/VIM/ --------------------------------------.

set nocompatible

" enable syntax highlighting before setting a background.
" -> for some reason this is needed in VIM 7.4 / putty?-.
syntax on

set background=dark
colorscheme gruvbox8_hard

if has('win32') && has('termguicolors')
  set termguicolors
endif

filetype on
filetype indent on
filetype plugin on

set tabstop=2
set shiftwidth=2
set expandtab

" allow backspace to indent back the shift width.
set smarttab " ---------------------------------.
set backspace=indent,eol,start " ---------------.

set number
set cursorline
set laststatus=2
set showmatch

set hlsearch
set incsearch
set ignorecase

nmap <silent> ,. :nohlsearch<CR>

" show tabs, trailing whitespace & invisible spaces.
set list " ----------------------------------------.
set listchars=tab:>.,trail:.,extends:#,nbsp:. " ---.

" enable mouse and the usual copy/paste behaviours.
set mouse=nv " -----------------------------------.
set clipboard^=unnamed,unnamedplus " -------------.
nnoremap <c-a> ggVG
vnoremap <c-c> y
" paste from what we last yanked, not from last deletions - do we want this?
" https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
" and now setup the normal paste shortcuts.
nnoremap <c-v> p
inoremap <c-v> <esc>p
" and ... g'damn paste in command mode !!!
cnoremap <c-v> <c-r>+

set pastetoggle=<f5>

" arrow keys - hack for putty!!!
" TODO: document what the fuck!!
map <esc>[A <up>
map <esc>[B <down>
map <esc>[C <right>
map <esc>[D <left>
" arrow keys - hack for putty!!!
" command mode putty needs this!
cmap <esc>[A <up>
cmap <esc>[B <down>
cmap <esc>[C <right>
cmap <esc>[D <left>

" select using arrow keys!
nnoremap <s-up> v<up>
nnoremap <s-down> v<down>
nnoremap <s-right> v<right>
nnoremap <s-left> v<left>

vnoremap <s-up> <up>
vnoremap <s-down> <down>
vnoremap <s-right> <right>
vnoremap <s-left> <left>

" file browser defaults
let g:netrw_banner    = 0
let g:netrw_liststyle = 3

let mapleader = " "

" windows!
" switch horizontal & vertical splits
nnoremap <leader>h :windo wincmd H<cr>
nnoremap <leader>k :windo wincmd K<cr>

" switch between windows using ctrl-arrows!
map <c-up> <c-w>k
map <c-down> <c-w>j
map <c-right> <c-w>l
map <c-left> <c-w>h

" load personal, regional or machine specific hacks.
silent! source ~/.dotfiles/hacks/vim/keyboard.hacks.vim
