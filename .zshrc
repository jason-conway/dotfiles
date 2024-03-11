export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=$HOME/.git-fuzzy/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=

source $ZSH/oh-my-zsh.sh

# User configuration
if type eza >/dev/null 2>&1; then
	alias ls='eza'
elif type exa >/dev/null 2>&1; then
	alias ls='exa'
fi

if type micro >/dev/null 2>&1; then
	alias nano='micro'
fi
export EDITOR=nano

if type batcat >/dev/null 2>&1; then
	alias bat='batcat'
fi

if type fdfind >/dev/null 2>&1; then
	alias fd='fdfind'
fi
