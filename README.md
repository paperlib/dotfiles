# .dotfiles

User friendly configurations

## Vim for developers

You know how with `vim` you're supposed to.. _not to use arrow keys_, _and use <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd> instead_,
or _not to use windows/mac copy/paste shortcuts_, and use <kbd>y</kbd>, <kbd>yy</kbd>, <kbd>p</kbd> and whatnot instead..
like guys what the fuck? **Vim is great** and I want to use it like a _normal developer_, **and whatever I can do to minimize
muscle memory and brain power, I will do, so that I can then use that very memory and brain power somewhere else instead**!

So here we go ...

### :heart_on_fire: `.vimrc`: amazing keyboard shortcuts!
Starting with _I don't want to have to memorize yet another set of copy/paste shortcuts_!<br>
(great achievement.. I know..., no no..., I mean _really_ [I know...](https://github.com/paperlib/dotfiles/blob/d0989f85ab1a01018b7398a43686eb6c8e8ac8a1/.vimrc#L48))

* Use <kbd>Ctrl</kbd> <kbd>a</kbd> to select all
* Use <kbd>Ctrl</kbd> <kbd>c</kbd> to copy selection
* Use <kbd>Ctrl</kbd> <kbd>x</kbd> to cut selection
* Use <kbd>Ctrl</kbd> <kbd>v</kbd> to paste

  > Btw since <kbd>Ctrl</kbd> <kbd>v</kbd> is now used to paste, we use <kbd>Ctrl</kbd> <kbd>q</kbd> to switch to visual block mode.<br>
  > Note: even though [Vim's documentation](https://vimhelp.org/gui_w32.txt.html#CTRL-V-alternative) states <kbd>Ctrl</kbd> <kbd>q</kbd>
  > can be used as an alternative to <kbd>Ctrl</kbd> <kbd>v</kbd>, terminals often have <kbd>Ctrl</kbd> <kbd>q</kbd> mapped to <code>stty&nbsp;start</code>,
  > so if you do want to be able to use this alternative, you have to disable <code>stty&nbsp;start</code> by adding a <code>stty&nbsp;start&nbsp;undef</code>
  > to your `.bashrc` or `.profile`

Ok so if we want to copy something, we need to select that something.
How about being able to select like you would in any other editor?
Yes yes, I mean like you know, using shift arrow keys
* Use <kbd>⇧ Shift</kbd> <kbd>↑</kbd> to start selecting from where you are upwards
* Use <kbd>⇧ Shift</kbd> <kbd>→</kbd> to start selecting from where you are leftwards
* Use <kbd>⇧ Shift</kbd> <kbd>↓</kbd> to start selecting from where you are downwards
* Use <kbd>⇧ Shift</kbd> <kbd>←</kbd> to start selecting from where you are rightwards

  > Of course all of this combines with any of [vim's language](https://danielmiessler.com/study/vim/#language) constructs, meaning: 
  > * <kbd>⇧ Shift</kbd> <kbd>→</kbd> + <kbd>$</kbd> will select everything on the current line from the cursor position until the end of the line.
  > * <kbd>⇧ Shift</kbd> <kbd>↓</kbd> + <kbd>G</kbd> will select everything from the current line to the end of the file.
  > * <kbd>⇧ Shift</kbd> <kbd>↑</kbd> + <kbd>g</kbd> + <kbd>g</kbd> to select from the current line to the top of the file
  > * etc etc etc you got the point :smile:

Now with all this stuff selected, how cool would it be if we could "move the selection around"? Like left and right to indent as we see fit,
or up and down.. while matching the indentation of the block code through which we move! (courtesy [The Primeagen here](https://youtu.be/w7i4amO_zaE?t=1530)
if you want to see it in action.)
* Use <kbd>→</kbd> to increase the selected block indentation
* Use <kbd>←</kbd> to decrease the selected block indentation
* Use <kbd>↑</kbd> to move the selection upwards (adjusting to the current block's indentation)
* Use <kbd>↓</kbd> to move the selection downwards (adjusting to the current block's indentation)

With that out of the way, here a few more helpful/basic shortcuts
* Use <kbd>,</kbd> + <kbd>.</kbd> to clear highlighted searches



Note: once cloned, to initialize and update the required submodules do:
```
git submodule init
git submodule update
```
