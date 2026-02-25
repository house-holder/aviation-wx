#!/usr/bin/env bash

LOCAL_BIN=${HOME}/.local/bin

G='\033[0;32m'
NC='\033[0m'

OK() { echo -e "${G}✓${NC} $1"; }

copy_file() {
	cp avwx ${LOCAL_BIN}
	OK "Copied to user local executable dir: ${LOCAL_BIN}"
}

echo "Installing script..."

if [[ -f "${LOCAL_BIN}/avwx" ]]; then
	repo_filesize=$(stat -c %s "avwx")
	exe_filesize=$(stat -c %s "${LOCAL_BIN}/avwx")

	if [[ "$repo_filesize" -ne "$exe_filesize" ]]; then
		echo "File change detected. ${repo_filesize} ${exe_filesize}"
		copy_file
	else
		OK "File already exists in local executable dir: ${G}${LOCAL_BIN}${NC}"
	fi
else
	copy_file
fi

OK "Use with '${G}avwx [command] [station]${NC}'"
echo -e "   or set default in ${G}${HOME}/.config/avwx.cfg${NC}"

