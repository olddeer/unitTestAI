#!/usr/bin/env bash
# setup.sh — Add unit-test agents to a project in one command
#
# Usage:
#   ./setup.sh /path/to/your-project
#   ./setup.sh /path/to/your-project --lang kotlin
#
# Options:
#   --lang <java|kotlin>   Language for test rules (default: java)
#   --dry-run              Print what would happen without copying files

set -euo pipefail

# ── Args ────────────────────────────────────────────────────────────────────

TARGET_PROJECT=""
LANG="java"
DRY_RUN=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --lang)    LANG="$2"; shift 2 ;;
    --dry-run) DRY_RUN=true; shift ;;
    *)
      if [[ -z "$TARGET_PROJECT" ]]; then
        TARGET_PROJECT="$1"; shift
      else
        echo "Unknown argument: $1" >&2; exit 1
      fi
      ;;
  esac
done

if [[ -z "$TARGET_PROJECT" ]]; then
  echo "Usage: ./setup.sh /path/to/project [--lang java|kotlin] [--dry-run]"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Helpers ─────────────────────────────────────────────────────────────────

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

copy_file() {
  local src="$1" dst="$2"
  if $DRY_RUN; then
    echo "  [dry-run] cp $src → $dst"
  else
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    echo -e "  ${GREEN}✓${NC} $dst"
  fi
}

make_dir() {
  local dir="$1"
  if $DRY_RUN; then
    echo "  [dry-run] mkdir -p $dir"
  else
    mkdir -p "$dir"
    echo -e "  ${GREEN}✓${NC} $dir/"
  fi
}

write_file() {
  local dst="$1" content="$2"
  if $DRY_RUN; then
    echo "  [dry-run] write $dst"
  else
    mkdir -p "$(dirname "$dst")"
    printf '%s' "$content" > "$dst"
    echo -e "  ${GREEN}✓${NC} $dst"
  fi
}

# ── Pre-flight checks ────────────────────────────────────────────────────────

echo ""
echo -e "${CYAN}Unit Test Agents — Project Setup${NC}"
echo "  Target : $TARGET_PROJECT"
echo "  Lang   : $LANG"
echo ""

if [[ ! -d "$TARGET_PROJECT" ]]; then
  echo "Error: target directory does not exist: $TARGET_PROJECT" >&2
  exit 1
fi

# Detect build tool
BUILD_TOOL="unknown"
if [[ -f "$TARGET_PROJECT/pom.xml" ]];                          then BUILD_TOOL="maven";
elif [[ -f "$TARGET_PROJECT/build.gradle" || -f "$TARGET_PROJECT/build.gradle.kts" ]]; then BUILD_TOOL="gradle";
fi
echo "  Build  : $BUILD_TOOL"
echo ""

# Check for existing agents (offer to skip or overwrite)
AGENTS_DIR="$TARGET_PROJECT/.claude/agents"
if [[ -d "$AGENTS_DIR" ]] && ! $DRY_RUN; then
  echo -e "${YELLOW}Warning:${NC} .claude/agents already exists in target project."
  read -rp "  Overwrite existing agent files? [y/N] " confirm
  if [[ "${confirm,,}" != "y" ]]; then
    echo "Aborted."
    exit 0
  fi
fi

# ── Copy agents ──────────────────────────────────────────────────────────────

echo "Copying agents..."
for agent in analyze-test implement-test review-test run-tests; do
  src="$SCRIPT_DIR/agents/${agent}.md"
  if [[ -f "$src" ]]; then
    copy_file "$src" "$TARGET_PROJECT/.claude/agents/${agent}.md"
  else
    echo -e "  ${YELLOW}⚠${NC}  Missing: agents/${agent}.md (skipped)"
  fi
done

# ── Copy slash commands ───────────────────────────────────────────────────────

echo ""
echo "Copying slash commands..."
for cmd in check-coverage quick-test; do
  src="$SCRIPT_DIR/commands/${cmd}.md"
  if [[ -f "$src" ]]; then
    copy_file "$src" "$TARGET_PROJECT/.claude/commands/${cmd}.md"
  else
    echo -e "  ${YELLOW}⚠${NC}  Missing: commands/${cmd}.md (skipped)"
  fi
done

# ── Copy rules ───────────────────────────────────────────────────────────────

