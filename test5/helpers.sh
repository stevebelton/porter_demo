#!/usr/bin/env bash
set -euo pipefail

install() {
  echo Creating Resource Group : $1
}

upgrade() {
  echo Upgrade Entry Point
}

uninstall() {
  echo Uninstall Entry Point
}

# Call the requested function and pass the arguments as-is
"$@"
