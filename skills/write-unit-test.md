---
name: write-unit-test
description: Write unit tests for a given class using the full analyze → implement → review agent pipeline. Skips entity, DTO, and utility classes. Targets services and repositories primarily.
---

# /write-unit-test — Full Test Generation

## Usage

```
/write-unit-test <ClassName>
/write-unit-test <ClassName> <ClassName2> ...
```

Examples:
```
/write-unit-test OrderService
/write-unit-test PaymentProcessor UserRepository
```

## What It Does

Runs the full **analyze → implement → review** cycle for one or more classes. This skill is the primary entry point for test generation — never write tests manually, always go through this skill.

## Rules

Before starting, check if the class is in the skip list. If so, refuse and explain why:

- **Entity** (`@Entity`, `@Table`, or name ends with `Entity`) → skip
- **DTO** (name ends with `Dto`, `DTO`, `Request`, `Response`) → skip
- **Utility** (name ends with `Util`, `Utils`, `Helper`, `Helpers`, or only static methods) → skip

If the class is skippable, respond:
```
[ClassName] is a [entity/DTO/utility] class — test generation is disabled for this type.
Only services, repositories, controllers, and business logic classes are tested.
```

## Workflow

### Single class

Use the **Agent tool** with `subagent_type: "run-tests"`:

```
use run-tests to test <ClassName>
```

### Multiple classes

For each class in order, use `run-tests` one at a time. Do not batch into a single run-tests call — each class needs its own queue entry and completion record.

### Already completed

Before starting, check `test-memory-bank/test-tasks.md` for a `## Completed` entry with 100/100 for the target class. If found, report it and skip:
```
OrderService — already at 100/100 (last run: [date])
```

## Output

Print a one-line result per class after completion:

```
OrderService    — 100/100 ✓  (coverage: 87%, 6 tests)
UserRepository  — 100/100 ✓  (coverage: 92%, 8 tests)
```

Or if escalated:
```
PaymentProcessor — escalated ⚠  (gate: Coverage 61%, blocker: static dependency)
```