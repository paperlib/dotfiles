
" personal (plugins), regional or machine specific hacks.

" international/ch keyboard hack - map à, è to {, [ etc.
" using Autohotkey on Windows & Keyboard Maestro on May.

" https://github.com/tpope/vim-commentary
nmap - <Plug>CommentaryLine
vmap - <Plug>Commentary

" https://github.com/tpope/vim-fugitive
nmap <leader>gd :Gvdiffsplit<cr>
" view git history - in a vertical split to the right of the file viewed
" hit <cr> on a given commit to view the details of that commit
" hit <ctrl-o> to go back
nmap <silent> <leader>gh :bo vertical Git log %<cr><bar>:setlocal nobuflisted<cr>
" git status
nmap <silent> <leader>gs :bo vertical Git<cr><bar>:setlocal nobuflisted<cr>
" git add & commit the current file
nmap <leader>gg :bo vertical Git commit %<cr>

" surrounding text between quotes, double quotes etc.
" https://github.com/machakann/vim-sandwich
"
" we want vim sandwich to have the same behaviour as vim surround when
" enclosing with brackets, that is: add inside spaces on opening brackets
" > this needs to happen *after* sandiwch has loaded.. hence "VimEnter" <
" see: https://github.com/machakann/vim-sandwich/wiki/Bracket-with-spaces
" and: https://stackoverflow.com/questions/6821033/vim-how-to-run-a-command-immediately-when-starting-vim
" -->  de-activating: this seems to completely f*up "srb" mappings for some reason..... :-(
" autocmd VimEnter *
"   \  let g:sandwich#recipes = deepcopy( get(g:, 'sandwich#default_recipes', []) ) |
"   \  let g:sandwich#recipes += [
"   \        {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
"   \        {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
"   \        {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']}
"   \      ]

vmap " sa"
vmap ' sa'
vmap [ sa[
vmap { sa{
vmap ( sa(
vmap ] sa]
vmap } sa}
vmap ) sa)

" -- remapping these has too many issues (specially ")
" -- -> rethink how to do this ... !
" -- -> re-activate: let' see
nmap " srb"
nmap ' srb'
nmap [ srb[
nmap { srb{
nmap ( srb(
nmap ] srb]
nmap } srb}
nmap ) srb)

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

" select using arrow keys - hack for (old) putty!!! ------------.
" having this in *hacks* bc it fucks up vim under other terms --.
" Old putty = a putty without the xterm-style bitmap option   --.
" -> and have it commented out bc it's for old putty anyway   --.
" -> only enable if needed - ie. only if you only have old putty.
" nnoremap <esc>[A v<up>
" nnoremap <esc>[B v<down>
" nnoremap <esc>[C v<right>
" nnoremap <esc>[D v<left>

" vnoremap <esc>[A <up>
" vnoremap <esc>[B <down>
" vnoremap <esc>[C <right>
" vnoremap <esc>[D <left>

" newer putty ... with xterm-bitmap enabled?
nnoremap <esc>[1;2A v<up>
nnoremap <esc>[1;2B v<down>
nnoremap <esc>[1;2C v<right>
nnoremap <esc>[1;2D v<left>

vnoremap <esc>[1;2A <up>
vnoremap <esc>[1;2B <down>
vnoremap <esc>[1;2C <right>
vnoremap <esc>[1;2D <left>

