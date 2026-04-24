# Unit Test AI — Claude Instructions

This repository is a **unit test generation framework** for Java Spring projects. It provides four specialized agents and two slash commands that drive a full test development loop: analyze → implement → review.

---

## IMPORTANT: Never Write Tests Directly

When the user asks to write, generate, or create unit tests for any class, **always use the framework agents — never write tests yourself**.

| User request | What to do |
|-------------|------------|
| "write tests for OrderService" | Use `/write-unit-test OrderService` |
| "add unit tests for the service layer" | Use `run-tests on com.example.service` |
| "test everything" | Use `run-tests — test all classes below 80% coverage` |
| "create a test plan for PaymentProcessor" | Use `/analyze-unit-test PaymentProcessor` |
| "what needs test coverage?" | Use `/find-coverage-gaps` |
| "what's the coverage for UserRepository?" | Use `/check-coverage UserRepository` |

The framework agents enforce quality gates (100/100), track state, follow project test rules, and handle retries and escalation automatically. Writing tests outside the framework bypasses all of these.

---

## How to Use This Framework

### Entry points (pick one)

| Goal | What to use |
|------|------------|
| Test one class end-to-end | `/quick-test <ClassName>` |
| Test a full package or everything below 80% coverage | `use run-tests on <package or "all">` |
| Plan only (no implementation yet) | `/quick-test <ClassName> --plan-only` |
| Check current coverage without writing tests | `/check-coverage <ClassName>` |

### Typical invocations

```
/quick-test OrderService
/quick-test PaymentProcessor --plan-only
/check-coverage UserRepository

use run-tests to test OrderService
use run-tests on com.example.service
use run-tests — test everything with 0% coverage
```

---

## Agents

There are four agents. Do not invoke them manually unless you have a specific reason — use `run-tests` or `/quick-test` as the entry point instead.

| Agent | Role | When to invoke directly |
|-------|------|------------------------|
| **run-tests** | Orchestrator — builds queue, drives full cycle, escalates | Batch work (package or "all") |
| **analyze-test** | Scans project, assesses complexity, writes test plan | When you only want a plan |
| **implement-test** | Writes tests, runs & fixes, hits 100/100 | When a plan already exists in test-tasks.md |
| **review-test** | Validates quality, scores gates, records completion | After implementation, for final sign-off |

### Agent chain

```
run-tests (orchestrator)
    └─> analyze-test   → writes plan to test-memory-bank/test-tasks.md
    └─> implement-test → writes tests, runs them, fixes until 100/100
    └─> review-test    → scores quality gate, records completion entry
```

For **Complex** tasks (3+ dependencies), `analyze-test` will pause and present 2–3 design options to the user before proceeding. Wait for the user's choice.

---

## What Gets Tested (Scope Rules)

### Always test
- **Service** classes (`*Service`, `*ServiceImpl`)
- **Repository** classes (`*Repository`, `*RepositoryImpl`)
- Controllers, Processors, Handlers, Managers, Validators, Converters

### Always skip — never add to the queue
- **Entity classes**: annotated with `@Entity` or `@Table`, or class name ends with `Entity`
- **DTO classes**: class name ends with `Dto`, `DTO`, `Request`, `Response`
- **Utility classes**: class name ends with `Util`, `Utils`, `Helper`, `Helpers`, or class contains only static methods with no dependencies
- Abstract classes and interfaces (unless they contain concrete logic)
- Classes with only getters/setters and no logic

---

## Priority Scoring (run-tests queue)

When building a work queue, each class is scored:

```
Priority = (100 - current_coverage%) × dependency_count × 2 + business_logic_bonus
```

- `business_logic_bonus` = 20 if class name contains: Service, Repository, Controller, Processor, Handler, Manager, Validator, Converter
- Highest score runs first

---

## Quality Gates (100 points)

Every class must reach 100/100 before it is marked done.

| Gate | Target | Points |
|------|--------|--------|
| Tests Pass | 0 failures, 0 errors | 40 |
| Coverage | ≥ 80% line coverage | 30 |
| Test Count | Comprehensive, not fragmented | 30 |

- **40 pass points are non-negotiable** — never continue with failing tests
- Coverage is checked after each batch of 2–3 test methods, not only at the end
- After 2 failed implement-test attempts, escalate — do not keep retrying

---

## Complexity Assessment

| Type | Criteria | Workflow difference |
|------|----------|-------------------|
| **Simple** | 0–2 dependencies, straightforward logic | Straight to plan, no design options |
| **Complex** | 3+ dependencies, branching logic | analyze-test presents design options, waits for user choice |

