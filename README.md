# .dotfiles

User friendly configurations

## Vim for developers

You know how with `vim` you're supposed to... _not use arrow keys_, _and use <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd> instead_,
or _not use windows/mac copy/paste shortcuts_, but use <kbd>y</kbd>, <kbd>y</kbd> <kbd>y</kbd>, <kbd>p</kbd> and whatnot instead, sure...
but guys, what the fuck? **Vim is great** and I want to use it like a _normal developer_, **and whatever I can do to minimize
muscle memory and brain power, I will do, so that I can then use that very memory and brain power somewhere else instead!**

So here we go...

### :heart: [`.vimrc`](.vimrc): gimme normal shortcuts!
Let's start with _I don't want to memorize yet another set of copy/paste shortcuts!_<br>
(great achievement.. I know..., no no..., I mean _really..._ [I know...](https://github.com/paperlib/dotfiles/blob/d0989f85ab1a01018b7398a43686eb6c8e8ac8a1/.vimrc#L48))

* Use <kbd>Ctrl</kbd> <kbd>a</kbd> to select all
* Use <kbd>Ctrl</kbd> <kbd>c</kbd> to copy the selection
* Use <kbd>Ctrl</kbd> <kbd>x</kbd> to cut the selection
* Use <kbd>Ctrl</kbd> <kbd>v</kbd> to paste
  > Btw since now this <kbd>Ctrl</kbd> <kbd>v</kbd> is mapped to paste, we use <kbd>Ctrl</kbd> <kbd>q</kbd> to switch to visual block mode.<br>
  >
  > Note: even though [Vim's documentation](https://vimhelp.org/gui_w32.txt.html#CTRL-V-alternative) states <kbd>Ctrl</kbd> <kbd>q</kbd>
  > can be used as an alternative to <kbd>Ctrl</kbd> <kbd>v</kbd>, terminals often have <kbd>Ctrl</kbd> <kbd>q</kbd> mapped to <code>stty&nbsp;start</code>,
  > so if you do want to be able to use this alternative, you have to disable <code>stty&nbsp;start</code> by adding a <code>stty&nbsp;start&nbsp;undef</code>
  > to your `.bashrc` or `.profile`

If we want to be able to copy something, we need to be able to select something.
How about being able to select like you would in any other editor?
Yes yes, I mean like you know, using shift arrow keys
(again this is pure _anathema_ I know...)
* Use <kbd>⇧ Shift</kbd> <kbd>↑</kbd> to start selecting from where you are upwards
* Use <kbd>⇧ Shift</kbd> <kbd>→</kbd> to start selecting from where you are leftwards
* Use <kbd>⇧ Shift</kbd> <kbd>↓</kbd> to start selecting from where you are downwards
* Use <kbd>⇧ Shift</kbd> <kbd>←</kbd> to start selecting from where you are rightwards
  > Of course all of this combines with any of [vim's language](https://danielmiessler.com/study/vim/#language) constructs, meaning:
  > * <kbd>⇧ Shift</kbd> <kbd>→</kbd> + <kbd>$</kbd> will select everything from the cursor position until the end of the line
  > * <kbd>⇧ Shift</kbd> <kbd>↓</kbd> + <kbd>G</kbd> will select everything from the current line to the end of the file
  > * <kbd>⇧ Shift</kbd> <kbd>↑</kbd> + <kbd>g</kbd> + <kbd>g</kbd> to select from the current line to the top of the file
  > * etc etc etc you got the point.

Now with all this stuff selected, how cool would it be if we could "move the selection around"? Like left and right to indent as we see fit,
or up and down.. while matching the indentation of the block code through which we move! (courtesy [The Primeagen here](https://youtu.be/w7i4amO_zaE?t=1530)
if you want to see it in action.)
* Use <kbd>→</kbd> to increase the selected block indentation
* Use <kbd>←</kbd> to decrease the selected block indentation
* Use <kbd>↑</kbd> to move the selection upwards (adjusting to the current block's indentation)
* Use <kbd>↓</kbd> to move the selection downwards (adjusting to the current block's indentation)

### :leaves: a few more shortcuts
You probably know how to open several files in `vim` at once, something like `vim file.one file.two`, right? But what most don't know - and by
most I mean even seasoned professionals for whom `vim` is that horrible editor they just _have_ to use -, so what most don't know is how to flip
through those files once in `vim` (_most_ would just quit `:q` the current file so that the next one pops-up, or just quit all wholesale!)

So what if... we could flip through open files in `vim` with the simplest of shortcuts?
* Use <kbd>⇥ Tab</kbd> to switch over to the next open file
* Use <kbd>⇧ Shift</kbd> <kbd>⇥ Tab</kbd> to switch back to the previous open file<br>
  Alternatively you can also use <kbd>⌃ Control</kbd> <kbd>⇥ Tab</kbd> just like you do to flip through your Google Chrome tabs!
  > and man... please don't tell me you're using tabs to indent, com'on<br>

Next, let's flip through open windows:
* Use <kbd>⌃ Control</kbd> <kbd>→</kbd> to move the cursor to the right hand side window
* Use <kbd>⌃ Control</kbd> <kbd>←</kbd> to move the cursor to the left hand side window
* Use <kbd>⌃ Control</kbd> <kbd>↑</kbd> to move the cursor to the upper window
* Use <kbd>⌃ Control</kbd> <kbd>↓</kbd> to move the cursor to the lower window
  > This is where things get tricky, have a look at [`keyboard.hacks.vim`](hacks/vim/keyboard.hacks.vim) and yes this is where the "I told you so"
  > <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd> dude comes in... but guys - 23 years in - can we move to 21st century keyboards?
  > I know this coming from a guy who wants to use `vim` in the 21st century... WTF :smile: but yeah this is a good moment to remind you,
  > please use [`nvim`](https://neovim.io/), everything is sooo much easier there.

Others:
* Use <kbd>Space</kbd> + <kbd>.</kbd> to toggle the file explorer
  [`netrw`](https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/) on the current working directory
* Use <kbd>Space</kbd> + <kbd>,</kbd> to open the file explorer
  [`netrw`](https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/) on the directory of the current file
* Use <kbd>,</kbd> + <kbd>.</kbd> to clear highlighted searches

### :electric_plug: and finally, a few plugin related shortcuts:

* [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
  - Use <kbd>-</kbd> to comment the current line or selection
  - Use <kbd>-</kbd> to uncomment the current line or selection<br>
    > _yes that's the very same key, used to toggle comments_
* [tpope/vim-surround](https://github.com/tpope/vim-surround) _only active in select `V` mode_
  - Use <kbd>"</kbd> to surround the current selection with double quotes
  - Use <kbd>'</kbd> to surround the current selection with single quotes
  - Use <kbd>[</kbd> to surround the current selection between carrets
  - Use <kbd>{</kbd> to surround the current selection between curly braces
  - Use <kbd>(</kbd> to surround the current selection between parenthesis
  - Use <kbd>]</kbd> to surround the current selection between carrets _without adding a space_
  - Use <kbd>}</kbd> to surround the current selection between curly braces _without adding a space_
  - Use <kbd>)</kbd> to surround the current selection between parenthesis _without adding a space_

**Note**: once cloned you have cloned this repo, to initialize and update the above plugins (git submodules) do:<br>
`git submodule init; git submodule update`

### :herb: Other _standard and very useful_ shortcuts:
* Use <kbd>z</kbd> <kbd>z</kbd> to [center the current line on the screen](https://vi.stackexchange.com/questions/40/how-do-i-center-the-current-line-in-the-screen)<br>Equivalently use <kbd>z</kbd> <kbd>t</kbd> to align the current line to the <b>t</b>op of your terminal, or <kbd>z</kbd> <kbd>b</kbd> for the <b>b</b>ottom
* Use <kbd>⇧ Shift</kbd> <kbd>g</kbd> to go to the end of your file<br>Equivalently use <kbd>g</kbd> <kbd>g</kbd> to do the oposite, ie. go to the top<br>(or if you want more granularity use <kbd>%</kbd>, ie. use <kbd>7</kbd> <kbd>5</kbd> <kbd>%</kbd> go to 75% down the file)
* Use <kbd>v</kbd> <kbd>i</kbd> <kbd>"</kbd> to select everything between double quotes<br>Equivalently replace <kbd>"</kbd> with <kbd>'</kbd> or <kbd>(</kbd> to select everything between quotes or parenthesis<br>(again courtesy of [this Primeagen short](https://www.youtube.com/shorts/uxMfvWPUThE) here)

> above all, please remember: <b>[Vim is a language](https://danielmiessler.com/study/vim/#language)</b> :point_left:<br>
> once you understand that, remembering any shortcuts will be so much easier<br>
> or as someone eloquently quiped on stackoverflow <b>[Your problem with Vim is that you don't grok vi.](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)</b><br>
> (yes yes there is a logic to the whole madness :smiling_face_with_three_hearts: I promess)

### :popcorn: Why `vim`?
Yeah, why the fuck `vim`?
