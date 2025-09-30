if [[ `uname` == "Darwin" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.git-fuzzy/bin:$PATH

if [[ `uname` == "Darwin" ]]; then
	export PATH=$HOME/Library/Python/3.9/bin:$PATH
	export PATH=/opt/homebrew/opt/llvm/bin:$PATH
fi

if [[ `uname` == "Linux" ]]; then
	export PATH=$HOME/.docker/bin:$PATH
	export PATH=$HOME/.local/bin:$PATH
	export PATH=/opt/ghidra/:$PATH
fi

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=

source $ZSH/oh-my-zsh.sh

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

if type fzf >/dev/null 2>&1; then
	if [[ `uname` == "Darwin" ]]; then
		source <(fzf --zsh)
	fi
fi

if [[ `uname` == "Darwin" ]]; then
	alias code='open -a Visual\ Studio\ Code'
	if [[ `hostname` != "jpc.dev" ]]; then
		alias spell="osascript ${HOME}/Developer/etc/scripts/spell.applescript"
	fi
fi

alias build-ghidra='${HOME}/Developer/dotfiles/ghidra/build-ghidra.sh'

LNK=/usr/share/applications/code.desktop
if [[ `uname` == "Linux" && -f $LNK ]]; then
	if [[ -f "${HOME}/Developer/dotfiles/vscode/code_launcher" ]]; then
		LAUNCHER="${HOME}/Developer/dotfiles/vscode/code_launcher"
		alias patch-launcher="sudo sed -i 's|Exec=/usr/share/code/code|Exec=${LAUNCHER}|' $LNK"
	fi
fi
