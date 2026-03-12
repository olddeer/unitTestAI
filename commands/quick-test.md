# /quick-test - Single Class Test Runner

## Usage

```
/quick-test <ClassName>
/quick-test <ClassName> --coverage-only
/quick-test <ClassName> --plan-only
```

Examples:
```
/quick-test OrderService
/quick-test PaymentProcessor --coverage-only
/quick-test UserValidator --plan-only
```

## What It Does

Runs the full analyze → implement → review cycle for a single class. Equivalent to manually invoking all three agents in sequence, but in one command.

- `--coverage-only` — skip writing tests; just report current coverage for the class
- `--plan-only` — run analyze-test only; stop after the plan is written (useful for review before implementing)

## Workflow

### Step 1: Check existing state

Read `test-memory-bank/test-tasks.md`. If the class already has a `## Completed` entry with 100/100, report it and stop — no work needed.

If the class has an in-progress plan but no implementation, skip analyze-test and go straight to implement-test.

### Step 2: Run analyze-test

Invoke the `analyze-test` agent on `<ClassName>`.

For **Simple** tasks: confirm the plan automatically and proceed.

For **Complex** tasks: present the design options to the user and wait for their choice before proceeding. This is the only mandatory pause in the flow.

If `--plan-only`: stop here. Print the plan path and tell the user to run `/quick-test <ClassName>` (without the flag) when ready to implement.

### Step 3: Run implement-test

Invoke the `implement-test` agent using the plan from `test-memory-bank/test-tasks.md`.

If tests fail to converge after 2 internal fix attempts: report the blocker and stop. Do not retry endlessly.

### Step 4: Run review-test

Invoke the `review-test` agent to validate and close out the task.

### Step 5: Report result

Print a one-line summary:

```
OrderService — 100/100 ✓  (coverage: 87%, 6 test methods)
```

Or if escalated:

```
PaymentProcessor — escalated ⚠  (failing gate: Coverage 61%, blocker: complex static util dependency)
```

---

## Coverage-only mode

When `--coverage-only` is passed:

1. Detect build tool (check for `pom.xml` or `build.gradle`)
2. Run tests with coverage:
   - Maven: `mvn -q -DskipITs test jacoco:report | cat`
   - Gradle: `./gradlew test jacocoTestReport`
3. Parse the JaCoCo XML for `<ClassName>` only
4. Report:

```
Coverage for OrderService:
  Line coverage:   73% (44/60 lines)
  Branch coverage: 68% (11/16 branches)
  Status: BELOW TARGET (< 80%)

Uncovered:
  - handleRefund() — lines 88-97
  - validateAmount() null branch — line 34
```

5. If below 80%: suggest running `/quick-test <ClassName>` to generate missing tests
6. If no test file exists: suggest running `/quick-test <ClassName>` to start from scratch
