#!/bin/bash

# Read input from stdin
input=$(cat)

# Extract model name
model=$(echo "$input" | jq -r '.model.display_name')

# Extract context usage
usage=$(echo "$input" | jq '.context_window.current_usage')

if [ "$usage" != "null" ]; then
    # Calculate current token usage
    current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')

    # Get context window size
    size=$(echo "$input" | jq '.context_window.context_window_size')

    # Calculate percentage
    pct=$((current * 100 / size))

    # Display with usage information
    printf '%s | Context: %d tokens (%d%%)' "$model" "$current" "$pct"
else
    # Display without usage information
    printf '%s | Context: N/A' "$model"
fi
