# Unit Test Development Workflow - Visual Guide

## 🎯 Complete Workflow Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    START: New Test Task                          │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   🔍 VAN_TEST   │
                    │  Initialization  │
                    └────────┬─────────┘
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
        ▼                    ▼                    ▼
   ┌─────────┐         ┌──────────┐        ┌──────────┐
   │ Level 1 │         │ Level 2  │        │ Level 3-4│
   │< 2 hours│         │ < 1 day  │        │ < 1 week │
   └────┬────┘         └─────┬────┘        └─────┬────┘
        │                    │                    │
        │                    ▼                    ▼
        │             ┌─────────────┐      ┌─────────────┐
        │             │ 📋 PLAN     │      │ 📋 PLAN     │
        │             │ Test Plan   │      │ Test Plan   │
        │             └──────┬──────┘      └──────┬──────┘
        │                    │                    │
        │                    │                    ▼
        │                    │             ┌─────────────┐
        │                    │             │ 🎨 CREATIVE │
        │                    │             │ Test Design │
        │                    │             └──────┬──────┘
        │                    │                    │
        └────────────────────┴────────────────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ ⚒️ IMPLEMENT    │
                    │ Write Tests     │
                    │ Run & Fix       │
                    └────────┬─────────┘
                             │
                    ┌────────┴─────────┐
                    │   Tests Pass?    │
                    │   Coverage OK?   │
                    └────────┬─────────┘
                             │
                        YES  │  NO → Fix & Re-run
                             ▼
                    ┌─────────────────┐
                    │ 🔍 REFLECT      │
                    │ Review & Learn  │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Quality: 100?  │
                    └────────┬─────────┘
                             │
                        YES  │  NO → Back to IMPLEMENT
                             ▼
                    ┌─────────────────┐
                    │   ✅ COMPLETE   │
                    │  Next Class?    │
                    └─────────────────┘
```

---

## 🔍 VAN_TEST Mode - Entry Point

**Purpose**: Analyze project, identify test gaps, assess complexity

### Input
- Project codebase
- Existing tests
- Coverage reports

### Process
```
1. Scan for untested classes
2. Generate JaCoCo coverage report
3. Identify coverage gaps
4. Assess complexity (Level 1-4)
5. Create test-tasks.md
6. Recommend workflow
```

### Output
- `test-memory-bank/test-tasks.md`
- `test-memory-bank/activeContext.md`
- Complexity assessment
- Workflow recommendation

### Example
```
VAN_TEST Analysis:
└── UserService
    ├── Complexity: Level 3
    ├── Dependencies: 5
    ├── Coverage: 0%
    └── Workflow: VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT
```

---

## 📋 PLAN_TEST Mode - Strategy

**Purpose**: Create detailed test scenarios, plan mock strategy

### Input
- Target class
- test-tasks.md from VAN_TEST
- Complexity level

### Process
```
1. Analyze target class methods
2. Identify dependencies to mock
3. Define comprehensive test scenarios
4. Plan Given-When-Then structure
5. Design test data strategy
6. Map coverage targets
```

### Output
- Detailed test plan in test-tasks.md
- Test scenarios (comprehensive, not fragmented)
- Mock strategy
- Test data creation approach
- Expected coverage map

### Example
```
PLAN for UserService:
├── Scenario 1: User creation with complete validation
│   ├── Given: Valid user data, repository mock
│   ├── When: createUser() called
│   └── Then: User created, saved, all fields validated
├── Scenario 2: User creation with validation errors
│   ├── Given: Invalid data (null email, weak password)
│   ├── When: createUser() called
│   └── Then: ValidationException with all errors
└── Scenario 3: Edge cases (Parameterized)
    └── 6 boundary conditions covered
```

---

## 🎨 CREATIVE_TEST Mode - Design

**Purpose**: Explore test design alternatives, document decisions

**When**: Level 3-4 complexity only

### Input
- Test plan from PLAN_TEST
- Design challenges
- Multiple approach options

### Process
```
1. Identify design challenges
2. Explore 2-3 alternatives for each
3. Analyze pros/cons
4. Recommend best approach
5. Document in creative-test-*.md
6. Establish reusable patterns
```

### Output
- `test-memory-bank/creative-test-[topic]-[date].md`
- Design decision documentation
- Reusable pattern library
- Updated test plan with chosen approach

### Example
```
CREATIVE Design Challenge: Test Data Creation
├── Option A: Builder Pattern
│   ├── ✅ Reusable, fluent
│   └── ❌ Extra code
├── Option B: Helper Methods
│   ├── ✅ Simple
│   └── ❌ Less flexible
└── Option C: Fluent Setters ⭐ CHOSEN
    ├── ✅ Minimal code
    ├── ✅ Clear intent
    └── ✅ Follows project standards
