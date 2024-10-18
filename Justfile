#!/usr/bin/env -S just --justfile

# set shell configurations
set windows-shell := ["powershell"]
set shell := ["bash", "-cu"]

# default target: list all tasks with updated information
_default:
    just --list -u

# setup environment
setup:
  just install-npm
  @echo '✅ Setup complete!'


install-npm:
  cd ./npm && npm install
  @echo '✅ NPM installed!'
