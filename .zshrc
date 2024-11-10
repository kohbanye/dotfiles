# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# pure theme
autoload -Uz promptinit
promptinit
prompt pure

# alias
alias dc="docker compose"
alias gco="git checkout"
alias gcm="git commit -m"

# ssh-agent
eval $(ssh-agent) &>/dev/null
ssh-add &>/dev/null

# add zls path
export PATH="/usr/local/zls/zls:$PATH"

# add llvm path
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# for SDL2
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"

# add rust path
export CARGO_HOME="/Users/kohbanye/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# add deno path
export DENO_INSTALL="/Users/kohbanye/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# for running rustfmt from source
export DYLD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH

# rye (python package manager)
source "$HOME/.rye/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
