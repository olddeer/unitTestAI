# Unit Test Agents for Claude Code

> Structured unit test development workflow using Claude Code subagents

## What's This?

This repository contains **4 Claude Code subagents** for unit test development. They provide a structured workflow from analysis through implementation to review, ensuring high-quality tests that follow your project's standards. Use `run-tests` as the single entry point for hands-off batch generation, or invoke the specialist agents individually for manual control.

### The Agents

| Agent | Role | Purpose |
|-------|------|---------|
| `run-tests` | **Orchestrator** | Drive the full analyze → implement → review cycle autonomously; accepts a single class, package, or "all"; loops until 100/100 or escalates |
| `analyze-test` | Specialist | Scan project, assess complexity, create test plan, present design options for complex tasks |
| `implement-test` | Specialist | Write tests, run & fix, achieve 100/100 quality gates |
| `review-test` | Specialist | Quick quality check, brief assessment, update completion status |

## Workflow

```
         run-tests (orchestrator)
         Parse target, build priority queue
              |
              v
         analyze-test
         Scan project, plan tests
         Simple or Complex?
              |
              v
         implement-test
         Write tests, run & fix
         Until 100/100
              |
              v
         review-test
         Verify quality, close task
              |
         Done? --> Next class --> analyze-test
         Escalated? --> Report to user
```

**Simple** (0-2 deps): analyze-test -> implement-test -> review-test
**Complex** (3+ deps): Same flow, but analyze-test pauses for user design choice before implement-test

## Quality Gates (100 points)

| Gate | Target | Points |
|------|--------|--------|
| Tests Pass | 0 failures, 0 errors | 40 |
| Coverage | >= 80% | 30 |
| Test Count | Reasonable, not fragmented | 30 |

## Quick Start

**Automated (recommended):** use `run-tests` to handle everything hands-off:
```
"use run-tests to test OrderService"
"run-tests on the com.example.service package"
"run-tests — test everything with 0% coverage"
```

**Manual:** invoke specialist agents directly:
1. Read `MEMORY-BANK-SETUP-TEST.md` to add agents to your project
2. Ask Claude to use `analyze-test` agent on a class
3. Follow the workflow through `implement-test` and `review-test`

## File Structure

```
agents/
├── run-tests.md              # run-tests orchestrator agent
├── analyze-test.md           # analyze-test agent
├── implement-test.md         # implement-test agent
└── review-test.md            # review-test agent

rules/
├── java-test-rule.mdc        # Language-specific test conventions
└── test_isolation/
    ├── main_test.mdc         # Core principles + complexity router
    ├── simple_rules.mdc      # Simple task rules (0-2 deps)
    ├── complex_rules.mdc     # Complex task rules (3+ deps)
    └── visual_map.mdc        # Workflow visualization

MEMORY-BANK-SETUP-TEST.md    # Setup guide for adding agents to a project
QUICK-REFERENCE.md           # Reference card
WORKFLOW-DIAGRAM.md          # Visual workflow guide
```

### Isolation Rules

Agents read only the rules they need from `rules/test_isolation/` instead of loading the full `java-test-rule.mdc` every time. `analyze-test` and `review-test` save ~900 lines of tokens each.

## Memory Bank

The commands use a single tracking file:

```
test-memory-bank/
└── test-tasks.md    # Plan, status, and completion entries
```

No other memory bank files are created.

## Project Test Standards

`implement-test` reads `rules/java-test-rule.mdc` for framework-specific conventions. The agent files themselves stay language-agnostic - all concrete examples live in the rules file.

## Key Principles

- **Comprehensive scenarios** over fragmented micro-tests
- **Test independence** - local variables, no shared state
- **Parameterized tests** for data variations
- **Mock external dependencies**, use real domain objects
- **Verify critical interactions only**
- **Consultative approach** - present options, ask user preference
