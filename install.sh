#!/usr/bin/env bash

LOCAL_BIN=${HOME}/.local/bin

G='\033[0;32m'
NC='\033[0m'

OK() { echo -e "${G}✓${NC} $1"; }

echo "Installing script..."

if [[ -d $LOCAL_BIN ]]; then
	OK "Found ${LOCAL_BIN}"
fi

if [[ -f "${LOCAL_BIN}/avwx" ]]; then
	OK "File already exists in local executable dir: ${G}${LOCAL_BIN}${NC}"
else
	cp avwx ${LOCAL_BIN}
	OK "Copied to user local executable dir: ${LOCAL_BIN}"
fi

OK "Use with '${G}avwx [command] [station]${NC}'"
echo -e "   or set default in ${G}${HOME}/.config/avwx.cfg${NC}"

