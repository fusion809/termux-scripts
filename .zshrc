function ohmup {
    git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
    cd ~
    git clone https://github.com/fusion809/zsh-theme
    ln -sf $PWD/zsh-theme/*/*.zsh-theme ~/.oh-my-zsh/themes/
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/plugins/zsh-history-substring-search
}

if ! [[ -d $HOME/.oh-my-zsh ]]; then
    ohmup
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX="true"
export ZSH_THEME="handroid"

# Plugins
plugins=(git zsh-syntax-highlighting safe-paste github vi-mode zsh-autosuggestions)


autoload -U compinit && compinit
source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#
# # bind UP and DOWN arrow keys (compatibility fallback
# # for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey 'Esc' autosuggest-accept
# Use vi keybindings
bindkey -v
source $ZSH/oh-my-zsh.sh

function szsh {
    source ~/.zshrc
}

function vzsh {
    vim ~/.zshrc
}

function pkgs {
    pkg search "$@"
}

function pkgi {
    pkg install "$@"
}

function pkgr {
    pkg remove "$@"
}

function gup {
    cd ~/termux-scripts
    git pull origin master
}

function pull {
    git pull origin $(git rev-parse --abbrev-ref HEAD)
}

function julin {
    wget https://its-pointless.github.io/setup-pointless-repo.sh
    bash setup-pointless-repo.sh
    pkg install julia
}

function quickjupup {
	wget -c https://github.com/its-pointless/gcc_termux/raw/master/julia_1.5.1_aarch64.deb
	dpkg -i julia_1.5.1_aarch64.deb
}
