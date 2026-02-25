#!/usr/bin/env bash

LOCAL_BIN=${HOME}/.local/bin

G='\033[0;32m'
NC='\033[0m'

OK() { echo -e "${G}✓${NC} $1"; }

echo "Installing script to local environment..."

if [[ -d $LOCAL_BIN ]]; then
	OK "Found ${LOCAL_BIN}"
fi

if [[ -f "${LOCAL_BIN}/afd" ]]; then
	OK "File already exists in local executable dir: ${G}${LOCAL_BIN}${NC}"
else
	cp afd ${LOCAL_BIN}
	OK "Copied to user local executable dir: ${LOCAL_BIN}"
fi

OK "Use with '${G}afd [station]${NC}' or set default in ${G}${HOME}/.config/afd.cfg${NC}"