```

---

## ⚒️ IMPLEMENT_TEST Mode - Build

**Purpose**: Write tests, execute them, fix until all pass

### Input
- Test plan (from PLAN_TEST)
- Design decisions (from CREATIVE_TEST if used)
- test-tasks.md

### Process
```
1. Create test class structure
2. Implement test methods systematically
   ├── Happy path first
   ├── Edge cases
   ├── Error scenarios
   └── Parameterized tests
3. Run tests after each method
4. Fix failures immediately
5. Generate coverage report
6. Add tests for gaps
7. Verify quality gates (100/100)
```

### Output
- Complete test file (ClassNameTest.java)
- All tests passing (green ✅)
- Coverage ≥ 80%
- Test count ≤ 10
- `test-memory-bank/test-progress.md`

### Quality Gate Validation
```
IMPLEMENT Progress:
├── Tests Pass: 40/40 ✅
│   └── 8 tests, 0 failures, 0 errors
├── Coverage: 30/30 ✅
│   └── 87% line coverage (target: 80%)
├── Test Count: 30/30 ✅
│   └── 8 methods (target: ≤10)
└── Total: 100/100 🎯
```

---

## 🔍 REFLECT_TEST Mode - Review

**Purpose**: Validate quality, document learnings, extract patterns

### Input
- Implemented test file
- Test execution results
- Coverage report
- test-progress.md

### Process
```
1. Run final test validation
2. Generate coverage report
3. Calculate quality gate score
4. Review code quality
5. Document what worked
6. Document challenges & solutions
7. Extract reusable patterns
8. Create reflection document
```

### Output
- `test-memory-bank/reflect-test-[class]-[date].md`
- Quality assessment (X/100)
- Lessons learned documentation
- Reusable pattern library
- Recommendations for future

### Example
```
REFLECT UserService:
├── Quality: 100/100 ✅
├── What Worked:
│   ├── Comprehensive scenarios reduced test count
│   ├── Parameterized tests covered 8 edge cases
│   └── Helper methods with fluent setters
├── Challenges:
│   ├── Complex mock chain → Used RETURNS_DEEP_STUBS
│   └── Initial fragmentation → Consolidated
└── Patterns:
    ├── Service test structure
    ├── Parameterized edge case pattern
    └── Comprehensive validation pattern
```

---

## 📊 Complexity Level Decision Tree

```
                    Analyze Target Class
                           │
                    ┌──────┴──────┐
                    │ Count:      │
                    │ - Methods   │
                    │ - Deps      │
                    │ - Logic     │
                    └──────┬──────┘
                           │
          ┌────────────────┼────────────────┐
          │                │                │
          ▼                ▼                ▼
    ┌──────────┐     ┌──────────┐    ┌──────────┐
    │ Level 1  │     │ Level 2  │    │ Level 3-4│
    │ Simple   │     │ Medium   │    │ Complex  │
    └──────────┘     └──────────┘    └──────────┘
          │                │                │
    ┌─────┴─────┐    ┌─────┴─────┐   ┌─────┴─────┐
    │ - DTO     │    │ - Service │   │ - Complex │
    │ - Util    │    │   2-3 deps│   │   Service │
    │ - Simple  │    │ - Validat.│   │   5+ deps │
    │   Convert │    │ - Convert.│   │ - Control │
    └───────────┘    └───────────┘   │ - Integrat│
                                      └───────────┘
          │                │                │
          ▼                ▼                ▼
    Skip PLAN      Use PLAN          Use PLAN +
    Skip CREATIVE  Skip CREATIVE     CREATIVE
```

---

## 🎯 Test Quality Metrics

```
Quality Gate Scorecard (100 points)
┌─────────────────────────────────────┐
│                                     │
│  ✅ Tests Pass (40 points)         │
│     All tests green                 │
│     0 failures, 0 errors            │
│                                     │
│  ✅ Coverage ≥80% (30 points)      │
│     Line coverage for target class  │
│     Branch coverage bonus           │
│                                     │
│  ✅ Test Count ≤10 (30 points)     │
│     Comprehensive, not fragmented   │
│     Quality over quantity           │
│                                     │
│  🎯 TOTAL: 100/100                 │
│                                     │
└─────────────────────────────────────┘
```

---

## 📁 Memory Bank Evolution

```
test-memory-bank/ Evolution:
│
├── After VAN_TEST:
│   ├── test-tasks.md        [Created]
│   └── activeContext.md     [Created]
│
├── After PLAN_TEST:
│   └── test-tasks.md        [Updated with plan]
│
├── After CREATIVE_TEST:
│   └── creative-test-*.md   [Created]
│
├── During IMPLEMENT_TEST:
│   ├── test-progress.md     [Created, updated frequently]
│   └── test-tasks.md        [Updated with progress]
│
└── After REFLECT_TEST:
    ├── reflect-test-*.md    [Created]
    └── test-tasks.md        [Marked complete]
