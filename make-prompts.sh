#!/bin/bash
# Writes install-prompt-authority.txt, the Non-Agent Authority OS paste, from install-prompt.txt.
#
# install-prompt.txt (the Agent Authority OS) is the one paste anybody edits; every word of it was
# tested (README). The Non-Agent paste is that text with three things changed, and nothing else:
#   - the product's name,
#   - which kmc it downloads (/kmc/coach, the coaches' kit, on Krista's server),
#   - the folder (BOSS-Authority-OS, so it never lands in an agent BOSS-OS folder on the same computer).
# CI fails when the file here is not exactly what this script writes, so edit install-prompt.txt
# and run this, never the generated file.
set -eu
cd "$(dirname "$0")"
sed -e 's/^Install my Agent Authority Operating System\./Install my Authority Operating System./' \
    -e 's#https://kmc-os-server\.vercel\.app/kmc into it#https://kmc-os-server.vercel.app/kmc/coach into it#' \
    -e 's/BOSS-OS/BOSS-Authority-OS/g' \
    install-prompt.txt > install-prompt-authority.txt
# Each change must have happened, or install-prompt.txt was reworded under this script.
grep -q '^Install my Authority Operating System\.' install-prompt-authority.txt
grep -q 'https://kmc-os-server\.vercel\.app/kmc/coach into it' install-prompt-authority.txt
grep -q 'BOSS-Authority-OS' install-prompt-authority.txt
! grep -q 'Agent Authority' install-prompt-authority.txt
