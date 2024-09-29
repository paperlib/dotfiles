# -- a nice and simple git prompt
# -- adapt path to wherever "git-prompt.sh" is.
. /usr/local/git/contrib/completion/git-prompt.sh

# -- https://robotmoon.com/256-colors
# -- https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# -- https://zipcon.net/~swhite/docs/computers/linux/shell_prompts.html
COLOR_GIT_SIGN='\[\033[01;38;5;230m\]'
COLOR_GIT_BRANCH='\[\033[01;38;5;028m\]'
COLOR_GIT_DIRTY='\[\033[01;38;5;215m\]'
COLOR_RESET='\[\033[0m\]'

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

function git_prompt() {
  branch=$(__git_ps1 '%s')
  if [[ "$branch" ]]; then
    branch=${branch/\%/+}
    echo "${COLOR_GIT_SIGN} ${COLOR_GIT_BRANCH}${branch/ / $COLOR_GIT_DIRTY} $COLOR_RESET"
  fi
}

function prompt() {
  # -- include support for conda if we have it installed.
  PS1="${CONDA_PROMPT_MODIFIER}\h:\u [ \w $(git_prompt)] \$ "
}

PROMPT_COMMAND=prompt
