eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=$HOME/.git-fuzzy/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin:$PATH

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

alias code='open -a Visual\ Studio\ Code'
alias build-ghidra='./${HOME}/Developer/etc/scripts/ghidra-build.sh'

if [[ -f /usr/share/applications/code.desktop && -f /mnt/hgfs/vm-tunnel/dotfiles/etc/code_launcher ]]; then
	alias patch-code-launcher="sudo sed -i 's|Exec=/usr/share/code/code|Exec=/mnt/hgfs/vm-tunnel/dotfiles/etc/code_launcher|' /usr/share/applications/code.desktop"
fi
