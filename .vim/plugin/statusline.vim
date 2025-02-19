
hi NormalMode  gui=bold,reverse
hi InsertMode  gui=bold,reverse
hi ReplaceMode gui=bold,reverse
hi VisualMode  gui=bold,reverse
hi CommandMode gui=bold,reverse

hi NormalMode  cterm=bold,reverse
hi InsertMode  cterm=bold,reverse
hi ReplaceMode cterm=bold,reverse
hi VisualMode  cterm=bold,reverse
hi CommandMode cterm=bold,reverse

let g:currentmode={ "\<C-v>" : 'vb' }

set statusline=

set statusline+=%#NormalMode#%{(mode()==#'n')?'\ \ N\ ':''}
set statusline+=%#InsertMode#%{(mode()==#'i')?'\ \ I\ ':''}
set statusline+=%#ReplaceMode#%{(mode()==#'R')?'\ \ R\ ':''}
set statusline+=%#CommandMode#%{(mode()==#'c')?'\ \ C\ ':''}
set statusline+=%#VisualMode#%{(mode()==#'v')?'\ \ V\ ':''}
set statusline+=%#VisualMode#%{(mode()==#'V')?'\ \ V\ ':''}

set statusline+=%#VisualMode#%{(get(g:currentmode,mode(),'')==#'vb')?'\ \ V\ ':''}
" https://stackoverflow.com/questions/48271865/vim-whats-the-best-way-to-set-statusline-color-to-change-based-on-mode
" display all highlight group names with their own color -> :so $VIMRUNTIME/syntax/hitest.vim

set statusline+=%#StatusLine#

set statusline+=\ %{GetFileOrExplorer()}
set statusline+=\ 
set statusline+=%{GitBranch()}
set statusline+=%#ErrorMsg#%{&modified&&!IsFileExplorer()?(&readonly?'[RO]':''):''}
set statusline+=%#StatusLine#%{!&modified&&!IsFileExplorer()?(&readonly?'[RO]':''):''}
set statusline+=%#StatusLine#
set statusline+=%{&readonly?'\ ':''}
set statusline+=%{&modified?'[+]\ ':''}
set statusline+=%{&paste?'[paste]':''}
set statusline+=%=
set statusline+=%{FileMetaLine()}

set statusline+=\ %9(%c,%l%)
set statusline+=%7P

" file explorer
function! IsFileExplorer()
  return ((&filetype == 'netrw') || (&filetype == 'neo-tree')) ? v:true : v:false
endfunction

function! GetFileOrExplorer()
  if IsFileExplorer()
    return &filetype
  else
    return expand('%@')
  endif
endfunction

" file details
" file format, encoding and type.
" allow for this file meta information to be set globally
let g:filemetaline = 0
" or per buffer / file
let b:filemetaline = 0

function! FileMetaLine()
  let l:filemetaline = get(b:, 'filemetaline', 0) || get(g:, 'filemetaline', 0)
  let l:metaline = &fileformat . " | " . (strlen(&fenc)?&fenc:'none') . " | " . (strlen(&filetype)?&filetype:'none')

  return l:filemetaline && !IsFileExplorer() ? l:metaline : ''
endfunction

" git branch
let b:git_branch = ""
" https://www.reddit.com/r/vim/comments/pq3xwa/how_to_get_the_git_branch_in_the_statusline/
" https://wenijinew.medium.com/vim-show-git-branch-name-in-status-line-87d942234c21
" https://stackoverflow.com/questions/9852869/annoying-vim-tab-line-labels

let g:devnull = has('win32') ? 'NUL' : '/dev/null'

function! s:get_branch()
  let l:git_command  = "cd " . expand("%:p:h") . " 2> " . g:devnull . " && git rev-parse --abbrev-ref HEAD 2> " . g:devnull
  let s:branch_name = substitute(system(l:git_command), '\n', '', 'g')

  if !empty(s:branch_name)
    let b:git_branch = '(' . s:branch_name . ') '
  else
    let b:git_branch = ''
  endif
endfunction

function! GitBranch()
  let git_branch = get(b:, 'git_branch', "")
  return git_branch
endfunction

:autocmd BufCreate * call s:get_branch()
:autocmd BufEnter  * call s:get_branch()

