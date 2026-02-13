# Memory Bank System - Setup Guide

> Based on [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) v0.7-beta by [@vanzan01](https://github.com/vanzan01)

---

## Unit Test Modes (Primary)

This project uses a **3-mode unit test workflow** in the `custom_modes_test/` directory.

### The Three Modes

| Mode | Purpose |
|------|---------|
| **ANALYZE_TEST** | Scan project, assess complexity (Simple/Complex), create test plan, design options for complex tasks |
| **IMPLEMENT_TEST** | Write tests, run & fix, achieve 100/100 quality gates |
| **REVIEW_TEST** | Quick quality check, brief assessment, update completion status |

### Workflow

```
Simple (0-2 deps):  ANALYZE_TEST -> IMPLEMENT_TEST -> REVIEW_TEST
Complex (3+ deps):  Same flow, ANALYZE includes design options step
```

### Quality Gates (100 points)

- **Tests Pass** (40 pts): All green, 0 failures/errors
- **Coverage >=80%** (30 pts): Line coverage target met
- **Reasonable Count** (30 pts): Comprehensive scenarios, not fragmented

### Memory Bank

Single file: `test-memory-bank/test-tasks.md` - tracks plan, status, and completion entries.

### Setup

1. Read `custom_modes_test/SETUP-GUIDE.md`
2. Configure 3 test modes in Cursor (paste instruction file contents)
3. Switch to ANALYZE_TEST mode and specify target class
4. Follow the workflow

### Isolation Rules

Modes load only the rules they need from `.cursor/rules/test_isolation/`:

| Mode | Rules Fetched | Approx. Lines |
|------|--------------|---------------|
| ANALYZE_TEST | `main_test.mdc` + `simple_rules.mdc` or `complex_rules.mdc` | ~120 |
| IMPLEMENT_TEST | `main_test.mdc` + `java-test-rule.mdc` | ~1,070 |
| REVIEW_TEST | `main_test.mdc` only | ~60 |

This reduces token usage by 60-80% for ANALYZE and REVIEW modes compared to loading the full `java-test-rule.mdc` every time.

### Documentation

- **Setup Guide**: `custom_modes_test/SETUP-GUIDE.md`
- **Quick Reference**: `custom_modes_test/QUICK-REFERENCE.md`
- **Workflow Diagram**: `custom_modes_test/WORKFLOW-DIAGRAM.md`
- **Test Rules**: `.cursor/rules/java-test-rule.mdc`
- **Isolation Rules**: `.cursor/rules/test_isolation/` (main_test, simple_rules, complex_rules, visual_map)

---

## General Development Modes (Upstream Reference)

The upstream [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) project provides a general development workflow with 5 modes (VAN, PLAN, CREATIVE, IMPLEMENT, REFLECT). These are for feature development, bug fixes, and architecture changes - separate from the unit test modes above.

If you need the general development modes, see the upstream repository for installation and setup.

### Prerequisites (Both Systems)

- **Cursor Editor**: Version 0.48+
- **Custom Modes Enabled**: Settings -> Features -> Chat -> Custom modes
- **AI Model**: Claude Sonnet 4 or Claude Opus (recommended)

### Enabling Custom Modes in Cursor

1. Open Cursor Settings (Cmd+, on macOS or Ctrl+, on Windows/Linux)
2. Navigate to: **Features -> Chat**
3. Enable: **"Custom modes"**
4. Restart Cursor if prompted

### Troubleshooting

| Problem | Solution |
|---------|----------|
| Modes not appearing | Enable in Settings -> Features -> Chat -> Custom modes; restart Cursor |
| Rules not loading | Verify rules file exists; enable "Fetch Rules" tool |
| Character limit exceeded | Verify using latest version; remove examples if needed |
| Mode not following instructions | Verify complete content pasted in "Advanced Options"; restart Cursor |

---

**Version**: v0.7-beta
**Repository**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)
**Community**: [GitHub Issues](https://github.com/vanzan01/cursor-memory-bank/issues)
