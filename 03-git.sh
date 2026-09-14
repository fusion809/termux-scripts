function repo_name {
	git remote -v | rev | cut -d '/' -f 1 | rev | sed 's/\.*git.*//g'
}

function gitsw {
	git remote rm origin
	git remote add origin git@github.com:fusion809/$(repo_name).git
}

function git_branch {
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
	git push origin $(git_branch) -f
}
