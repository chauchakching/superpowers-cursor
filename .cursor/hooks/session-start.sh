#!/usr/bin/env bash
# SessionStart hook for superpowers - adapted from Claude Code plugin

set -euo pipefail

# Determine script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# Read using-superpowers skill content
using_superpowers_content=$(cat "${PROJECT_ROOT}/.cursor/skills/using-superpowers/SKILL.md" 2>&1 || echo "Error reading using-superpowers skill")

# Escape for JSON
escape_for_json() {
    local input="$1"
    local output=""
    local i char
    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
        case "$char" in
            $'\\') output+='\\';;
            '"') output+='\"';;
            $'\n') output+='\n';;
            $'\r') output+='\r';;
            $'\t') output+='\t';;
            *) output+="$char";;
        esac
    done
    printf '%s' "$output"
}

using_superpowers_escaped=$(escape_for_json "$using_superpowers_content")

# Output JSON for Cursor hooks
cat <<EOF
{
  "additional_context": "<EXTREMELY_IMPORTANT>\nYou have superpowers.\n\nSkills are located in .cursor/skills/ directory. Use the Read tool to load skills when needed.\n\n**Below is the full content of your 'using-superpowers' skill - your introduction to using skills:**\n\n${using_superpowers_escaped}\n</EXTREMELY_IMPORTANT>",
  "continue": true
}
EOF

exit 0
