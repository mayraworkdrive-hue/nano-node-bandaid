#!/bin/bash

# --- Input Parameters ---
REPO_PATH=$1
OUTPUT_FILENAME=$2
# ------------------------

# 1. Check for required arguments
if [ -z "$REPO_PATH" ] || [ -z "$OUTPUT_FILENAME" ]; then
    echo "Usage: $0 <path_to_git_repo> <output_filename>"
    echo "Example: $0 ~/my-project submodule-commits.txt"
    exit 1
fi

# 2. Define the full path for the output file
OUTPUT_FILE_PATH="./$OUTPUT_FILENAME"

# 3. Check if the repo path is a valid directory
if [ ! -d "$REPO_PATH" ]; then
    echo "❌ Error: Repository path '$REPO_PATH' is not a valid directory."
    exit 1
fi

# 4. Check for .gitmodules file within the repository (optional check, but good for diagnostics)
if [ ! -f "$REPO_PATH/.gitmodules" ]; then
    echo "⚠️ Warning: The repository at '$REPO_PATH' does not appear to have a .gitmodules file."
fi

echo "Gathering submodule status from: **$REPO_PATH**"
echo "Saving output to: **$OUTPUT_FILE_PATH**"

# 5. Clear or create the output file and add a header
# echo "--- Git Submodule Status Report for $REPO_PATH (Generated $(date)) ---" > "$OUTPUT_FILE_PATH"
# echo "" >> "$OUTPUT_FILE_PATH"

# 6. Execute git submodule status safely within a subshell
# This is the crucial fix: the subshell '()' temporarily moves into the REPO_PATH,
# runs the command, and automatically moves back without affecting the script's main environment.
GIT_STATUS_OUTPUT=$(
    # Temporarily change directory to $REPO_PATH.
    # The '2>/dev/null' suppresses any 'cannot change directory' messages.
    cd "$REPO_PATH" 2>/dev/null && \
    # Execute the command
    git submodule status 2>&1
)

# 7. Check for command failure
if [ $? -ne 0 ]; then
    echo "❌ Error running git command. Please ensure the path is a valid Git repository."
    echo "Raw Git Output:"
    echo "$GIT_STATUS_OUTPUT"
    exit 1
fi

# 8. Process the output line by line and save to the file
echo "$GIT_STATUS_OUTPUT" | while read -r line; do
    # Extract the commit hash (first word) and the path (second word)
    commit_hash=$(echo "$line" | awk '{print $1}')
    submodule_path=$(echo "$line" | awk '{print $2}')

    # Remove the leading character if it's '+' or '-' (indicating modification/uninitialized state)
    if [[ "$commit_hash" =~ ^[-+].* ]]; then
        clean_commit_hash=${commit_hash:1}
    else
        clean_commit_hash=$commit_hash
    fi

    # Append the formatted result to the output file
    echo "Submodule: $submodule_path" >> "$OUTPUT_FILE_PATH"
    echo "  Commit Hash: $clean_commit_hash" >> "$OUTPUT_FILE_PATH"
    echo "---" >> "$OUTPUT_FILE_PATH"
done

# 9. Final message
echo "✅ Script complete!"
echo "The submodule list and commit hashes have been successfully saved to **$OUTPUT_FILENAME**."
