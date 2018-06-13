#!/bin/bash
__DIRNAME="$(cd "${0%/*}"; pwd)"	# Absolute path of the directory containing this script (NOTE: '$(dirname $0)' is vulnerable to many '../..' components)

if [ "$(uname -s)" == "Darwin" ]; then
	VLCRC_DIR="${HOME}/Library/Preferences/org.videolan.vlc"
else
	VLCRC_DIR="${HOME}/.config/vlc"
fi

mkdir -p "${VLCRC_DIR}"
rm -f "${VLCRC_DIR}/vlcrc"

# VLC constantly re-writes over vlcrc, so keep custom settings in vlcrc.additions and just append them to the end when installing
cat "${__DIRNAME}/vlcrc.additions" >> "${__DIRNAME}/vlcrc"

ln -sf "${__DIRNAME}/vlcrc" "${VLCRC_DIR}/vlcrc"
