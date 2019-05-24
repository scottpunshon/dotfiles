#!/usr/bin/env bash
__DIRNAME="$(cd "${0%/*}"; pwd)"

SETTINGS_FILENAME="settings.json"

if [ "$(uname -s)" == "Darwin" ]; then
	SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
else
	SETTINGS_DIR="${HOME}/.config/Code/User"
fi

mkdir -p "${SETTINGS_DIR}"
rm -f "${SETTINGS_DIR}/${SETTINGS_FILENAME}"

ln -sf "${__DIRNAME}/${SETTINGS_FILENAME}" "${SETTINGS_DIR}/${SETTINGS_FILENAME}"
