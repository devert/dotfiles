# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Informative Git Prompt
# https://github.com/magicmonty/bash-git-prompt
[ -f ~/.bash-git-prompt/gitprompt.sh ] && source ~/.bash-git-prompt/gitprompt.sh

# NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# git-flow tab completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion