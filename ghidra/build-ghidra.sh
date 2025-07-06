#!/usr/bin/env bash

get_ghidra_path() {
    rundir="$(which ghidraRun)"
    [[ -f "${PWD}/${rundir}" ]] && { printf '%s\n' "${PWD}/${rundir}"; return; }

    ! cd "${rundir%/*}" && {
        exit 1
    }

    local full_dir="${rundir##*/}"
    while [[ -L "$full_dir" ]]; do
        full_dir="$(readlink "$full_dir")"
        cd "${full_dir%/*}" || exit
        full_dir="${full_dir##*/}"
    done

    full_dir="$(pwd -P)/${rundir/*\/}"
    full_dir="$(dirname "$full_dir")"
    [[ -e "$full_dir" ]] && printf '%s\n' "$full_dir"
}

if ! type ghidraRun >/dev/null 2>&1; then
    echo "ghidraRun not found in PATH"
    exit 1
fi

if ! type gradle >/dev/null 2>&1; then
    echo "gradle not found in PATH"
    exit 1
fi

ghidra_dir="$(get_ghidra_path)"

build_dirs=("${ghidra_dir}/support/gradle" "${ghidra_dir}/GPL")
for d in "${build_dirs[@]}"; do
    cd "$d"
    gradle buildNatives
done
