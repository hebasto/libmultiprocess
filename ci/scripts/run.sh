#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail -o xtrace

[ "${CI_CONFIG+x}" ] && source "$CI_CONFIG"

nix-shell --pure --keep CI_CONFIG --keep CI_CLEAN "${NIX_ARGS[@]+"${NIX_ARGS[@]}"}" --run ci/scripts/ci.sh shell.nix
