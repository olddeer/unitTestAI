#!/usr/bin/env bash
# coverage-reminder.sh
#
# Claude Code PostToolUse hook for the unitTestAI framework.
# Fires after Write/Edit operations. When a production Java source file
# (src/main/java/**/*.java) is modified, it injects a reminder into the
# assistant's context suggesting /check-coverage or /quick-test for the
# affected class.
#
# Skip rules mirror the framework: entities, DTOs, requests/responses,
# and utility classes are ignored. Classes already recorded at 100/100
# in test-memory-bank/test-tasks.md are also skipped to keep the signal
# clean.

set -euo pipefail

INPUT=$(cat)

FILE_PATH=$(printf '%s' "$INPUT" | python3 -c "
import json, sys
try:
    data = json.load(sys.stdin)
    print(data.get('tool_input', {}).get('file_path', ''))
except Exception:
    pass
" 2>/dev/null || true)

[[ -z "${FILE_PATH:-}" ]] && exit 0

case "$FILE_PATH" in
  */src/main/java/*.java) ;;
  *) exit 0 ;;
esac

CLASS=$(basename "$FILE_PATH" .java)

case "$CLASS" in
  *Entity|*Entities|*Dto|*DTO|*Request|*Response|*Util|*Utils|*Helper|*Helpers)
    exit 0 ;;
esac

TASKS_FILE="test-memory-bank/test-tasks.md"
if [[ -f "$TASKS_FILE" ]] && grep -Eq "(^|[^A-Za-z0-9])${CLASS}([^A-Za-z0-9]|$).*100/100" "$TASKS_FILE" 2>/dev/null; then
  exit 0
fi

MSG="[unitTestAI] ${CLASS} was modified under src/main/java — coverage may have drifted. Suggest: /check-coverage ${CLASS} or /quick-test ${CLASS}."

python3 - <<PY
import json
out = {
    "hookSpecificOutput": {
        "hookEventName": "PostToolUse",
        "additionalContext": "${MSG}"
    }
}
print(json.dumps(out))
PY

exit 0
