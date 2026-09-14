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
