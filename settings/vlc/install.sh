#!/bin/bash
__DIRNAME="$(cd "${0%/*}"; pwd)"	# Absolute path of the directory containing this script (NOTE: '$(dirname $0)' is vulnerable to many '../..' components)

SETTINGS_FILENAME="vlcrc"

if [ "$(uname -s)" == "Darwin" ]; then
	SETTINGS_DIR="${HOME}/Library/Preferences/org.videolan.vlc"
else
	SETTINGS_DIR="${HOME}/.config/vlc"
fi

mkdir -p "${SETTINGS_DIR}"
rm -f "${SETTINGS_DIR}/${SETTINGS_FILENAME}"

# VLC constantly re-writes over vlcrc, so keep custom settings in vlcrc.additions and just append them to the end when installing
cat "${__DIRNAME}/${SETTINGS_FILENAME}.additions" >> "${__DIRNAME}/${SETTINGS_FILENAME}"

ln -sf "${__DIRNAME}/${SETTINGS_FILENAME}" "${SETTINGS_DIR}/${SETTINGS_FILENAME}"
