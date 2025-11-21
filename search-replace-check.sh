function search_replace_check() {
  # Check for the correct number of arguments
  if [ "$#" -ne 4 ]; then
    echo "Error: Usage: search_replace_check <file> <pattern> <replacement> <expected_count>" >&2
    return 1
  fi

  local file="$1"
  local pattern="$2"
  local replacement="$3"
  local expected_count="$4"
  local temp_file=$(mktemp)
  local actual_count=0
  local sed_command=""

  # --- 1. COUNT THE OCCURRENCES (PASS 1) ---
  # Use grep -o to count non-overlapping matches of the pattern in the file.
  # This works well for simple strings but can be complex for intricate regex.
  actual_count=$(grep -o "$pattern" "$file" | wc -l)
  
  if [ $? -ne 0 ]; then
      echo "Error: Failed to count pattern occurrences using grep on $file." >&2
      rm -f "$temp_file"
      return 1
  fi

  # --- 2. COMPARE THE COUNTS ---
  if [ "$actual_count" -ne "$expected_count" ]; then
    echo "Error: Replacement count mismatch in $file." >&2
    echo "  pattern: $pattern" >&2
    echo "  replacement: $replacement" >&2
    echo "  Expected: $expected_count" >&2
    echo "  Actual: $actual_count" >&2
    rm -f "$temp_file"
    return 2 # Return a specific error code for count mismatch
  fi

  # --- 3. PERFORM THE SEARCH AND REPLACE (PASS 2) ---
  # Construct the sed substitution command
  # Use '&' as a delimiter to avoid conflicts with '/'
  sed_command="s/${pattern}/${replacement}/g"
  
  # Execute the sed command, writing the modified content to the temporary file
  # Note: The backslash before the first '&' in the sed command may be needed 
  # depending on the shell, but standard practice is often fine without it here.
  sed "$sed_command" "$file" > "$temp_file"
  
  if [ $? -ne 0 ]; then
      echo "Error: Failed to execute search and replace with sed on $file." >&2
      rm -f "$temp_file"
      return 1
  fi

  # --- 4. OVERWRITE THE ORIGINAL FILE ---
  mv "$temp_file" "$file"
  
  echo "Successfully replaced $actual_count instances in $file."
  return 0
}