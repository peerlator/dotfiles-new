export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:${PATH}" 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias py_update="$HOME/.dotfiles/python/update.sh"