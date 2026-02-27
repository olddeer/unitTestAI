# Unit Test Agents - Setup Guide

---

## Unit Test Agents (Claude Code)

This project uses **3 Claude Code subagents** for unit test development.

### The Three Agents

| Agent | Purpose |
|-------|---------|
| **analyze-test** | Scan project, assess complexity (Simple/Complex), create test plan, design options for complex tasks |
| **implement-test** | Write tests, run & fix, achieve 100/100 quality gates |
| **review-test** | Quick quality check, brief assessment, update completion status |

### Workflow

```
Simple (0-2 deps):  analyze-test -> implement-test -> review-test
Complex (3+ deps):  Same flow, analyze-test includes design options step
```

### Quality Gates (100 points)

- **Tests Pass** (40 pts): All green, 0 failures/errors
- **Coverage >=80%** (30 pts): Line coverage target met
- **Reasonable Count** (30 pts): Comprehensive scenarios, not fragmented

### Memory Bank

Single file: `test-memory-bank/test-tasks.md` - tracks plan, status, and completion entries.

---

## Adding Agents to a New Project

### Step 1: Copy agent files

```bash
cp -r .claude/agents/ /path/to/your-project/.claude/agents/
```

Or copy individual files:

```bash
mkdir -p /path/to/your-project/.claude/agents
cp .claude/agents/analyze-test.md /path/to/your-project/.claude/agents/
cp .claude/agents/implement-test.md /path/to/your-project/.claude/agents/
cp .claude/agents/review-test.md /path/to/your-project/.claude/agents/
```

### Step 2: Copy isolation rules

```bash
mkdir -p /path/to/your-project/.cursor/rules/test_isolation
cp .cursor/rules/test_isolation/*.mdc /path/to/your-project/.cursor/rules/test_isolation/
```

### Step 3: Add your language-specific test rules

Place your test rules file at `.cursor/rules/java-test-rule.mdc` (or equivalent for your language). The `implement-test` agent reads this for framework-specific conventions.

### Step 4: Verify structure

```
.claude/
├── agents/
│   ├── analyze-test.md
│   ├── implement-test.md
│   └── review-test.md
└── settings.local.json       # optional: add mvn/gradle permissions

.cursor/rules/
├── java-test-rule.mdc        # your language-specific test rules
└── test_isolation/
    ├── main_test.mdc          # core principles + complexity router
    ├── simple_rules.mdc       # simple task rules (0-2 deps)
    ├── complex_rules.mdc      # complex task rules (3+ deps)
    └── visual_map.mdc         # workflow visualization
```

### Step 5: Use the agents

Ask Claude to use an agent by name, or Claude will auto-delegate based on context:

```
"Use the analyze-test agent to test UserService"
"Run analyze-test on OrderProcessor"
```

---

## Isolation Rules

Agents read only the rules they need from `.cursor/rules/test_isolation/`:

| Agent | Rules Read | Approx. Lines |
|-------|-----------|---------------|
| analyze-test | `main_test.mdc` + `simple_rules.mdc` or `complex_rules.mdc` | ~120 |
| implement-test | `main_test.mdc` + `java-test-rule.mdc` | ~1,070 |
| review-test | `main_test.mdc` only | ~60 |

This reduces token usage by 60-80% for analyze-test and review-test compared to loading the full `java-test-rule.mdc` every time.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Agent not found | Verify `.claude/agents/` files exist; restart Claude Code |
| Rules not loading | Verify `.cursor/rules/test_isolation/` files exist |
| Tests not running | Check build tool setup; verify test dependencies |
| Coverage report fails | Ensure coverage plugin configured; run clean build first |
