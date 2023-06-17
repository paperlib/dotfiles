
" personal (plugins), regional or machine specific hacks.

" international/ch keyboard hack - map à, è to {, [ etc.
" using Autohotkey on Windows & Keyboard Maestro on May.

" https://github.com/tpope/vim-commentary
nmap - <Plug>CommentaryLine
vmap - <Plug>Commentary

" surrounding text between quotes, double quotes etc.
" https://github.com/machakann/vim-sandwich
vmap " sa"
vmap ' sa'
vmap [ sa[
vmap { sa{
vmap ( sa(
vmap ] sa]
vmap } sa}
vmap ) sa)

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

