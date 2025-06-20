#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail -o xtrace

nix-shell --pure --keep CI_CONFIG --keep CI_CLEAN --run ci/scripts/ci.sh shell.nix
