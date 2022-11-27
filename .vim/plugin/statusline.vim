
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

set statusline+=\ %f
set statusline+=\ 
set statusline+=%{GitBranch()}
set statusline+=%#ErrorMsg#%{&modified?(&readonly?'[RO]':''):''}
set statusline+=%#StatusLine#%{!&modified?(&readonly?'[RO]':''):''}
set statusline+=%#StatusLine#
set statusline+=%{&readonly?'\ ':''}
set statusline+=%m
set statusline+=%=
set statusline+=%c%V
set statusline+=,
set statusline+=%l
set statusline+=\ \ \ \ 
set statusline+=%-04P

" git branch
let b:git_branch = ""
" https://www.reddit.com/r/vim/comments/pq3xwa/how_to_get_the_git_branch_in_the_statusline/
" https://wenijinew.medium.com/vim-show-git-branch-name-in-status-line-87d942234c21
" https://stackoverflow.com/questions/9852869/annoying-vim-tab-line-labels

let g:devnull = has('win32') ? 'NUL' : '/dev/null'

function! s:get_branch()
  let s:branch_name = trim(system("git -C " . expand("%:h") . " branch --show-current 2> " . g:devnull))

  if !empty(s:branch_name)
    let b:git_branch = '(' . s:branch_name . ') '
  else
    let b:git_branch = ''
  endif
endfunction

function! GitBranch()
  return b:git_branch
endfunction

:autocmd BufCreate * call s:get_branch()
:autocmd BufEnter  * call s:get_branch()

