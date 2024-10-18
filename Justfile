#!/usr/bin/env -S just --justfile

# set shell configurations
set windows-shell := ["powershell"]
set shell := ["bash", "-cu"]

# default target: list all tasks with updated information
_default:
    just --list -u

# setup environment
setup:
  just install
  @echo '✅ Setup complete!'

# install
install:
  just _install npm
  just _install yarn
  just _install pnpm
  @echo '✅ Install complete!'

# build
build:
  just _build npm
  just _build yarn
  just _build pnpm
  @echo '✅ Build complete!'

# release
release:
  npx bumpp npm/package.json yarn/package.json pnpm/package.json
  @echo '✅ Release complete!'

# install extension using pm
[private]
_install pm:
  {{ if pm == "npm" { "cd npm && npm install" } else if pm == "yarn" { "cd yarn && yarn install" } else if pm == "pnpm" { "cd pnpm && pnpm install" } else { "echo 'Invalid package manager'" } }}

# build extension using pm
[private]
_build pm:
  {{ if pm == "npm" { "cd npm && npm run build" } else if pm == "yarn" { "cd yarn && yarn build" } else if pm == "pnpm" { "cd pnpm && pnpm build" } else { "echo 'Invalid package manager'" } }}