---

## Skills (`skills/` directory)

These are the primary skills for interacting with the framework. Always prefer skills over invoking agents directly.

| Skill | Usage | What It Does |
|-------|-------|-------------|
| `/write-unit-test` | `/write-unit-test <ClassName>` | Full analyze → implement → review cycle for one or more classes |
| `/analyze-unit-test` | `/analyze-unit-test <ClassName>` | Produce a test plan only — no tests written yet |
| `/find-coverage-gaps` | `/find-coverage-gaps [package]` | List all target classes below 80% coverage, ranked by priority |

All three skills enforce the same skip rules (entity/DTO/utility classes are refused) and delegate to the correct agents automatically.

Skill definitions live in `skills/`:
- `skills/write-unit-test.md`
- `skills/analyze-unit-test.md`
- `skills/find-coverage-gaps.md`

---

## Slash Commands

### `/quick-test <ClassName>`
Full analyze → implement → review cycle for one class.

Flags:
- `--plan-only` — run analyze-test only; stop after plan is written
- `--coverage-only` — report current line/branch coverage without writing tests

### `/check-coverage <ClassName>`
Runs the project's coverage tool and reports line + branch coverage for the named class. If below 80%, lists uncovered lines and suggests next steps.

---

## State & Memory Bank

All state is stored in a single file: `test-memory-bank/test-tasks.md`

This file contains:
- `## Queue` — priority-ordered work list with statuses (managed by run-tests)
- `## Test Plan` — scenarios, mock strategy, design decisions (managed by analyze-test)
- `## Status` — implementation progress (managed by implement-test)
- `## Completed` — final score, coverage, notes (managed by review-test)

**Do not delete or overwrite this file between runs.** `run-tests` resumes from existing state automatically — completed classes are skipped, in-progress tasks are resumed.

---

## Build Tool Support

The agents auto-detect Maven vs Gradle by checking for `pom.xml` or `build.gradle`.

| Operation | Maven | Gradle |
|-----------|-------|--------|
| Run tests | `mvn -q test` | `./gradlew test` |
| Run with coverage | `mvn -q -DskipITs test jacoco:report` | `./gradlew test jacocoTestReport` |
| Run single class | `mvn -q test -Dtest=ClassNameTest` | `./gradlew test --tests ClassNameTest` |

Coverage reports are parsed from JaCoCo XML:
- Maven: `target/site/jacoco/jacoco.xml`
- Gradle: `build/reports/jacoco/test/jacocoTestReport.xml`

---

## Rules Files

Agents load rules automatically — you do not need to reference these manually.

| File | Used by | Purpose |
|------|---------|---------|
| `rules/test_isolation/main_test.mdc` | All agents | Quality gates, complexity criteria, compliance checklist |
| `rules/test_isolation/simple_rules.mdc` | analyze-test | Rules for Simple tasks |
| `rules/test_isolation/complex_rules.mdc` | analyze-test | Rules for Complex tasks, design option guidance |
| `rules/java-test-rule.mdc` | implement-test | Java-specific patterns, JUnit 5, AssertJ, Mockito examples |

---

## Test Writing Standards (enforced by implement-test)

1. **Clear structure** — Arrange / Act / Assert with blank line separation
2. **Local variables only** — no shared mutable state between tests
3. **Fluent assertions** — use AssertJ
4. **Comprehensive scenarios** — one test validating multiple aspects beats three micro-tests
5. **Parameterized tests** — use `@ParameterizedTest` for data variations
6. **Mock only external dependencies** — use real objects for value objects
7. **Verify critical interactions only** — avoid brittle over-verification

---

## Escalation

If implement-test cannot reach 100/100 after 2 attempts, run-tests will:
1. Mark the class as `escalated ⚠` in the queue
2. Write a brief escalation note with the blocker description
3. Ask the user whether to skip and continue, investigate manually, or stop
4. Default to continuing with the remaining queue

---

## File Structure

