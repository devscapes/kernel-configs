#!/usr/bin/env bash
#
# Remove cached source files as provided in source=() array
#

source "$HOME/.config/pacman/makepkg.conf" || source "$HOME/.makepkg.conf"
source "$PWD/PKGBUILD"

for _file in "${source[@]}"; do
    [[ -n ${SRCDEST} && -d ${SRCDEST} ]] && rm -rf "$SRCDEST/$(basename "${_file}")"
    [[ ${_file} == config ]] && continue
    rm -rf ./"$(basename "${_file}")"
done
