# Unit Test Custom Modes - Setup Guide

## Overview

This directory contains **5 custom mode instruction files** adapted from the [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) project, specifically tailored for Java unit test development.

These modes provide a structured, systematic workflow for writing high-quality unit tests following your project's Java test rules.

---

## Custom Modes Overview

| Mode | Icon | Purpose | Complexity | Tools |
|------|------|---------|------------|-------|
| **🔍 VAN_TEST** | 🔍 | Test Initialization - Analyze coverage gaps, assess complexity | All Levels | Search, Read, Terminal, List, Fetch Rules |
| **📋 PLAN_TEST** | 📋 | Test Planning - Create detailed test scenarios and mock strategy | Level 2-4 | Search, Read, Terminal, List |
| **🎨 CREATIVE_TEST** | 🎨 | Test Design - Explore test design alternatives, document decisions | Level 3-4 | Search, Read, Terminal, List, Edit, Fetch Rules |
| **⚒️ IMPLEMENT_TEST** | ⚒️ | Test Implementation - Write tests, run them, fix until green | All Levels | **ALL TOOLS** |
| **🔍 REFLECT_TEST** | 🔍 | Test Review - Validate quality, document learnings, extract patterns | All Levels | Search, Read, Terminal, List, Edit |

---

## Test Complexity Levels

| Level | Description | Time | Workflow |
|-------|-------------|------|----------|
| **Level 1** | Simple utility class, DTO, basic converter | < 2 hours | VAN_TEST → IMPLEMENT_TEST → REFLECT_TEST |
| **Level 2** | Service with 2-3 dependencies, validator | < 1 day | VAN_TEST → PLAN_TEST → IMPLEMENT_TEST → REFLECT_TEST |
| **Level 3** | Complex service with 5+ dependencies, controller | < 1 week | VAN_TEST → PLAN_TEST → CREATIVE_TEST → IMPLEMENT_TEST → REFLECT_TEST |
| **Level 4** | Complex integrations, multi-layer components | > 1 week | VAN_TEST → PLAN_TEST → CREATIVE_TEST → IMPLEMENT_TEST → REFLECT_TEST |

---

## Prerequisites

Before configuring custom modes:

✅ **Cursor Editor**: Version 0.48 or higher  
✅ **Custom Modes Enabled**: Settings → Features → Chat → Custom modes  
✅ **AI Model**: Claude Sonnet 4 or Claude Opus (recommended)  
✅ **Java Project**: JUnit 5 + AssertJ + Mockito setup  
✅ **Test Rules**: `.cursor/rules/java-test-rule.mdc` file exists in your project  

### Enable Custom Modes in Cursor

1. Open Cursor Settings (`Cmd+,` on macOS or `Ctrl+,` on Windows/Linux)
2. Navigate to: **Features → Chat**
3. Enable: **"Custom modes"**
4. Restart Cursor if prompted

---

## Installation Steps

### Step 1: Verify Files

Check that all instruction files are present:

```bash
ls -la custom_modes_test/

# Expected files:
# - van_test_instructions.md
# - plan_test_instructions.md
# - creative_test_instructions.md
# - implement_test_instructions.md
# - reflect_test_instructions.md
# - SETUP-GUIDE.md (this file)
```

### Step 2: Configure Custom Modes in Cursor

**⚠️ CRITICAL**: This is the most important step. You must manually create each custom mode in Cursor.

---

### Mode 1: 🔍 VAN_TEST (Test Initialization)

