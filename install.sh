#!/bin/sh
_DIRPATH="$(cd "$(dirname "$0")" && pwd -L)"
# Path of the link to the dotfiles repository (all other links will be relative using this)
DOTFILES_SYMLINK="${HOME}/.dotfiles"
DOTFILES_HOME_RELPATH="${DOTFILES_SYMLINK/$HOME\//}"


dryrun=0
while [ $# -gt 0 ]; do
	case "$1" in
		--dryrun|--dry-run)
			echo "Dry-run: not performing any changes"
			dryrun=1
			;;
		*)
			echo "Unknown option: $1"
			exit 1
			;;
	esac
	shift
done


symlink() {
	target="$1"
	link="$2"

	echo "Linking: $link -> $target"

	if [ "$dryrun" -ne 0 ]; then
		return
	elif [ "$link" -ef "$target" ]; then
		# link/file already refers to target
		# NOTE: this doesn't come out as true when passing target is relative to $HOME
		return
	elif [ -e "$link" -a ! -L "$link" ]; then
		# exists and isn't a symbolic link, so backup!
		mv "$link" "${link}.orig"
	elif [ -e "$link" -a -L "$link" ]; then
		# exists and is a symbolic link, so remove to replace with ours
		rm -f "$link"
	fi

	#ln -si "$target" "$link"  # prompt for overwrite (of existing symbolic links)
	ln -s "$target" "$link"
}

link_dotfiles() {
	symlink "${_DIRPATH}" "${DOTFILES_SYMLINK}"

	cd "${_DIRPATH}" || exit 1
	for f in dotfiles/* ; do
		symlink "${DOTFILES_HOME_RELPATH}/${f}" "${HOME}/.$(basename "$f")"
	done
}

link_dirs() {
	symlink "${_DIRPATH}" "${DOTFILES_SYMLINK}"

	cd "${_DIRPATH}" || exit 1
	for f in bin ; do
		symlink "${DOTFILES_HOME_RELPATH}/${f}" "${HOME}/$(basename "$f")"
	done
}


link_dotfiles
link_dirs

