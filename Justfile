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
  just run-in-pm npm install
  just run-in-pm yarn install
  just run-in-pm pnpm install
  @echo '✅ Install complete!'

# build
build:
  just run-in-pm npm 'run build'
  just run-in-pm yarn 'run build'
  just run-in-pm pnpm 'run build'
  @echo '✅ Build complete!'

# release
release:
  npx bumpp npm/package.json yarn/package.json pnpm/package.json
  @echo '✅ Release complete!'

[private]
@download-artifact pm id:
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    /repos/luxass/test-vscode-extensions/actions/artifacts/{{id}}/zip >> test-vsix-folder/{{pm}}.zip
  @echo '✅ Downloaded {{id}} artifact complete'


[private]
run-in-pm pm command:
    #!/usr/bin/env bash
    set -euo pipefail
    case "{{pm}}" in
      "npm")
        cd npm && npm {{command}}
        ;;
      "yarn")
        cd yarn && yarn {{command}}
        ;;
      "pnpm")
        cd pnpm && pnpm {{command}}
        ;;
      *)
        echo 'invalid package manager'
    esac
