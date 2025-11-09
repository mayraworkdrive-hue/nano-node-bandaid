
reset;

#!/bin/bash

# 1. Get the absolute path of the current directory (where the script is run from)
CURRENT_DIR=$(pwd)

# 2. Navigate up two levels to get the Grandparent's full path
# dirname on the current dir gives the parent (e.g., /a/b/c -> /a/b)

GRANDPARENT_PATH=$(dirname "$CURRENT_DIR")

# 3. Extract just the name of the grandparent directory from its path
GRANDPARENT_NAME=$(basename "$GRANDPARENT_PATH")

# 4. Set the GitHub environment variable (or just export the value for local use)
# NOTE: To make this variable available to OTHER scripts/processes, you must 'export' it.
# In a GitHub Action, you'd write it to $GITHUB_ENV.
export GITHUB_REPOSITORY_OWNER="$GRANDPARENT_NAME"

# Verification (optional)
echo "Current Directory: $CURRENT_DIR"
echo "Grandparent Path: $GRANDPARENT_PATH"
echo "Grandparent Name (Value for env var): $GRANDPARENT_NAME"
echo "GITHUB_REPOSITORY_OWNER is now set to: $GITHUB_REPOSITORY_OWNER"

rm -rf banano_build;
git clone -c advice.detachedHead=false --depth 1 --branch releases/v28 https://github.com//$GITHUB_REPOSITORY_OWNER/banano.git banano_build;

./bandaid.sh
