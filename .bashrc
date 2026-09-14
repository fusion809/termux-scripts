#!/data/data/com.termux/files/usr/bin/bash
function git-branch {
	if ! [[ -n "$1" ]]
	then
		git rev-parse --abbrev-ref HEAD
	else
		git -C "$1" rev-parse --abbrev-ref HEAD
	fi
}

function push {
	git add --all
	git commit -m "$@"
	git push origin $(git-branch) -f
}

function sbash {
	source $HOME/.bashrc
}

function ssh_desktop {
	TERM=xterm-256color sshpass -f $HOME/.cache/desktop ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -t "fusion809@100.122.211.37" "$@"
}

function ssh_lfs {
	ssh_desktop "zsh -ic 'ssh_lfs'"
}

function vbash {
	vim $HOME/.bashrc
}
