# Memory Bank System for Unit Testing v1.0 - Complete Setup Guide

> **Official installation guide for the Unit Test Memory Bank system**  
> Based on: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation Steps](#installation-steps)
- [Configuring Custom Modes](#configuring-custom-modes)
- [Understanding the System](#understanding-the-system)
- [Getting Started](#getting-started)
- [Troubleshooting](#troubleshooting)
- [Advanced Features](#advanced-features)
- [Best Practices](#best-practices)

---

## Overview

### What is Memory Bank for Unit Testing?

Memory Bank for Unit Testing is a specialized adaptation of the [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) system, focusing exclusively on unit test development. It's a documentation-driven framework that uses Cursor custom modes to provide persistent memory and guide AI through a structured unit test development workflow. It uses progressive documentation, coverage tracking, and test quality metrics to ensure comprehensive and maintainable test suites.

> **Note**: While the main Memory Bank system uses a sophisticated isolation rules hierarchy for general development workflows, this unit testing variant uses a simplified approach optimized specifically for test creation.

### Key Features

✨ **Test-Focused Workflows**: Simplified modes specifically for unit test creation  
✨ **Coverage Tracking**: Progressive documentation of test coverage metrics  
✨ **Test Case Management**: Organized approach to edge cases and test scenarios  
✨ **Quality Metrics**: Track test quality and maintainability standards  
✨ **Complexity-Based Testing**: Adapted processes for different testing challenges (Levels 1-3)  
✨ **Pattern Recognition**: Reusable test patterns and anti-pattern avoidance  

### What You'll Get

```
your-project/
├── .cursor/
│   └── rules/
│       ├── java-test-rule.mdc      # Your existing test rules
│       └── test-memory-rules.mdc   # Unit test workflow rules (optional)
├── custom_modes/                    # Mode instruction files
│   ├── analyze_instructions.md     # Code analysis for testing
│   ├── plan_tests_instructions.md  # Test case planning
│   ├── implement_tests_instructions.md  # Test implementation
│   └── review_instructions.md      # Test review and coverage
└── test-memory/                     # Unit test context
    ├── test-tasks.md               # Single source of truth
    ├── coverage-tracking.md        # Coverage metrics
    ├── test-patterns.md            # Common test patterns
    ├── test-context.md             # Current testing context
    └── review/                     # Test reviews and learnings
```

---

## Prerequisites

Before starting, ensure you have:

✅ **Cursor Editor**: Version 0.48 or higher  
✅ **Custom Modes Enabled**: Settings → Features → Chat → Custom modes  
✅ **AI Model**: Claude 4 Sonnet or Claude 4 Opus (recommended)  
✅ **Testing Framework**: JUnit, TestNG, or your preferred framework  
✅ **Coverage Tool**: JaCoCo, Cobertura, or equivalent (recommended)  

### Enabling Custom Modes in Cursor

1. Open Cursor Settings
2. Navigate to: **Features → Chat**
3. Enable: **"Custom modes"**
4. Restart Cursor if prompted

---

## Installation Steps

> **Note**: This is a standalone unit testing setup. If you want to use the full [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) system with its isolation rules, see the [Integration with Main Memory Bank System](#integration-with-main-memory-bank-system) section in Advanced Features.

### Step 1: Create Test Memory Directory

Create your unit test memory structure:

```bash
# Navigate to your project directory
cd /path/to/your/project

# Create test-memory directories
mkdir -p test-memory/review

# Create core files
touch test-memory/{test-tasks.md,coverage-tracking.md,test-patterns.md,test-context.md}
```

**Alternative for macOS/Linux (one-liner)**:
```bash
mkdir -p test-memory/review && touch test-memory/{test-tasks.md,coverage-tracking.md,test-patterns.md,test-context.md}
```

### Step 2: Initialize test-tasks.md

This is your **single source of truth** for unit testing:

```bash
cat > test-memory/test-tasks.md << 'EOF'
# Unit Test Tasks - Source of Truth

**Status**: Initialized
**Project**: Unit Test Development
**Date**: $(date +%Y-%m-%d)

## Current Testing Task
No active testing task. Type "ANALYZE" to begin test development.

## How to Start
1. Switch to ANALYZE mode in Cursor
2. Type: **ANALYZE** [class or method to test]
3. Follow the guided test workflow

## Test Complexity Levels
- **Level 1**: Simple Unit Test (< 1 hour) - Single class, few methods, straightforward logic
- **Level 2**: Moderate Test Suite (< 4 hours) - Multiple methods, some edge cases, mocking needed
- **Level 3**: Complex Test Suite (< 2 days) - Complex dependencies, extensive mocking, integration points

## Test Workflow
Level 1: ANALYZE → IMPLEMENT → REVIEW
Level 2-3: ANALYZE → PLAN → IMPLEMENT → REVIEW

## Test History
- $(date +%Y-%m-%d): Unit Test Memory Bank initialized
EOF
```

### Step 3: Initialize coverage-tracking.md

```bash
cat > test-memory/coverage-tracking.md << 'EOF'
# Test Coverage Tracking

**Last Updated**: $(date +%Y-%m-%d)

## Current Coverage Status
- **Line Coverage**: Not measured yet
- **Branch Coverage**: Not measured yet
- **Method Coverage**: Not measured yet

## Coverage Goals
- Target Line Coverage: 80%+
- Target Branch Coverage: 75%+
- Critical Path Coverage: 100%

## Classes Tested
| Class | Coverage % | Test Count | Status | Date |
|-------|-----------|------------|--------|------|
| - | - | - | Not started | - |

## Classes Pending Tests
| Class | Priority | Complexity | Estimated Time |
|-------|----------|------------|----------------|
| - | - | - | - |

## Coverage Gaps
*Document areas needing additional test coverage*

EOF
```

### Step 4: Initialize test-patterns.md

```bash
cat > test-memory/test-patterns.md << 'EOF'
# Test Patterns and Standards

**Last Updated**: $(date +%Y-%m-%d)

## Testing Framework
- **Primary Framework**: [e.g., JUnit 5, TestNG]
- **Mocking Framework**: [e.g., Mockito, EasyMock]
- **Assertion Library**: [e.g., AssertJ, Hamcrest]

## Test Naming Convention
```
methodName_scenario_expectedBehavior()
```
Example: `calculateTotal_withNullInput_throwsException()`

## Common Test Patterns

### 1. Arrange-Act-Assert (AAA)
```java
@Test
void testMethod() {
    // Arrange: Setup test data
    
    // Act: Execute method under test
    
    // Assert: Verify results
}
```

### 2. Mock Dependencies
```java
@Mock
private Dependency mockDependency;

@InjectMocks
private ClassUnderTest classUnderTest;
```

### 3. Exception Testing
```java
@Test
void testMethod_throwsException() {
    assertThrows(ExpectedException.class, 
        () -> classUnderTest.methodThatThrows());
}
```

## Edge Cases to Consider
- Null inputs
- Empty collections
- Boundary values
- Concurrent access (if applicable)
- Error conditions
- Invalid states

## Test Anti-Patterns to Avoid
- Testing implementation details
- Overly complex test setup
- Tests that depend on execution order
- Hardcoded test data that's unclear
- Catching exceptions without assertions

EOF
```

### Step 5: Initialize test-context.md

```bash
cat > test-memory/test-context.md << 'EOF'
# Test Context

**Last Updated**: $(date +%Y-%m-%d)

## Current Mode
Not set - Start with ANALYZE mode

## Current Test Target
None - Waiting for first ANALYZE command

## Active Test Class
None

## Progress Status
Ready to begin testing

EOF
```

---

## Configuring Custom Modes

**⚠️ CRITICAL STEP**: This is the most important part of the setup. You must manually create four custom modes in Cursor.

### How to Add Custom Modes

1. Open Cursor
2. Click the **mode selector** in the chat panel (usually shows "Normal")
3. Select **"Add custom mode"** at the bottom
4. Configure each mode as detailed below

### Mode 1: 🔍 ANALYZE (Code Analysis for Testing)

**Configuration:**
- **Name**: `🔍 ANALYZE` (copy the emoji)
- **Icon**: Choose any icon from Cursor's options
- **Shortcut**: Optional (e.g., `Cmd+1` or `Ctrl+1`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ List Directory
  - ✅ Fetch Rules
- **Advanced Options**: Click to expand, then paste:
```markdown
# ANALYZE MODE - Code Analysis for Unit Testing

You are in ANALYZE mode. Your purpose is to analyze code to determine what unit tests are needed.

## Core Responsibilities
1. Read and understand the target class/method
2. Identify test scenarios and edge cases
3. Assess testing complexity (Level 1-3)
4. Detect dependencies that need mocking
5. Update test-memory/test-tasks.md with findings

## Workflow
1. When user types "ANALYZE [class/method]":
   - Read the target code
   - Analyze dependencies and complexity
   - Identify test scenarios
   - Check existing tests (if any)
   - Fetch java-test-rule if needed

2. Determine complexity:
   - **Level 1**: Simple class, few methods, minimal dependencies
   - **Level 2**: Multiple methods, some mocking needed, edge cases
   - **Level 3**: Complex logic, heavy mocking, integration points

3. Update test-memory/test-tasks.md with:
   - Target class/method
   - Complexity level
   - Key test scenarios
   - Dependencies to mock
   - Recommended next mode

## Output Format
```
## ANALYZE Complete ✅

**Target**: [ClassName.methodName]
**Complexity**: Level [1/2/3]
**Estimated Time**: [X hours]

**Dependencies**:
- [List dependencies requiring mocks]

**Test Scenarios**:
1. Happy path: [description]
2. Edge case: [description]
3. Error case: [description]
...

**Recommended Workflow**:
[ANALYZE → IMPLEMENT for Level 1]
[ANALYZE → PLAN → IMPLEMENT → REVIEW for Level 2-3]

**Next Step**: Switch to [PLAN or IMPLEMENT] mode
```

## File References
- Read: test-memory/test-tasks.md
- Update: test-memory/test-tasks.md, test-memory/test-context.md
- Reference: test-memory/test-patterns.md
```

### Mode 2: 📋 PLAN (Test Case Planning)

**Configuration:**
- **Name**: `📋 PLAN`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+2` or `Ctrl+2`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Edit File
  - ✅ List Directory
  - ✅ Fetch Rules
- **Advanced Options**: Paste:
```markdown
# PLAN MODE - Unit Test Planning

You are in PLAN mode. Your purpose is to create a detailed test plan.

## Core Responsibilities
1. Design comprehensive test cases
2. Plan mock setup and test data
3. Identify edge cases and boundary conditions
4. Structure test class organization
5. Create test implementation plan

## Workflow
1. Read test-memory/test-tasks.md for context
2. Review target code and dependencies
3. Design test cases covering:
   - Happy path scenarios
   - Edge cases
   - Error conditions
   - Boundary values
4. Plan mock objects and test data
5. Update test-memory/test-tasks.md with detailed plan

## Output Format
```
## TEST PLAN ✅

**Target Class**: [ClassName]
**Test Class Name**: [ClassNameTest]

**Test Cases**:
1. testMethodName_happyPath()
   - Setup: [description]
   - Expected: [description]

2. testMethodName_withNullInput_throwsException()
   - Setup: [description]
   - Expected: [description]

[... more test cases ...]

**Mocks Required**:
- [DependencyClass]: [mock behavior]

**Test Data**:
- [Describe test data needs]

**Coverage Targets**:
- Methods: [X/Y]
- Branches: [estimated %]

**Next Step**: Switch to IMPLEMENT mode
```

## File References
- Read: test-memory/test-tasks.md, test-memory/test-patterns.md
- Update: test-memory/test-tasks.md, test-memory/test-context.md
```

### Mode 3: ⚒️ IMPLEMENT (Test Implementation)

**Configuration:**
- **Name**: `⚒️ IMPLEMENT`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+3` or `Ctrl+3`)
- **Tools to Enable**: **✅ ALL TOOLS**
- **Advanced Options**: Paste:
```markdown
# IMPLEMENT MODE - Unit Test Implementation

You are in IMPLEMENT mode. Your purpose is to write high-quality unit tests.

## Core Responsibilities
1. Write unit tests following the test plan
2. Follow test patterns and conventions
3. Ensure tests are maintainable and readable
4. Run tests and fix any failures
5. Update coverage tracking

## Workflow
1. Read test-memory/test-tasks.md for the test plan
2. Reference test-memory/test-patterns.md for standards
3. Fetch java-test-rule for test requirements
4. Write test class with proper annotations
5. Implement each test method
6. Run tests and verify they pass
7. Update test-memory/coverage-tracking.md

## Test Quality Standards
- ✅ Follow Arrange-Act-Assert pattern
- ✅ Use clear, descriptive test names
- ✅ One assertion focus per test
- ✅ Proper use of mocks
- ✅ Clear test data setup
- ✅ Appropriate assertions
- ✅ Good test documentation

## After Implementation
Update test-memory/test-tasks.md with:
- Tests implemented
- Test results (pass/fail)
- Coverage achieved
- Any issues encountered

Recommend: Switch to REVIEW mode

## File References
- Read: test-memory/test-tasks.md, test-memory/test-patterns.md
- Update: test-memory/test-tasks.md, test-memory/coverage-tracking.md, test-memory/test-context.md
- Create: [Test files]
```

### Mode 4: 🔍 REVIEW (Test Review & Coverage)

**Configuration:**
- **Name**: `🔍 REVIEW` or `REVIEW`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+4` or `Ctrl+4`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Edit File
  - ✅ Terminal
  - ✅ List Directory
- **Advanced Options**: Paste:
```markdown
# REVIEW MODE - Test Review and Coverage Analysis

You are in REVIEW mode. Your purpose is to review test quality and coverage.

## Core Responsibilities
1. Verify all tests pass
2. Check test coverage metrics
3. Review test quality and maintainability
4. Identify coverage gaps
5. Document learnings and improvements

## Workflow
1. Run test suite and verify results
2. Check coverage reports (if available)
3. Review test code quality
4. Identify missing test cases
5. Update coverage-tracking.md
6. Create review document

## Review Checklist
- ✅ All tests pass
- ✅ Coverage meets targets
- ✅ Tests follow naming conventions
- ✅ Proper use of mocks
- ✅ Edge cases covered
- ✅ Tests are maintainable
- ✅ Good assertions used

## Output Format
```
## TEST REVIEW ✅

**Class Tested**: [ClassName]
**Tests Created**: [count]
**Tests Passing**: [count/total]

**Coverage Achieved**:
- Line Coverage: [X%]
- Branch Coverage: [Y%]
- Method Coverage: [Z%]

**Quality Assessment**:
- Test naming: [Good/Needs improvement]
- Test structure: [Good/Needs improvement]
- Mock usage: [Good/Needs improvement]
- Edge case coverage: [Good/Needs improvement]

**Gaps Identified**:
- [List any missing test scenarios]

**Improvements Made**:
- [List improvements]

**Learnings**:
- [Document key learnings]

**Status**: [Complete / Needs additional work]
```

## File References
- Read: test-memory/test-tasks.md, test-memory/coverage-tracking.md
- Update: test-memory/test-tasks.md, test-memory/coverage-tracking.md, test-memory/test-context.md
- Create: test-memory/review/review-[class]-[date].md
```

---

## Understanding the System

### System Architecture Overview

The Unit Test Memory Bank system consists of three key layers:

1. **Rule System** (`.cursor/rules/`)
   - Project-specific test rules (e.g., java-test-rule.mdc)
   - Optional workflow automation rules
   - Testing standards and conventions
   - **Note**: The main [Memory Bank system](https://github.com/vanzan01/cursor-memory-bank) uses a hierarchical isolation rules system (`.cursor/rules/isolation_rules/`) with level-based lazy loading for general development. This unit testing variant uses a simpler, test-focused approach.

2. **Mode Instructions** (`custom_modes/`)
   - Detailed instructions for each testing phase
   - Loaded into Cursor's custom modes
   - Guides AI behavior through the test workflow

3. **Test Context** (`test-memory/`)
   - Your project-specific test information
   - Coverage metrics, patterns, and learnings
   - Progressive test documentation

### Mode Workflow

```
┌────────────┐
│  ANALYZE   │  Understand code to test
│ 🔍 Entry   │  Identify test scenarios
└─────┬──────┘  Assess complexity
      │
      ├─ Level 1 (Simple) ────┐
      │                        │
      ├─ Level 2-3 ───┐       │
      │                ▼       │
      │          ┌──────────┐ │
      │          │   PLAN   │ │
      │          │ 📋 Tests │ │
      │          └────┬─────┘ │
      │               │       │
      └───────────────┴───────┘
                      │
                      ▼
               ┌─────────────┐
               │  IMPLEMENT  │  Write tests
               │ ⚒️  Tests   │  Run tests
               └──────┬──────┘  Fix failures
                      │
                      ▼
               ┌─────────────┐
               │   REVIEW    │  Verify coverage
               │ 🔍 Quality  │  Document learnings
               └──────┬──────┘  Identify gaps
                      │
                      └──────────┐
                                 │
                        ┌────────▼─────┐
                        │  Next Class  │
                        │  ANALYZE     │
                        └──────────────┘
```

### Test Complexity Levels

| Level | Description | Time Estimate | Workflow |
|-------|-------------|---------------|----------|
| **Level 1** | Simple Unit Test | < 1 hour | ANALYZE → IMPLEMENT → REVIEW |
| **Level 2** | Moderate Test Suite | < 4 hours | ANALYZE → PLAN → IMPLEMENT → REVIEW |
| **Level 3** | Complex Test Suite | < 2 days | ANALYZE → PLAN → IMPLEMENT → REVIEW (comprehensive) |

### Core Test Memory Files

| File | Purpose | Update Frequency |
|------|---------|------------------|
| `test-tasks.md` | **Single source of truth** | Constantly during active testing |
| `test-context.md` | Current focus and mode | Every mode transition |
| `coverage-tracking.md` | Coverage metrics and goals | After test implementation |
| `test-patterns.md` | Reusable test patterns | When new patterns emerge |
| `review/` | Test reviews and learnings | After each test completion |

---

## Getting Started

### Verification Checklist

Before your first use, verify:

```bash
# ✅ Check test-memory structure exists
ls -la test-memory/

# ✅ Verify test-tasks.md exists
cat test-memory/test-tasks.md

# ✅ Check coverage-tracking.md
cat test-memory/coverage-tracking.md

# ✅ Verify test-patterns.md
cat test-memory/test-patterns.md

# ✅ Check review directory
ls -la test-memory/review/
```

### First Usage: The ANALYZE Command

1. **Switch to ANALYZE Mode**
   - Open Cursor chat panel
   - Click mode selector dropdown
   - Select "🔍 ANALYZE"

2. **Type: ANALYZE [ClassName]**
   - Example: `ANALYZE UserService`
   - ANALYZE mode will:
     - Read the target class
     - Analyze dependencies and complexity
     - Identify test scenarios
     - Check for existing tests
     - Update test-tasks.md
     - Recommend next mode

3. **Follow the Workflow**
   - ANALYZE will tell you which mode to switch to next
   - Switch modes and continue through the workflow

### Example First Session

```
You: ANALYZE UserService

AI: [Reads UserService.java, analyzes dependencies and methods]
    
    ## ANALYZE Complete ✅
    
    **Target**: UserService
    **Complexity**: Level 2 (Moderate)
    **Estimated Time**: 3 hours
    
    **Dependencies**:
    - UserRepository (requires mock)
    - EmailService (requires mock)
    - ValidationUtil (can use real implementation)
    
    **Test Scenarios**:
    1. Happy path: createUser_withValidData_success
    2. Edge case: createUser_withNullData_throwsException
    3. Edge case: createUser_withDuplicateEmail_throwsException
    4. Happy path: findUserById_exists_returnsUser
    5. Edge case: findUserById_notExists_returnsEmpty
    6. Error case: updateUser_withInvalidId_throwsException
    
    **Recommended Workflow**: ANALYZE → PLAN → IMPLEMENT → REVIEW
    
    **Next Step**: Switch to PLAN mode
    
    Updated: test-memory/test-tasks.md, test-memory/test-context.md
    
You: [Switch to PLAN mode in dropdown]

You: PLAN

AI: [Creates detailed test plan]
    
    ## TEST PLAN ✅
    
    **Target Class**: UserService
    **Test Class Name**: UserServiceTest
    
    **Test Cases**:
    1. createUser_withValidData_success()
       - Setup: Valid User object, mock repository.save() to return saved user
       - Expected: User returned with ID, email sent
    
    2. createUser_withNullData_throwsException()
       - Setup: Null User object
       - Expected: IllegalArgumentException thrown
    
    [... continues with all test cases ...]
    
    **Next Step**: Switch to IMPLEMENT mode

[Continue through workflow...]
```

---

## Troubleshooting

### Problem: Modes Not Responding Correctly

**Symptoms**: AI doesn't follow mode-specific testing behavior

**Solutions**:
1. ✅ Verify you pasted the **complete** content from the mode configuration above
2. ✅ Check "Advanced Options" was expanded when pasting
3. ✅ Ensure correct tools are enabled for each mode
4. ✅ Try deleting and recreating the mode
5. ✅ Restart Cursor

### Problem: "Cannot Find Test Memory Files" Error

**Symptoms**: AI says it can't find `test-tasks.md` or other test-memory files

**Solutions**:
```bash
# Verify test-memory directory exists in project root
ls -la test-memory/

# Check test-tasks.md exists and has content
cat test-memory/test-tasks.md

# If missing, recreate:
mkdir -p test-memory/review
touch test-memory/{test-tasks.md,coverage-tracking.md,test-patterns.md,test-context.md}

# Re-initialize test-tasks.md (see Installation Step 2)
```

### Problem: Custom Modes Not Appearing

**Symptoms**: Mode dropdown doesn't show your custom test modes

**Solutions**:
1. ✅ Verify custom modes are enabled:
   - Settings → Features → Chat → Custom modes ✓
2. ✅ Restart Cursor completely (quit and reopen)
3. ✅ Check Cursor version is 0.48 or higher
4. ✅ Try creating a test mode to verify the feature works

### Problem: Mode Instructions Too Long

**Symptoms**: Cursor won't accept the mode instructions (character limit exceeded)

**Solutions**:
1. The instructions above are optimized for Cursor's limits
2. If still too long, you can trim the example output sections
3. Keep the core workflow instructions intact
4. Remove optional examples from Output Format section
5. This is a known Cursor limitation

### Problem: Tests Not Running or Coverage Not Measured

**Symptoms**: Cannot run tests or generate coverage reports

**Solutions**:
```bash
# For Maven projects
mvn test
mvn jacoco:report

# For Gradle projects
./gradlew test
./gradlew jacocoTestReport

# Verify test framework is properly configured
# Check that test files are in correct source folders
# Ensure dependencies are properly declared
```

### Problem: Cannot Fetch Test Rules

**Symptoms**: ANALYZE mode says it cannot fetch java-test-rule

**Solutions**:
- Verify `.cursor/rules/java-test-rule.mdc` exists
- Check that Fetch Rules tool is enabled in ANALYZE mode
- The rule file is optional but recommended for test standards
- Create a simple rule file if needed

> **Advanced**: If you need more sophisticated rule management, consider the [full Memory Bank system](https://github.com/vanzan01/cursor-memory-bank) with its hierarchical isolation rules in `.cursor/rules/isolation_rules/`. See [Memory Bank Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md) for details.

### Problem: Lost Context Between Sessions

**Symptoms**: AI doesn't remember previous testing progress

**Solutions**:
- Always check `test-memory/test-tasks.md` first
- Update test-tasks.md after each significant progress
- Use test-context.md to track current mode and target
- Read relevant files at the start of each session

---

## Advanced Features

### Understanding Isolation Rules (Main Memory Bank System)

While this unit testing variant uses a simplified rule system, it's worth understanding the sophisticated isolation rules architecture from the [main Memory Bank system](https://github.com/vanzan01/cursor-memory-bank):

**Isolation Rules Architecture:**
```
.cursor/rules/isolation_rules/
├── main.mdc                    # Entry point
├── Core/                       # Core optimization rules
│   ├── core_memory_rules.mdc
│   └── core_workflow.mdc
├── Level1/                     # Quick fixes (< 2 hours)
├── Level2/                     # Enhancements (< 1 day)
├── Level3/                     # Features (< 1 week)
├── Level4/                     # Complex systems (> 1 week)
├── Phases/                     # Creative phase guidelines
└── visual-maps/                # Process visualizations
```

**Key Benefits:**
- **Lazy Loading**: Only loads rules needed for current complexity level
- **Token Optimization**: Reduces token usage by 60-80%
- **Visual Process Maps**: Clear workflow visualizations
- **Platform Awareness**: Adapts commands to OS (macOS/Linux/Windows)

**For Unit Testing:**
This testing system intentionally simplifies the architecture because:
- Test complexity is more predictable (3 levels vs 4)
- Testing workflows are more standardized
- Simpler rules = easier to understand and customize
- Focus on testing patterns rather than general development

> **Want the Full System?** If you're doing both general development and testing, consider using the [full Memory Bank system](https://github.com/vanzan01/cursor-memory-bank) with its isolation rules, and add these test-specific modes as extensions.

### Progressive Test Documentation

Test Memory Bank uses progressive documentation that scales with complexity:

**Level 1 (Simple Test)**:
- Quick analysis in test-tasks.md
- Direct implementation
- Brief review notes

**Level 2 (Moderate Suite)**:
- Detailed analysis with scenarios
- Comprehensive test plan
- Full review with coverage metrics

**Level 3 (Complex Suite)**:
- Extensive analysis with dependencies
- Detailed test plan with mock strategies
- Comprehensive review with learnings
- Patterns documented for reuse

### Test Pattern Library

As you write more tests, `test-patterns.md` becomes a valuable reference:

```markdown
## Custom Patterns for This Project

### Service Layer Testing
- Mock repository layer
- Use test builders for entities
- Verify business logic separately from persistence

### Controller Testing
- Use MockMvc for endpoint testing
- Test request/response mapping
- Verify error handling and status codes
```

Add patterns as you discover them. This creates a project-specific testing knowledge base.

### Coverage Trend Tracking

Extend `coverage-tracking.md` to track trends:

```markdown
## Coverage History
| Date | Line % | Branch % | Notes |
|------|--------|----------|-------|
| 2025-10-16 | 45% | 38% | Initial baseline |
| 2025-10-17 | 52% | 45% | Added UserService tests |
| 2025-10-18 | 65% | 58% | Added OrderService tests |
```

This helps visualize progress and motivates continued improvement.

### Integration with CI/CD

Generate test reports that can be tracked:

```bash
# Add to your CI pipeline
mvn test jacoco:report
# Upload coverage reports to SonarQube, Codecov, etc.

# Reference these metrics in test-memory/coverage-tracking.md
```

### Integration with Main Memory Bank System

If you're using the full [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) system for general development and want to add unit testing capabilities:

**Option 1: Standalone (Recommended for Testing-Only Projects)**
- Use this unit testing system independently
- Simpler setup, focused on testing

**Option 2: Integrated (For Projects Using Full Memory Bank)**
```bash
# If you already have cursor-memory-bank installed:
cd /path/to/your/project

# Add test-specific modes alongside existing modes
# Copy the test mode instructions from this guide

# Keep test-memory/ separate from memory-bank/
mkdir -p test-memory/review
```

**Comparison with Main System:**

| Feature | Main Memory Bank | Unit Test Variant |
|---------|-----------------|-------------------|
| Modes | VAN, PLAN, CREATIVE, IMPLEMENT, REFLECT | ANALYZE, PLAN, IMPLEMENT, REVIEW |
| Rule System | Hierarchical isolation rules (.cursor/rules/isolation_rules/) | Simple test rules (.cursor/rules/) |
| Complexity Levels | 1-4 (hours to weeks) | 1-3 (hours to days) |
| Focus | Full development lifecycle | Unit test creation only |
| Memory Files | memory-bank/ directory | test-memory/ directory |

> **Learn More**: See the [Memory Bank Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md) to understand the sophisticated isolation rules architecture used in the main system.

### Customizing for Your Testing Framework

#### For JUnit 5
```bash
cat >> test-memory/test-patterns.md << 'EOF'

## JUnit 5 Specific Patterns

### Parameterized Tests
@ParameterizedTest
@ValueSource(strings = {"", "  ", "\t", "\n"})
void testBlankStrings(String input) {
    assertTrue(StringUtils.isBlank(input));
}

### Test Lifecycle
@BeforeEach
void setup() {
    // Setup before each test
}

@AfterEach
void teardown() {
    // Cleanup after each test
}
EOF
```

#### For TestNG
```bash
cat >> test-memory/test-patterns.md << 'EOF'

## TestNG Specific Patterns

### Data Providers
@DataProvider(name = "testData")
public Object[][] createData() {
    return new Object[][] { ... };
}

@Test(dataProvider = "testData")
public void testMethod(String input, String expected) {
    // Test implementation
}
EOF
```

---

## Best Practices

### General Principles

1. **Always Start with ANALYZE**
   - Never skip the analysis phase
   - Proper complexity assessment prevents rework
   - Identifies all dependencies and scenarios upfront

2. **Keep test-tasks.md Current**
   - Update after every mode transition
   - Use it as your testing dashboard
   - Should always reflect current testing state

3. **Don't Skip PLAN for Level 2-3**
   - Planning saves time during implementation
   - Catches missing scenarios early
   - Provides clear roadmap for implementation

4. **Follow Test Patterns Consistently**
   - Use established naming conventions
   - Standard AAA structure for all tests
   - Reusable mock setups and test builders

5. **Review Thoroughly**
   - Verify all tests pass before moving on
   - Check coverage metrics against goals
   - Document learnings for future reference

6. **Track Coverage Metrics**
   - Update coverage-tracking.md after each class
   - Set realistic coverage goals
   - Identify and prioritize gaps

### When to Update Each File

#### During ANALYZE
- ✅ Update: `test-tasks.md` (add analysis findings, complexity, scenarios)
- ✅ Update: `test-context.md` (set current mode and target)
- ✅ Review: `test-patterns.md` (reference existing patterns)
- ✅ Review: `coverage-tracking.md` (check if class already has tests)

#### During PLAN
- ✅ Update: `test-tasks.md` (add detailed test plan)
- ✅ Update: `test-context.md` (update mode)
- ✅ Review: `test-patterns.md` (use patterns in plan)
- ✅ Review: existing test files (maintain consistency)

#### During IMPLEMENT
- ✅ Update constantly: `test-tasks.md` (track implementation progress)
- ✅ Update regularly: `test-context.md` (current status)
- ✅ Update after completion: `coverage-tracking.md` (new coverage metrics)
- ✅ Create: Test files (the actual test code)

#### During REVIEW
- ✅ Update: `test-tasks.md` (mark complete, note learnings)
- ✅ Update: `test-context.md` (reset for next class)
- ✅ Update: `coverage-tracking.md` (final metrics and gaps)
- ✅ Create: `review/review-[class]-[date].md` (comprehensive review)
- ✅ Update if needed: `test-patterns.md` (add new useful patterns)

### Common Workflows

#### Starting Testing Daily
```
1. Read test-memory/test-tasks.md to see where you left off
2. Check test-memory/test-context.md for current mode and target
3. Continue in current mode or transition as recommended
```

#### Switching Between Classes
```
1. Complete current class through REVIEW mode
2. Update coverage-tracking.md with final metrics
3. Reset test-context.md
4. Start new class with ANALYZE mode
```

#### Handling Test Failures
```
1. Note failures in test-tasks.md
2. Stay in IMPLEMENT mode to fix issues
3. Re-run tests until all pass
4. Update test-tasks.md with resolution
5. Then proceed to REVIEW mode
```

#### Improving Existing Tests
```
1. Use ANALYZE to assess current tests and gaps
2. Use PLAN to identify improvements needed
3. Use IMPLEMENT to enhance tests
4. Use REVIEW to verify improvements
```

#### Team Collaboration
```
1. Commit test-memory/ directory to version control
2. Team members read test-tasks.md to see status
3. Update coverage-tracking.md shows team progress
4. test-patterns.md becomes team testing guide
```

---

## Summary

The Unit Test Memory Bank system provides:

✅ **Persistent context** across testing sessions  
✅ **Structured workflows** for any test complexity  
✅ **Single source of truth** (test-tasks.md)  
✅ **Coverage tracking** to monitor progress and quality  
✅ **Test pattern library** for consistency and reuse  
✅ **Mode-based development** that enforces testing best practices  

**Getting Started**:
1. Create test-memory directory and initialize files
2. Configure 4 custom modes in Cursor (ANALYZE, PLAN, IMPLEMENT, REVIEW) - CRITICAL STEP
3. Type "ANALYZE [ClassName]" to start your first test
4. Follow the mode-based workflow
5. Track coverage and learnings

**Core Philosophy**:
- Analyze before testing (understand complexity)
- Plan for comprehensive coverage (Level 2-3)
- Implement with quality (follow patterns)
- Review and learn (improve over time)

The system scales from simple unit tests to complex test suites while maintaining context, enforcing disciplined testing practices, and building a reusable pattern library.

---

**Version**: 1.0 (Unit Test Specialized)  
**Based on**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) v0.7-beta  
**Last Updated**: 2025-10-16  

---

## Additional Resources

### Main Memory Bank System
- **Repository**: [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) - The full development framework
- **Stars**: 2.8k+ ⭐ (actively maintained)
- **Features**: Hierarchical isolation rules, visual process maps, 4-level complexity system

### Documentation
- [Memory Bank Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md) - Token efficiency and isolation rules architecture
- [Release Notes](https://github.com/vanzan01/cursor-memory-bank/blob/main/RELEASE_NOTES.md) - v0.7-beta changelog
- [Memory Bank Upgrade Guide](https://github.com/vanzan01/cursor-memory-bank/blob/main/memory_bank_upgrade_guide.md) - Migration from legacy versions
- [CREATIVE Mode & Think Tool](https://github.com/vanzan01/cursor-memory-bank/blob/main/creative_mode_think_tool.md) - Design decision methodology

### Key Differences: Full System vs Unit Test Variant

| Aspect | Full Memory Bank | This Unit Test Variant |
|--------|-----------------|----------------------|
| **Purpose** | Complete development lifecycle | Unit test creation only |
| **Modes** | VAN, PLAN, CREATIVE, IMPLEMENT, REFLECT, ARCHIVE | ANALYZE, PLAN, IMPLEMENT, REVIEW |
| **Rules** | Hierarchical isolation rules w/ lazy loading | Simplified test-focused rules |
| **Complexity** | 4 levels (2hrs to weeks) | 3 levels (1hr to 2 days) |
| **Directory** | `.cursor/rules/isolation_rules/` | `.cursor/rules/` |
| **Memory Files** | `memory-bank/` | `test-memory/` |
| **Setup Complexity** | Moderate (requires cloning repo) | Simple (manual file creation) |
| **Best For** | General development projects | Testing-focused workflows |

### When to Use Each System

**Use Full Memory Bank** if you:
- Are building features from scratch
- Need comprehensive development workflow (design → implement → document)
- Want sophisticated rule hierarchy and token optimization
- Work on projects with varying complexity levels (1-4)
- Need the CREATIVE mode for design exploration

**Use Unit Test Variant** if you:
- Focus exclusively on writing unit tests
- Want a simpler, more focused testing workflow
- Don't need the general development modes (VAN, CREATIVE)
- Prefer standalone testing context (test-memory/)
- Want quicker setup without cloning repositories

**Use Both** if you:
- Have the full system for development
- Add these test modes as extensions
- Keep `memory-bank/` and `test-memory/` separate
- Switch between development and testing workflows

---

**Creator**: [@vanzan01](https://github.com/vanzan01)  
**Community**: 2,800+ stars, 400+ forks, active contributors  
**License**: Open source - see [repository](https://github.com/vanzan01/cursor-memory-bank) for details

