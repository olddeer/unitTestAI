# Unit Test Development Workflow

## Overview

```
┌─────────────────────────────────────────────────────┐
│                 START: New Test Task                 │
└───────────────────────┬─────────────────────────────┘
                        v
               ┌────────────────┐
               │  ANALYZE_TEST  │
               │  Scan project  │
               │  Assess: Simple│
               │  or Complex?   │
               └───────┬────────┘
                       │
          ┌────────────┼────────────┐
          v                         v
    ┌──────────┐              ┌──────────┐
    │  Simple  │              │ Complex  │
    │ 0-2 deps │              │ 3+ deps  │
    └────┬─────┘              └────┬─────┘
         │                         │
         │  Create test plan       │  Create test plan
         │                         │  + Present design
         │                         │    options to user
         │                         │  + Record choices
         └────────────┬────────────┘
                      v
               ┌────────────────┐
               │ IMPLEMENT_TEST │
               │ Write tests    │
               │ Run & fix      │◄──── Fix & re-run
               │ Until green    │      if tests fail
               └───────┬────────┘
                       │
                  All pass?
                  Coverage OK?
                       │
                  YES  │
                       v
               ┌────────────────┐
               │  REVIEW_TEST   │
               │  Run tests     │
               │  Score quality  │
               │  Check compliance│
               └───────┬────────┘
                       │
                  100/100?
                  │         │
             YES  │         │  NO
                  v         v
            ┌──────────┐  Back to
            │   DONE   │  IMPLEMENT_TEST
            │ Next     │  to fix issues
            │ class?   │
            └──────────┘
```

## ANALYZE_TEST - Entry Point

**Purpose**: Scan project, identify test gaps, create test plan

**Input**: Target class or "scan all"

**Process**:
1. Load project test standards
2. Scan for untested components
3. Assess complexity (Simple/Complex)
4. Create test plan with scenarios
5. For Complex: present design options, get user choice

**Output**: `test-memory-bank/test-tasks.md` with complete plan

## IMPLEMENT_TEST - Build

**Purpose**: Write tests, run them, fix until green

**Input**: Test plan from test-tasks.md

**Process**:
1. Create test file structure
2. Implement: happy path -> edge cases -> errors -> parameterized
3. Run tests after each method
4. Fix failures immediately
5. Generate coverage, add tests for gaps
6. Achieve 100/100 quality score

**Output**: Complete test file, all tests passing, coverage met

## REVIEW_TEST - Close Out

**Purpose**: Final quality validation and task closure

**Input**: Implemented tests

**Process**:
1. Run tests + coverage
2. Calculate quality score (100-point scale)
3. 7-item compliance check
4. Brief assessment (5-10 lines)
5. Completion entry in test-tasks.md

**Output**: Quality score, compliance status, completion record

## Quality Gates

```
┌─────────────────────────────────┐
│  Quality Score (100 points)     │
│                                 │
│  Tests Pass      40 pts        │
│  Coverage >=80%  30 pts        │
│  Test Count      30 pts        │
│                                 │
│  Target: 100/100               │
└─────────────────────────────────┘
```

## Complexity Decision

```
           Target Component
                 │
        ┌────────┴────────┐
        │ How many deps?  │
        │ How complex?    │
        └────────┬────────┘
                 │
     ┌───────────┴───────────┐
     v                       v
┌──────────┐           ┌──────────┐
│  Simple  │           │ Complex  │
│ 0-2 deps │           │ 3+ deps  │
│ Utility  │           │ Service  │
│ DTO      │           │ Controller│
│ Converter│           │ Integratn│
└──────────┘           └──────────┘
     │                       │
     │  Straight to          │  ANALYZE includes
     │  test plan            │  design options
     v                       v
Same 3-mode workflow: ANALYZE -> IMPLEMENT -> REVIEW
```

## Memory Bank

```
test-memory-bank/
└── test-tasks.md
    ├── Plan (created by ANALYZE_TEST)
    ├── Status (updated by IMPLEMENT_TEST)
    └── Completion entries (added by REVIEW_TEST)
```

## Mode Transitions

| From | Condition | To |
|------|-----------|-----|
| ANALYZE_TEST | Plan complete, user confirms | IMPLEMENT_TEST |
| IMPLEMENT_TEST | All tests pass, coverage OK | REVIEW_TEST |
| IMPLEMENT_TEST | Plan inadequate | ANALYZE_TEST |
| REVIEW_TEST | Score = 100/100 | Done (or ANALYZE_TEST for next class) |
| REVIEW_TEST | Score < 100/100 | IMPLEMENT_TEST |
