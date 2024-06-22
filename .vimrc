
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

" cursor style -----.
set guicursor=i:block

" yes even python should abide to my indenting preferences
" https://stackoverflow.com/questions/64676540/vim-doesnt-respect-vimrc-indentation-settings
let g:python_recommended_style = 0

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
set smartcase

nmap <silent> ,. :nohlsearch<CR>

" show tabs, trailing whitespace & invisible spaces.
set list " ----------------------------------------.
set listchars=tab:>.,trail:.,extends:#,nbsp:. " ---.

" enable mouse and the usual copy/paste behaviours.
set mouse=nv " -----------------------------------.
set clipboard^=unnamed,unnamedplus " -------------.
nnoremap <c-a> ggVG
vnoremap <c-c> y
vnoremap <c-x> d
" paste from what we last yanked, not from last deletions - do we want this?
" https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
" and now setup the normal paste shortcuts.
" notes on remapping ctrl-v:
" https://github.com/paperlib/dotfiles#heart-vimrc-gimme-normal-shortcuts
" -- see also additional information here:
" https://vimhelp.org/gui_w32.txt.html#CTRL-V-alternative
" https://searene.github.io/2015/12/25/map-Ctrl-V-as-Ctrl-Q-in-vim
" https://stackoverflow.com/questions/426896/vim-ctrl-v-conflict-with-windows-paste
" NOTE: this cross-platform clipboard shit in vim/neovim is such a headache!
" references:
" https://stackoverflow.com/questions/2861627/paste-in-insert-mode
" vim's clipboard "unnamed" and "unnamedplus": https://stackoverflow.com/q/30691466/4397909
" https://learnvim.irian.to/basics/registers
" https://renenyffenegger.ch/notes/development/vim/script/vimscript/functions/has
nnoremap <c-v> P

if has("clipboard")
  inoremap <c-v> <c-r>+
  cnoremap <c-v> <c-r>+
else
  inoremap <c-v> <c-r>"
  cnoremap <c-v> <c-r>"
endif

" in neovim >0.9 pastetoggle has been deprecated
" *but* we do have cases where the 'Just Paste It(tm)' doesn't work:
" https://stackoverflow.com/questions/76687544/emulate-pastetoggle-in-neovim
" luckily `paste` while deprecated still works, so bringing this back for all
" (ie. this works in both neovim *and* vim)
nnoremap <silent> <f5> :set paste!<cr>
inoremap <silent> <f5> <esc>:set paste!<cr>i
" do note the :redrawstatus here: force redraw to immediatly update the status line
map <silent> <f9> :let b:filemetaline=!get(b:, 'filemetaline', 0)<cr>:redrawstatus<cr>

" select using arrow keys!
nnoremap <s-up> V
nnoremap <s-down> V
nnoremap <s-right> v<right>
nnoremap <s-left> v<left>

vnoremap <s-up> <up>
vnoremap <s-down> <down>
vnoremap <s-right> <right>
vnoremap <s-left> <left>

" https://www.reddit.com/r/vim/comments/165ot5/what_are_your_favorite_visual_mode_commandstricks
" how cool would it be to simply *move* your selection left or right
" with just the arrow keys? so let's configure just that ;-)
vnoremap <right> >gv
vnoremap <left>  <gv

" and here the same for moving the selected text up & down
" * stolen from ThePrimaegen here: https://youtu.be/w7i4amO_zaE?t=1530
vnoremap <up>   :m '<-2<cr>gv=gv
vnoremap <down> :m '>+1<cr>gv=gv

" file browser defaults
let g:netrw_banner    = 0
let g:netrw_winsize   = 30
" https://stackoverflow.com/questions/14665170/netrw-open-files-into-tabs-in-opposite-vertical-window
" https://vi.stackexchange.com/questions/20385/lexplore-and-split-windows
let g:netrw_chgwin    = 2
" netrw list tree view (liststyle = 3) is super buggy (specially on Windows.)
" https://www.reddit.com/r/neovim/comments/euxwou/netrw_strange_behavior_in_tree_view
" https://www.reddit.com/r/vim/comments/22ztqp/why_does_nerdtree_exist_whats_wrong_with_netrw
let g:netrw_liststyle = 3 " on Windows never hit "-" (dash) or use liststyle=1.
" how to make netrw start with .files hidden? - use *gh* to show hidden files.
" https://vi.stackexchange.com/q/18650 (WTF again.)
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let mapleader = " "

" toggle the file explorer (opens on the current working directory.)
nnoremap <leader>. :Lexplore<cr>
" open the file explorer (on the directory of the current file.)
nnoremap <leader>, :Lexplore %:p:h<cr>

" windows!
" switch horizontal & vertical splits
nnoremap <leader>v :windo wincmd H<cr>
nnoremap <leader>h :windo wincmd K<cr>

" switch between windows using ctrl-arrows!
map <c-up> <c-w>k
map <c-down> <c-w>j
map <c-right> <c-w>l
map <c-left> <c-w>h

" switch between buffers
nnoremap <expr> <tab>   &filetype != 'netrw' ? ':bn<cr>' : ''
nnoremap <expr> <s-tab> &filetype != 'netrw' ? ':bp<cr>' : ''

" use this instead of <esc> in visual mode -------------.
" somehow this reacts faster than hitting <esc> directly.
vnoremap <leader><leader> <esc>

" -- cursor.
" -- cursor - position.
if has("autocmd")
  augroup restoreCursor
  au!

  " restore last cursor position - when coming back to the same file
  " https://opensource.apple.com/source/vim/vim-47/runtime/vimrc_example.vim.auto.html
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif

" -- cursor - style.
set guicursor=i:block

" load personal, regional or machine specific hacks.
silent! source ~/.local/dotfiles/hacks/vim/keyboard.hacks.vim

" finally - let's get real ---------------------------------.
if has('nvim')  " -- let's setup a real IDE/PDE for VI. ---.
  silent source ~/.local/dotfiles/hacks/neovim/bootstrap.lua
endif  " -- yep this is neovim! ----------------------------.