```
unitTestAI/
├── CLAUDE.md                          ← this file
├── agents/
│   ├── run-tests.md                   ← orchestrator
│   ├── analyze-test.md                ← planner
│   ├── implement-test.md              ← writer
│   └── review-test.md                 ← reviewer
├── skills/
│   ├── write-unit-test.md             ← /write-unit-test skill (primary entry point)
│   ├── analyze-unit-test.md           ← /analyze-unit-test skill (plan only)
│   └── find-coverage-gaps.md          ← /find-coverage-gaps skill (scan & rank)
├── commands/
│   ├── quick-test.md                  ← /quick-test slash command
│   └── check-coverage.md              ← /check-coverage slash command
├── rules/
│   ├── java-test-rule.mdc             ← Java patterns & examples
│   └── test_isolation/
│       ├── main_test.mdc              ← core rules & quality gates
│       ├── simple_rules.mdc           ← simple task rules
│       ├── complex_rules.mdc          ← complex task rules
│       └── visual_map.mdc             ← workflow diagram
├── template/
│   └── test-tasks-template.md         ← test-tasks.md template
└── test-memory-bank/
    └── test-tasks.md                  ← all runtime state (auto-created)
```

---

## Initializing the Framework for a New Project

Copy the framework files into the target project, configure permissions, and verify the build tool has JaCoCo. The framework is self-contained — no additional dependencies beyond what is already in the project's build.

### Step 1: Copy agents

```bash
TARGET=/path/to/your-project

mkdir -p $TARGET/.claude/agents

cp agents/run-tests.md      $TARGET/.claude/agents/
cp agents/analyze-test.md   $TARGET/.claude/agents/
cp agents/implement-test.md $TARGET/.claude/agents/
cp agents/review-test.md    $TARGET/.claude/agents/
```

### Step 2: Copy skills

```bash
mkdir -p $TARGET/skills

cp skills/write-unit-test.md   $TARGET/skills/
cp skills/analyze-unit-test.md $TARGET/skills/
cp skills/find-coverage-gaps.md $TARGET/skills/
```

### Step 3: Copy rules

```bash
mkdir -p $TARGET/rules/test_isolation

cp rules/test_isolation/main_test.mdc    $TARGET/rules/test_isolation/
cp rules/test_isolation/simple_rules.mdc $TARGET/rules/test_isolation/
cp rules/test_isolation/complex_rules.mdc $TARGET/rules/test_isolation/
cp rules/test_isolation/visual_map.mdc   $TARGET/rules/test_isolation/

# Copy language-specific test rules (Java)
cp rules/java-test-rule.mdc $TARGET/rules/
```

If the target project uses a different language, replace `java-test-rule.mdc` with an equivalent file for that language and update the reference in `agents/implement-test.md`.

### Step 4: Copy slash commands (optional)

```bash
mkdir -p $TARGET/commands

cp commands/quick-test.md      $TARGET/commands/
cp commands/check-coverage.md  $TARGET/commands/
```

### Step 5: Configure permissions (required)

Without pre-approved permissions, Claude will prompt for every `mvn` or `gradlew` invocation, breaking the automated flow.

Add to `$TARGET/.claude/settings.json` (merge if the file already exists):

```json
{
  "permissions": {
    "allow": [
      "Bash(mvn:*)",
      "Bash(./gradlew:*)",
      "Bash(gradle:*)",
      "Write(src/test/**)",
      "Edit(src/test/**)",
      "Write(test-memory-bank/**)",
      "Edit(test-memory-bank/**)"
    ]
  }
}
```

### Step 6: Verify JaCoCo is configured

The agents parse JaCoCo XML for coverage data. Confirm the build file has JaCoCo set up:

**Maven** — `pom.xml` must include:
```xml
<plugin>
  <groupId>org.jacoco</groupId>
  <artifactId>jacoco-maven-plugin</artifactId>
  <executions>
    <execution>
      <goals><goal>prepare-agent</goal></goals>
    </execution>
  </executions>
</plugin>
```

**Gradle** — `build.gradle` must include:
```groovy
plugins {
    id 'jacoco'
}
jacocoTestReport {
    reports { xml.required = true }
}
```

### Step 7: Copy CLAUDE.md

```bash
cp CLAUDE.md $TARGET/CLAUDE.md
```

Then open `$TARGET/CLAUDE.md` and update the **File Structure** section to reflect the target project's layout if it differs.

### Step 8: Verify setup

Open Claude Code in the target project and run:

```
/find-coverage-gaps
```

If a prioritized list of classes appears, the framework is working. If it fails, check:

| Problem | Fix |
|---------|-----|
| Agent not found | Confirm files are in `.claude/agents/`, restart Claude Code |
| Rules not loading | Confirm `rules/test_isolation/` files exist |
| Coverage report fails | Run `mvn test jacoco:report` or `./gradlew test jacocoTestReport` manually to check for build errors |
| Permission prompts appearing | Confirm `allow` entries in `.claude/settings.json` match your build tool |