echo ""
echo "Copying isolation rules..."
make_dir "$TARGET_PROJECT/rules/test_isolation"
for rule in main_test simple_rules complex_rules visual_map; do
  src="$SCRIPT_DIR/rules/test_isolation/${rule}.mdc"
  if [[ -f "$src" ]]; then
    copy_file "$src" "$TARGET_PROJECT/rules/test_isolation/${rule}.mdc"
  else
    echo -e "  ${YELLOW}⚠${NC}  Missing: rules/test_isolation/${rule}.mdc (skipped)"
  fi
done

echo ""
echo "Copying language test rules..."
LANG_RULE_SRC="$SCRIPT_DIR/rules/${LANG}-test-rule.mdc"
LANG_RULE_DST="$TARGET_PROJECT/rules/${LANG}-test-rule.mdc"
if [[ -f "$LANG_RULE_SRC" ]]; then
  copy_file "$LANG_RULE_SRC" "$LANG_RULE_DST"
else
  echo -e "  ${YELLOW}⚠${NC}  No rule file found for lang '${LANG}' at rules/${LANG}-test-rule.mdc"
  echo "     Add your own at: $LANG_RULE_DST"
fi

# ── Create memory bank ────────────────────────────────────────────────────────

echo ""
echo "Creating memory bank..."
make_dir "$TARGET_PROJECT/test-memory-bank"

DASHBOARD_CONTENT="# Test Memory Bank

## Dashboard
- **Last run**: —
- **Total classes targeted**: 0
- **Done**: 0 | **In progress**: 0 | **Escalated**: 0 | **Pending**: 0
- **Coverage before**: — | **Coverage after**: —

---

<!-- Agents append their sections below this line -->
"

DST_TASKS="$TARGET_PROJECT/test-memory-bank/test-tasks.md"
if [[ ! -f "$DST_TASKS" ]]; then
  write_file "$DST_TASKS" "$DASHBOARD_CONTENT"
else
  echo -e "  ${YELLOW}⚠${NC}  test-tasks.md already exists — not overwritten"
fi

# ── JaCoCo check ─────────────────────────────────────────────────────────────

echo ""
echo "Checking JaCoCo configuration..."
JACOCO_OK=false

if [[ "$BUILD_TOOL" == "maven" ]] && grep -q "jacoco" "$TARGET_PROJECT/pom.xml" 2>/dev/null; then
  JACOCO_OK=true
elif [[ "$BUILD_TOOL" == "gradle" ]]; then
  for f in build.gradle build.gradle.kts; do
    if [[ -f "$TARGET_PROJECT/$f" ]] && grep -q "jacoco" "$TARGET_PROJECT/$f" 2>/dev/null; then
      JACOCO_OK=true; break
    fi
  done
fi

if $JACOCO_OK; then
  echo -e "  ${GREEN}✓${NC} JaCoCo detected"
else
  echo -e "  ${YELLOW}⚠${NC}  JaCoCo not detected in build config"
  if [[ "$BUILD_TOOL" == "maven" ]]; then
    echo "     Add to pom.xml plugins:"
    echo "       <plugin>"
    echo "         <groupId>org.jacoco</groupId>"
    echo "         <artifactId>jacoco-maven-plugin</artifactId>"
    echo "         <version>0.8.12</version>"
    echo "         <executions>"
    echo "           <execution><goals><goal>prepare-agent</goal></goals></execution>"
    echo "           <execution><id>report</id><phase>test</phase><goals><goal>report</goal></goals></execution>"
    echo "         </executions>"
    echo "       </plugin>"
  elif [[ "$BUILD_TOOL" == "gradle" ]]; then
    echo "     Add to build.gradle:"
    echo "       plugins { id 'jacoco' }"
    echo "       jacocoTestReport { reports { xml.required = true } }"
  fi
fi

# ── Summary ──────────────────────────────────────────────────────────────────

echo ""
echo -e "${GREEN}Setup complete.${NC}"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in: $TARGET_PROJECT"
if ! $JACOCO_OK; then
  echo "  2. Add JaCoCo to your build config (see warning above)"
  echo "  3. Run: use run-tests to test [ClassName or package]"
else
  echo "  2. Run: use run-tests to test [ClassName or package]"
fi
echo ""
