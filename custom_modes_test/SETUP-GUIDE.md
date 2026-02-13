# Unit Test Custom Modes - Setup Guide

## Prerequisites

- **Cursor Editor**: Version 0.48+
- **Custom Modes Enabled**: Settings -> Features -> Chat -> Custom modes
- **AI Model**: Claude Sonnet 4 or Claude Opus (recommended)
- **Project Test Standards**: A test rules file in your project (e.g., `.cursor/rules/java-test-rule.mdc`)

## Step 1: Verify Files

```bash
ls custom_modes_test/
# Expected:
# analyze_test_instructions.md
# implement_test_instructions.md
# review_test_instructions.md
# SETUP-GUIDE.md (this file)
```

## Step 2: Configure 3 Custom Modes in Cursor

### How to Add a Mode
1. Open Cursor chat panel
2. Click mode selector dropdown (shows "Normal")
3. Click **"Add custom mode"**
4. Enter name, select tools, click **"Advanced options"**
5. Paste the entire content from the instruction file
6. Save

---

### Mode 1: ANALYZE_TEST

- **Name**: `ANALYZE_TEST`
- **Tools**:
  - Codebase Search
  - Read File
  - Terminal
  - List Directory
  - Fetch Rules
- **Advanced Options**: Paste content from `analyze_test_instructions.md`

---

### Mode 2: IMPLEMENT_TEST

- **Name**: `IMPLEMENT_TEST`
- **Tools**: **ALL TOOLS** (enable everything)
- **Advanced Options**: Paste content from `implement_test_instructions.md`

---

### Mode 3: REVIEW_TEST

- **Name**: `REVIEW_TEST`
- **Tools**:
  - Codebase Search
  - Read File
  - Terminal
  - List Directory
  - Edit File
- **Advanced Options**: Paste content from `review_test_instructions.md`

## Step 3: Verify Setup

1. Open Cursor chat panel
2. Click mode selector dropdown
3. Verify all 3 modes appear:
   - ANALYZE_TEST
   - IMPLEMENT_TEST
   - REVIEW_TEST

## Getting Started

1. Switch to **ANALYZE_TEST** mode
2. Specify the class you want to test
3. ANALYZE_TEST will:
   - Scan for coverage gaps
   - Assess complexity (Simple/Complex)
   - Create test plan in `test-memory-bank/test-tasks.md`
   - For Complex: present design options
4. Switch to **IMPLEMENT_TEST** when told
5. Switch to **REVIEW_TEST** when tests are complete

## Example Session

```
You: [Switch to ANALYZE_TEST] -> "Test UserService"

AI: Scans project, finds UserService untested
    Complexity: Complex (5 dependencies)
    Creates test plan with 4 scenarios
    Presents design options for test data strategy
    "Switch to IMPLEMENT_TEST to start writing tests"

You: [Switch to IMPLEMENT_TEST]

AI: Writes tests following the plan
    Runs tests after each method
    Fixes failures immediately
    Coverage: 87%, Quality: 100/100
    "Switch to REVIEW_TEST"

You: [Switch to REVIEW_TEST]

AI: Runs final validation
    Quality: 100/100
    Compliance check: all 7 items pass
    Updates test-tasks.md with completion entry
    "Done! Next class?"
```

## Memory Bank

After first use, the system creates:

```
test-memory-bank/
└── test-tasks.md    # Plan, status, completion entries
```

This single file tracks everything. No other memory bank files are needed.

## Complexity Levels

| Complexity | Criteria | What Changes |
|------------|----------|-------------|
| **Simple** | 0-2 dependencies, straightforward logic | Straight to test plan |
| **Complex** | 3+ dependencies, branching logic | ANALYZE includes design options step |

Both use the same 3-mode workflow: ANALYZE -> IMPLEMENT -> REVIEW.

## Quality Gates

All tests are scored on a 100-point scale:
- **40 pts**: All tests pass (0 failures)
- **30 pts**: Coverage >= 80%
- **30 pts**: Reasonable test count (comprehensive, not fragmented)

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Modes not appearing | Enable in Settings -> Features -> Chat -> Custom modes; restart Cursor |
| Rules not loading | Verify test rules file exists; enable "Fetch Rules" tool in ANALYZE_TEST |
| Tests not running | Check build tool setup; verify test dependencies |
| Coverage report fails | Ensure coverage plugin configured; run clean build first |
| Mode not following instructions | Verify complete content pasted in "Advanced Options"; restart Cursor |

## Credits

Adapted from [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) by [@vanzan01](https://github.com/vanzan01).
