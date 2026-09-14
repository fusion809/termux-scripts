function ssh_desktop {
	TERM=xterm-256color sshpass -f $HOME/.cache/desktop ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -t "fusion809@100.122.211.37" "$@"
}

function ssh_lfs {
	ssh_desktop "zsh -ic 'ssh_lfs'"
}
