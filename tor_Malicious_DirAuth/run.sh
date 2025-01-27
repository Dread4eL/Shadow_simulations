#!/usr/bin/env bash
set -euo pipefail

# first argument is the path to shadow
if [ "$#" -ge 1 ]; then
    echo "Prepending $1 to PATH"
    export PATH="$1:${PATH}"
fi

# ANCHOR: body
# delete any existing simulation data
rm -rf shadow.data/
shadow --template-directory shadow.data.template shadow.yaml > shadow.log
# ANCHOR_END: body