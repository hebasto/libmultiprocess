#!/usr/bin/env bash
set -euo pipefail

cmake --build build -t all tests mpexamples -- -k 0
