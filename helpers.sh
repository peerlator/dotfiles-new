#!/bin/bash

function echo_error() {
  printf '\n\033[31mERROR:\033[0m %s\n' "$1"
}

function echo_warning() {
  printf '\n\033[33mWARNING:\033[0m %s\n' "$1"
}

function echo_done() {
  printf '\n\033[32mDONE:\033[0m %s\n' "$1"
}

function echo_info() {
  printf '\n\033[36m%s\033[0m\n' "$1"
}

function _update() {
  if [[ $1 != "system" ]]; then
    echo_info "Updating system packages..."
    "$PKGMN" "$PKGU" "${PKGOPT[@]}"
  else
    echo_info "Updating ${1}..."
    "$PKGMN" "$PKGI" "$1"
  fi
}

function _install() {
  for pkg in "${PKG[@]}"; do
    echo_info "Installing ${pkg}..."
    "$PKGMN" "$PKGI" "$pkg" "${PKGOPT[@]}"
    echo_done "${pkg} installed!"
  done
}

function _run_install_files() {
  for filename in $(echo $HOME/.dotfiles/**/install.sh | tr " " "\n")
  do
      source $filename
  done
}