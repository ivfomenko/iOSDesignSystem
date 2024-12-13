#!/usr/bin/env bash

#MISE description="Installs mise to the specified version in the mise.toml file."

set -eo pipefail

mise_version=$(grep "min_version =" "mise.toml" | sed 's/min_version = //; s/"//g')

echo "Installing mise version $mise_version. ✅"

curl https://mise.run | MISE_VERSION="v$mise_version" sh

mise install
