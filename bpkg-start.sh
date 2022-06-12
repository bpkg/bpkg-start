#!/bin/bash

usage () {
  echo "bpkg-start [-h] [...args]"
  echo
  echo "Options:"
  echo "  -h|--help      Print this help dialogue and exit"
}

run () {
  local command="$1"
  shift

  if bpkg package commands "$command" >/dev/null; then
    bpkg run "$command" "$@" || return $?
  fi

  return 0
}

bpkg_start () {
  for opt in "$@"; do
    case "$opt" in
      -h|--help)
        usage
        return 0
        ;;
    esac
  done

  run prestart || return $?
  run start || return $?
  run poststart || return $?

  return 0
}

if [[ ${BASH_SOURCE[0]} != "$0" ]]; then
  export -f bpkg_start
else
  bpkg_start "${@}"
  exit 0
fi
