# Unit Test Custom Modes for Cursor

> Structured unit test development workflow adapted from [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)

## What's This?

This directory contains **3 custom Cursor modes** for unit test development. They provide a structured workflow from analysis through implementation to review, ensuring high-quality tests that follow your project's standards.

### The Three Modes

| Mode | Purpose |
|------|---------|
| **ANALYZE_TEST** | Scan project, assess complexity, create test plan, present design options for complex tasks |
| **IMPLEMENT_TEST** | Write tests, run & fix, achieve 100/100 quality gates |
| **REVIEW_TEST** | Quick quality check, brief assessment, update completion status |

## Workflow

```
         ANALYZE_TEST
         Scan project, plan tests
         Simple or Complex?
              |
              v
         IMPLEMENT_TEST
         Write tests, run & fix
         Until 100/100
              |
              v
         REVIEW_TEST
         Verify quality, close task
              |
         Done? --> Next class --> ANALYZE_TEST
```

**Simple** (0-2 deps): ANALYZE -> IMPLEMENT -> REVIEW
**Complex** (3+ deps): Same flow, but ANALYZE includes design options step

## Quality Gates (100 points)

| Gate | Target | Points |
|------|--------|--------|
| Tests Pass | 0 failures, 0 errors | 40 |
| Coverage | >= 80% | 30 |
| Test Count | Reasonable, not fragmented | 30 |

## Quick Start

1. Read `SETUP-GUIDE.md` and configure 3 modes in Cursor
2. Switch to **ANALYZE_TEST** mode
3. Specify the class to test
4. Follow the workflow through IMPLEMENT_TEST and REVIEW_TEST

## What's Included

```
custom_modes_test/
├── analyze_test_instructions.md     # ANALYZE_TEST mode
├── implement_test_instructions.md   # IMPLEMENT_TEST mode
├── review_test_instructions.md      # REVIEW_TEST mode
├── README.md                        # This file
├── SETUP-GUIDE.md                   # Setup instructions
├── QUICK-REFERENCE.md               # Reference card
└── WORKFLOW-DIAGRAM.md              # Visual workflow guide

.cursor/rules/test_isolation/
├── main_test.mdc                    # Core principles + complexity router
├── simple_rules.mdc                 # Simple task rules (0-2 deps)
├── complex_rules.mdc                # Complex task rules (3+ deps)
└── visual_map.mdc                   # Workflow visualization
```

### Isolation Rules

Modes fetch only the rules they need from `.cursor/rules/test_isolation/` instead of loading the full `java-test-rule.mdc` every time. ANALYZE_TEST and REVIEW_TEST save ~900 lines of tokens each. See `SETUP-GUIDE.md` for details.

## Memory Bank

The modes use a single tracking file:

```
test-memory-bank/
└── test-tasks.md    # Plan, status, and completion entries
```

No other memory bank files (activeContext.md, test-progress.md, creative-test-*.md, reflect-test-*.md) are created.

## Project Test Standards

Modes reference your project's test rules file (e.g., `.cursor/rules/java-test-rule.mdc`) for framework-specific conventions. The mode files themselves stay language-agnostic - all concrete examples live in the rules file.

## Key Principles

- **Comprehensive scenarios** over fragmented micro-tests
- **Test independence** - local variables, no shared state
- **Parameterized tests** for data variations
- **Mock external dependencies**, use real domain objects
- **Verify critical interactions only**
- **Consultative approach** - present options, ask user preference

## Documentation

| Document | When to Read |
|----------|-------------|
| **SETUP-GUIDE.md** | Before configuring modes |
| **QUICK-REFERENCE.md** | During development |
| **WORKFLOW-DIAGRAM.md** | Understanding the flow |

## Credits

Adapted from [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) by [@vanzan01](https://github.com/vanzan01).
