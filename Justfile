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
  just install-yarn
  just install-pnpm
  @echo '✅ Setup complete!'

# build
build:
  just build-npm
  just build-yarn
  just build-pnpm
  @echo '✅ Build complete!'

# build npm
build-npm:
  cd ./npm && npm run build
  @echo '✅ NPM build complete!'

# build yarn
build-yarn:
  cd ./yarn && yarn run build
  @echo '✅ Yarn build complete!'

# build pnpm
build-pnpm:
  cd ./pnpm && pnpm run build
  @echo '✅ PNPM build complete!'

# install npm
install-npm:
  cd ./npm && npm install
  @echo '✅ NPM installed!'

# install yarn
install-yarn:
  cd ./yarn && yarn install
  @echo '✅ Yarn installed!'

# install pnpm
install-pnpm:
  cd ./pnpm && pnpm install
  @echo '✅ PNPM installed!'
