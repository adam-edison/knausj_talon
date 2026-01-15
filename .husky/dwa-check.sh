#!/bin/sh

# Check if dwa command is available
if ! command -v dwa >/dev/null 2>&1; then
  echo ""
  echo "ERROR: 'dwa' command not found."
  echo ""
  echo "DWA (Developer Workflow Assistant) is required for git hooks in this repository."
  echo ""
  echo "To install:"
  echo "  1. Clone: git clone https://github.com/developer-funky-goblin/developer-workflow-assistant.git"
  echo "  2. Install: cd developer-workflow-assistant && npm install"
  echo "  3. Setup: npm run setup"
  echo ""
  echo "For more information: https://github.com/developer-funky-goblin/developer-workflow-assistant"
  echo ""
  exit 1
fi