```

---

## 🔄 Mode Transition Decision Matrix

| Current Mode | Condition | Next Mode |
|--------------|-----------|-----------|
| **VAN_TEST** | Level 1 complexity | IMPLEMENT_TEST |
| **VAN_TEST** | Level 2+ complexity | PLAN_TEST |
| **PLAN_TEST** | Level 1-2 complexity | IMPLEMENT_TEST |
| **PLAN_TEST** | Level 3-4 complexity | CREATIVE_TEST |
| **CREATIVE_TEST** | Design complete | IMPLEMENT_TEST |
| **IMPLEMENT_TEST** | Tests pass, coverage OK | REFLECT_TEST |
| **IMPLEMENT_TEST** | Tests fail | Stay in IMPLEMENT_TEST |
| **IMPLEMENT_TEST** | Coverage low | Stay in IMPLEMENT_TEST |
| **REFLECT_TEST** | Review complete | VAN_TEST (next class) |
| **REFLECT_TEST** | Quality issues | IMPLEMENT_TEST |

---

## 🎨 Visual Mode Capabilities

```
Mode Capabilities Matrix:
┌────────────────┬─────┬─────┬─────┬─────┬─────┐
│ Tool           │ VAN │PLAN │CREA │IMPL │REFL │
├────────────────┼─────┼─────┼─────┼─────┼─────┤
│ Codebase Search│  ✅  │  ✅  │  ✅  │  ✅  │  ✅  │
│ Read File      │  ✅  │  ✅  │  ✅  │  ✅  │  ✅  │
│ Terminal       │  ✅  │  ✅  │  ✅  │  ✅  │  ✅  │
│ List Directory │  ✅  │  ✅  │  ✅  │  ✅  │  ✅  │
│ Edit File      │     │     │  ✅  │  ✅  │  ✅  │
│ Fetch Rules    │  ✅  │     │  ✅  │  ✅  │     │
│ Write File     │     │     │     │  ✅  │     │
│ Delete File    │     │     │     │  ✅  │     │
└────────────────┴─────┴─────┴─────┴─────┴─────┘

Legend:
✅ = Tool enabled in mode
    = Tool not enabled in mode
```

---

## 🚦 Success Indicators by Mode

### VAN_TEST Success ✅
- [ ] Coverage report generated
- [ ] Untested classes identified
- [ ] Complexity level assigned
- [ ] test-tasks.md created
- [ ] Workflow recommended

### PLAN_TEST Success ✅
- [ ] All methods identified
- [ ] Dependencies listed
- [ ] Mock strategy defined
- [ ] Comprehensive scenarios planned
- [ ] Test data strategy established

### CREATIVE_TEST Success ✅
- [ ] Design challenges identified
- [ ] 2-3 alternatives explored
- [ ] Decision documented
- [ ] Reusable patterns extracted
- [ ] creative-test-*.md created

### IMPLEMENT_TEST Success ✅
- [ ] All tests written
- [ ] All tests pass (green)
- [ ] Coverage ≥ 80%
- [ ] Test count ≤ 10
- [ ] Quality: 100/100

### REFLECT_TEST Success ✅
- [ ] Quality validated (100/100)
- [ ] Code quality reviewed
- [ ] Lessons documented
- [ ] Patterns extracted
- [ ] reflect-test-*.md created

---

## 🎯 Final Checklist

```
Before Starting:
□ Custom modes configured in Cursor
□ .cursor/rules/java-test-rule.mdc exists
□ JUnit 5 + AssertJ + Mockito dependencies ready
□ JaCoCo coverage plugin configured

During Development:
□ Always start with VAN_TEST
□ Follow recommended workflow
□ Run tests frequently (IMPLEMENT_TEST)
□ Fix failures immediately
□ Update test-tasks.md continuously

After Completion:
□ Quality gate: 100/100 achieved
□ Reflection document created
□ Patterns extracted and documented
□ Ready for next class
```

---

**This is your visual guide to structured, systematic unit test development!** 🚀✅

Keep this handy and refer to it whenever you need to understand the workflow or decide which mode to use next.

