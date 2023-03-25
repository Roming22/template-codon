#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(
    cd "$(dirname "$0")" >/dev/null || exit 1
    pwd
)
PROJECT_DIR=$(
    cd "$SCRIPT_DIR/../../.." >/dev/null || exit 1
    pwd
)

usage() {
    echo "
Usage:
    ${0##*/} [options]

Build the binary.

Optional arguments:
    -d, --debug
        Activate tracing/debug mode.
    -h, --help
        Display this message.

Example:
    ${0##*/} --debug
" >&2
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
        -d | --debug)
            set -x
            ;;
        -h | --help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown argument: $1"
            usage
            exit 1
            ;;
        esac
        shift
    done
}

build() {
    name="main"
    codon build \
        -release \
        -exe "$PROJECT_DIR/src/$name.py"
    mv "$PROJECT_DIR/src/$name" "$PROJECT_DIR/tools/developer/bin/$name"
}

main() {
    parse_args "$@"
    build
}

if [ "${BASH_SOURCE[0]}" == "$0" ]; then
    main "$@"
fi
