---
name: analyze-unit-test
description: Analyze a class and produce a structured test plan without writing any tests. Assesses complexity, identifies dependencies, defines test scenarios, and writes the plan to test-memory-bank/test-tasks.md.
---

# /analyze-unit-test — Test Plan Analysis

## Usage

```
/analyze-unit-test <ClassName>
```

Examples:
```
/analyze-unit-test OrderService
/analyze-unit-test PaymentProcessor
```

## What It Does

Runs **analyze-test only** — produces a complete test plan and writes it to `test-memory-bank/test-tasks.md`. Does not write any tests. Use this when you want to review or adjust the plan before implementing.

After the plan is ready, run `/write-unit-test <ClassName>` to implement it.

## Rules

Before starting, check if the class is in the skip list:

- **Entity** (`@Entity`, `@Table`, or name ends with `Entity`) → skip
- **DTO** (name ends with `Dto`, `DTO`, `Request`, `Response`) → skip
- **Utility** (name ends with `Util`, `Utils`, `Helper`, `Helpers`, or only static methods) → skip

## Workflow

### Step 1: Check existing plan

Read `test-memory-bank/test-tasks.md`. If a `## Test Plan` already exists for this class with status `plan approved`, report it and ask whether to overwrite or proceed to implementation.

### Step 2: Delegate to analyze-test

Use the **Agent tool** with `subagent_type: "analyze-test"`:

```
use analyze-test to analyze <ClassName> and write the plan to test-memory-bank/test-tasks.md
```

### Step 3: Complexity gate

- **Simple** (0–2 dependencies): confirm the plan automatically and stop. Tell the user to run `/write-unit-test <ClassName>` when ready.
- **Complex** (3+ dependencies): PAUSE after analyze-test presents design options. Wait for the user's choice. Once confirmed, update the plan in test-tasks.md and stop. Tell the user to run `/write-unit-test <ClassName>` when ready.

## Output

After the plan is written, print a brief summary:

```
Plan written for OrderService → test-memory-bank/test-tasks.md

Complexity : Complex
Dependencies: OrderRepository, PaymentGateway, NotificationService, AuditLogger
Scenarios   : 7 test scenarios (3 happy path, 2 edge cases, 2 error handling)
Design options presented: yes — waiting for user choice

Run /write-unit-test OrderService to implement.
```