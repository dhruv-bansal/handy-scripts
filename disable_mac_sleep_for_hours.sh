#!/bin/bash

# Check if the user provided an argument for the number of hours
if [ -z "$1" ]; then
  echo "Usage: $0 <number_of_hours>"
  exit 1
fi

# Convert the number of hours to seconds (1 hour = 3600 seconds)
seconds=$(( $1 * 3600 ))

# Function to re-enable sleep when the script exits or is interrupted
cleanup() {
  echo "Re-enabling sleep..."
  sudo pmset -a disablesleep 0
}

# Trap any termination signals (e.g., SIGINT, SIGTERM) and run cleanup
trap cleanup EXIT

# Disable sleep
echo "Disabling sleep..."
sudo pmset -a disablesleep 1

# Wait for the specified number of seconds (hours)
echo "Keeping the Mac awake for $1 hour(s)..."
sleep $seconds

# Re-enable sleep after the specified duration (this also runs on normal exit)
cleanup

echo "Done."