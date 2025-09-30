#!/usr/bin/env bash

set -e

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"
INFO="${GREEN}[info]${NC}"
ERROR="${RED}[error]${NC}"

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
    echo -e "${ERROR} ghidraRun not found in PATH" >&2
    exit 1
fi

ghidra_dir="$(get_ghidra_path)"
if [[ $? -ne 0 || -z "$ghidra_dir" ]]; then
    echo -e "${ERROR} failed to locate Ghidra installation" >&2
    exit 1
fi

echo -e "${INFO} found Ghidra installation at: ${ghidra_dir}"

gradle_cmd="gradle"
if ! type gradle >/dev/null 2>&1; then
    gradlew="${ghidra_dir}/support/gradle/gradlew"
    if [[ -f "$gradlew" ]]; then
        gradle_cmd="$gradlew"
    else
        exit 1
    fi
else
    echo -e "${INFO} using system installation of Gradle"
fi

build_dirs=("${ghidra_dir}/support/gradle" "${ghidra_dir}/GPL")
for d in "${build_dirs[@]}"; do
    if [[ ! -d "$d" ]]; then
        echo -e "${ERROR} build directory not found: $d" >&2
        continue
    fi
    if ! cd "$d"; then
        exit 1
    fi
    if ! $gradle_cmd buildNatives; then
        echo -e "${ERROR} build failed" >&2
        exit 1
    fi
done

echo -e "${INFO} build successful"