**Configuration:**
- **Name**: `🔍 VAN_TEST` (copy emoji if desired)
- **Icon**: Choose any icon from Cursor's options
- **Shortcut**: Optional (e.g., `Cmd+Shift+1`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Fetch Rules
- **Advanced Options**: Click to expand, then paste **the entire content** from:
  ```
  custom_modes_test/van_test_instructions.md
  ```

**How to Add:**
1. Open Cursor chat panel
2. Click mode selector dropdown (usually shows "Normal")
3. Click **"Add custom mode"**
4. Enter name: `🔍 VAN_TEST`
5. Select icon
6. Check the required tools (listed above)
7. Click **"Advanced options"** at bottom
8. Paste entire content from `van_test_instructions.md`
9. Save

---

### Mode 2: 📋 PLAN_TEST (Test Planning)

**Configuration:**
- **Name**: `📋 PLAN_TEST`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+Shift+2`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
- **Advanced Options**: Paste **entire content** from:
  ```
  custom_modes_test/plan_test_instructions.md
  ```

---

### Mode 3: 🎨 CREATIVE_TEST (Test Design)

**Configuration:**
- **Name**: `🎨 CREATIVE_TEST`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+Shift+3`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Edit File
  - ✅ Fetch Rules
- **Advanced Options**: Paste **entire content** from:
  ```
  custom_modes_test/creative_test_instructions.md
  ```

---

### Mode 4: ⚒️ IMPLEMENT_TEST (Test Implementation)

**Configuration:**
- **Name**: `⚒️ IMPLEMENT_TEST`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+Shift+4`)
- **Tools to Enable**: **✅ ALL TOOLS** (Enable every available tool)
- **Advanced Options**: Paste **entire content** from:
  ```
  custom_modes_test/implement_test_instructions.md
  ```

---

### Mode 5: 🔍 REFLECT_TEST (Test Review)

**Configuration:**
- **Name**: `🔍 REFLECT_TEST` (or `REFLECT_TEST`)
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+Shift+5`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Edit File
- **Advanced Options**: Paste **entire content** from:
  ```
  custom_modes_test/reflect_test_instructions.md
  ```

---

## Step 3: Verify Setup

After configuring all modes:

1. Open Cursor chat panel
2. Click mode selector dropdown
3. Verify all 5 modes appear:
   - 🔍 VAN_TEST
   - 📋 PLAN_TEST
   - 🎨 CREATIVE_TEST
   - ⚒️ IMPLEMENT_TEST
   - 🔍 REFLECT_TEST

---

## Getting Started

### First Time Usage

1. **Switch to VAN_TEST Mode**
   - Open Cursor chat
   - Select "🔍 VAN_TEST" from mode dropdown

2. **Type: VAN_TEST**
   - Just type "VAN_TEST" and press Enter
   - AI will:
     - Analyze your project structure
     - Identify classes without tests
     - Generate coverage report
     - Assess test complexity
     - Create `test-memory-bank/test-tasks.md`

3. **Specify Target Class**
   - VAN_TEST will ask which class to test
   - Provide class name (e.g., "UserService")
   - VAN_TEST will determine complexity and recommend workflow

4. **Follow Recommended Workflow**
   - VAN_TEST tells you which mode to switch to next
   - Usually: PLAN_TEST (Level 2+) or IMPLEMENT_TEST (Level 1)
   - Continue through the workflow

---

## Example Session

```
You: [Switch to VAN_TEST mode] → Type: VAN_TEST

AI: ## VAN_TEST MODE ACTIVATED ✅
    
    Project Analysis:
    - Framework: Java/Maven/Spring Boot
    - Source Files: 45 classes
    - Test Files: 20 test classes
    - Current Coverage: 62%
    
    Test Coverage Gaps Identified:
    1. UserService - No test file exists
    2. OrderValidator - Partial coverage (45%)
    3. ProductMapper - Missing edge case tests
    
    What class would you like to test first?

You: UserService

AI: ## TASK ANALYSIS ✅
    
    Target: UserService
    Complexity: Level 3 (5 dependencies, complex business logic)
    Estimated effort: 4-5 hours
    
    Recommended Workflow:
    VAN_TEST → PLAN_TEST → CREATIVE_TEST → IMPLEMENT_TEST → REFLECT_TEST
    
    Next: Switch to PLAN_TEST mode

You: [Switch to PLAN_TEST] → Type: PLAN

AI: ## PLAN_TEST MODE ACTIVATED ✅
    
    Target Class: UserService
    Dependencies Identified: 5 dependencies to mock
    
    Test Plan Overview:
    📝 Comprehensive Test Scenarios: 4
    🎯 Parameterized Tests: 2
    🔧 Mock Objects: 5
    📊 Expected Coverage: 85%
    
    [Detailed plan generated...]
    
    Next: Switch to CREATIVE_TEST for design decisions

[Continue through workflow...]
```

---

## Memory Bank Structure

After first use, the system creates:

```
test-memory-bank/
├── test-tasks.md              # Single source of truth for all test tasks
├── activeContext.md           # Current test focus (updated by mode transitions)
├── test-progress.md           # Implementation progress (created by IMPLEMENT_TEST)
├── creative-test-*.md         # Design decisions (created by CREATIVE_TEST)
└── reflect-test-*.md          # Review documents (created by REFLECT_TEST)
```

**Note**: The `test-memory-bank/` directory is created automatically when you first use VAN_TEST mode.

---

## Mode Commands Quick Reference

Once configured, use these commands:

```
VAN_TEST      - Initialize test project, analyze coverage gaps
PLAN          - Create detailed test plan with scenarios
CREATIVE      - Explore test design alternatives (Level 3-4)
IMPLEMENT     - Write tests, run them, fix until green
REFLECT       - Review quality, document learnings
```

---

## Quality Gates & Validation

All tests are evaluated using the **Test Completion Matrix**:

### Quality Gate Scoring (100 points total)

1. **Tests Pass (40 points)**: All tests green (0 failures, 0 errors)
2. **Coverage ≥80% (30 points)**: Line coverage meets threshold
3. **Test Count ≤10 (30 points)**: Comprehensive approach, not fragmented

**Target: 100/100 points** 🎯

### Commands for Validation

```bash
# Run tests and generate coverage
mvn -q -DskipITs test jacoco:report | cat

# Review coverage report
open target/site/jacoco/index.html

# Check specific class coverage
grep -A10 "class name=\"UserService\"" target/site/jacoco/jacoco.xml
```

---

## Java Test Rules Integration

All modes automatically reference `.cursor/rules/java-test-rule.mdc` to ensure:

✅ JUnit 5 annotations (`@Test`, `@BeforeEach`, `@DisplayName`)  
✅ AssertJ assertions (`assertThat`, `assertThatThrownBy`)  
✅ Given-When-Then structure  
✅ Comprehensive scenarios (not fragmented)  
✅ Test independence (local variables, no shared state)  
✅ Parameterized tests for data variations  
✅ Mockito for dependencies (`@Mock`, `@InjectMocks`)  
✅ Package-private visibility  

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| **Modes not appearing** | Enable in Settings → Features → Chat → Custom modes; restart Cursor |
| **Character limit exceeded** | Files optimized to fit; ensure using latest version; remove examples if necessary |
| **Rules not loading** | Verify `.cursor/rules/java-test-rule.mdc` exists; enable "Fetch Rules" tool in mode |
| **Tests not running** | Check Maven/Gradle setup; verify test dependencies in pom.xml/build.gradle |
| **Coverage report fails** | Ensure JaCoCo plugin configured; run `mvn clean test` first |
| **Modes not following instructions** | Verify complete content pasted in "Advanced Options"; restart Cursor |

---

## Best Practices

### 1. Always Start with VAN_TEST
- Analyzes project and determines complexity
- Creates test-tasks.md as single source of truth
- Loads appropriate rules for complexity level

### 2. Follow Recommended Workflows
- **Level 1**: VAN_TEST → IMPLEMENT_TEST → REFLECT_TEST
- **Level 2**: VAN_TEST → PLAN_TEST → IMPLEMENT_TEST → REFLECT_TEST
- **Level 3-4**: VAN_TEST → PLAN_TEST → CREATIVE_TEST → IMPLEMENT_TEST → REFLECT_TEST

### 3. Keep test-tasks.md Updated
- Single source of truth for all test development
- Update after significant progress
- Reference in every mode

### 4. Use CREATIVE_TEST for Complex Scenarios (Level 3-4)
- Explore test design alternatives
- Document design decisions
- Establish reusable patterns

### 5. Run Tests Frequently in IMPLEMENT_TEST
- After each test method
- Fix failures immediately
- Don't stop until green ✅

### 6. Always Complete REFLECT_TEST
- Document learnings
- Extract reusable patterns
- Build organizational knowledge

---

## Advanced Features

### Quality Gate Customization

Edit quality thresholds in `java-test-rule.mdc` if needed:
- Default coverage target: 80%
- Default test count limit: 10
- Default passing requirement: 100%

### Team Collaboration

- Commit test-tasks.md, creative-test-*.md, reflect-test-*.md to git
- Ignore activeContext.md, test-progress.md (transient state)
- Share custom mode instructions with team
- Establish project-wide test patterns

### Custom Test Conventions

Add project-specific conventions to `.cursor/rules/java-test-rule.mdc`:
- Test naming conventions
- Mock setup patterns
- Test data creation strategies
- Project-specific assertions

---

## Summary

You now have 5 custom modes for systematic unit test development:

✅ **VAN_TEST**: Analyze coverage, determine complexity, initialize test tasks  
✅ **PLAN_TEST**: Create detailed test scenarios and mock strategy  
✅ **CREATIVE_TEST**: Explore design alternatives for complex tests  
✅ **IMPLEMENT_TEST**: Write tests, run them, fix until 100/100 score  
✅ **REFLECT_TEST**: Review quality, document learnings, extract patterns  

**Core Philosophy:**
- **Analyze first** (VAN_TEST determines Level 1-4)
- **Plan systematically** (PLAN_TEST breaks down scenarios)
- **Design thoughtfully** (CREATIVE_TEST explores alternatives for Level 3-4)
- **Implement progressively** (IMPLEMENT_TEST tracks progress)
- **Reflect and learn** (REFLECT_TEST captures insights)

The system scales from simple utility classes (Level 1, < 2 hours) to complex integrations (Level 4, > 1 week) while maintaining context, enforcing quality standards, and building organizational testing knowledge.

---

**Version**: 1.0  
**Based on**: [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) v0.7-beta  
**Adapted for**: Java Unit Test Development  
**Date**: October 2025  

---

## Additional Resources

**Original Project**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)  
**Community**: 2,800+ stars ⭐, 400+ forks  
**Documentation**: [Memory Bank Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md)  

**Questions?** Check [GitHub Issues](https://github.com/vanzan01/cursor-memory-bank/issues) for troubleshooting.

---

**Ready to start?** Switch to VAN_TEST mode and type "VAN_TEST" to begin! 🚀

