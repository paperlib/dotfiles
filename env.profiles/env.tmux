
# -- a few twicks to tmux default command line intereaction
# --
# -- every time we run "tmux" (without arguments) creates a new session
# -- -> change this so that it enters a one "defaut" session instead
# --    (creates that "default" session if it doesn't exist)
# -- also:
# --    tweak "new <session>" so that it either attaches to that <session>
# --    or creates it if it doesn't exist

tmux () {
  if [[ -z $1 ]] ; then
    command tmux new -A -s default
  else
    if [[ "$1" == "new" ]] ; then
      shift
      command tmux new -A -s $@
    else
      command tmux $@
    fi
  fi
}

