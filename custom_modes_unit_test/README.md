# Unit Test Custom Modes for Cursor

> **Adapted from [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)** for unit test creation and management.

## Overview

This directory contains custom mode instructions specifically designed for creating, managing, and improving unit tests in Java projects. These modes guide you through a structured unit testing workflow that ensures high-quality, comprehensive test coverage.

### Key Features

✨ **Test Gap Analysis**: Automatically identify classes needing tests  
✨ **Test Quality Matrix**: Measurable quality gates (100-point system)  
✨ **Java Test Guidelines**: Built-in adherence to JUnit 5, AssertJ, Mockito best practices  
✨ **Complexity-Based Workflow**: Adapted approach for simple to complex testing scenarios  
✨ **Coverage-Driven**: Integrated JaCoCo coverage analysis  
✨ **Test Pattern Library**: Reusable patterns for common testing scenarios  

## The 5 Custom Modes

### 1. 🧪 TEST-VAN (Test Initialization)
**Purpose**: Analyze codebase for test coverage gaps and determine test complexity

**What it does**:
- Runs JaCoCo coverage analysis
- Identifies classes with <80% coverage or no tests
- Assesses test complexity (Levels 1-4)
- Creates Test Quality Matrix goals
- Initializes `test-tasks.md` in memory-bank

**Use when**: Starting a new test session or analyzing test needs

---

### 2. 📋 TEST-PLAN (Test Planning)
**Purpose**: Create detailed test plans for classes requiring tests

**What it does**:
- Analyzes the class under test
- Identifies test scenarios (happy path, edge cases, errors)
- Plans mocking strategy for dependencies
- Identifies parameterized test opportunities
- Flags complex scenarios for TEST-CREATIVE mode

**Use when**: Planning tests for Level 2+ complexity classes

---

### 3. 🎨 TEST-CREATIVE (Test Strategy Design)
**Purpose**: Design creative testing strategies for complex scenarios

**What it does**:
- Explores multiple testing approaches for:
  - Concurrency testing
  - Reactive streams (Flux/Mono)
  - Retry/circuit breaker logic
  - Integration scenarios
  - Performance testing
- Analyzes pros/cons of each approach
- Provides implementation guidelines
- Documents reusable test strategies

**Use when**: Testing complex scenarios flagged in TEST-PLAN mode (Level 3-4)

---

### 4. ⚒️ TEST-IMPLEMENT (Test Implementation)
**Purpose**: Write the actual unit tests following the plan

**What it does**:
- Implements tests using JUnit 5, AssertJ, Mockito
- Follows Given-When-Then structure
- Ensures test independence
- Runs tests and verifies they pass
- Checks coverage with JaCoCo
- Evaluates against Test Quality Matrix
- Iterates until quality targets met (≥90/100 points)

**Use when**: Ready to write the actual test code

---

### 5. 🔍 TEST-REFLECT & ARCHIVE (Review & Documentation)
**Purpose**: Review test quality and archive testing knowledge

**What it does**:
- Reviews test implementation
- Evaluates final Test Quality Matrix score
- Documents successes, challenges, lessons learned
- Extracts reusable test patterns
- Creates archive documentation
- Updates test pattern library

**Use when**: After tests are complete and passing

---

## Test Quality Matrix

Every test suite is evaluated against this 100-point scoring system:

```
┌─────────────────────────────────────────────────────┐
│ TEST QUALITY MATRIX (Total: 100 points)            │
├─────────────────────────────────────────────────────┤
│ ✓ Tests Pass (40 points)                            │
│   - All tests must complete successfully            │
│   - 0 failures, 0 errors                            │
│                                                      │
│ ✓ Coverage Threshold (30 points)                    │
│   - Line coverage ≥ 80% for target class            │
│   - Measured via JaCoCo                             │
│                                                      │
│ ✓ Test Count Limit (30 points)                      │
│   - Total executed tests ≤ 10                       │
│   - Forces comprehensive scenario testing           │
│   - Reduces test fragmentation                      │
└─────────────────────────────────────────────────────┘

Target Score: ≥90/100 points
```

## Test Complexity Levels

### Level 1: Simple Tests (< 2 hours)
- POJOs, utilities, simple converters
- No mocking needed
- Direct instantiation and assertions
- **Workflow**: TEST-VAN → TEST-IMPLEMENT → TEST-REFLECT

### Level 2: Standard Tests (< 1 day)
- Services with 1-3 dependencies
- Controllers, validators
- Mockito for dependencies
- **Workflow**: TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-REFLECT

### Level 3: Complex Tests (< 1 week)
- Multiple dependencies, complex business logic
- Reactive streams (Flux/Mono)
- Requires creative test strategies
- **Workflow**: TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-REFLECT

### Level 4: Critical Test Suites (> 1 week)
- Mission-critical functionality
- Integration scenarios, performance tests
- Security considerations
- **Workflow**: TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-REFLECT

## Setup Instructions

### Prerequisites
- Cursor Editor with Custom Modes enabled (Settings → Features → Chat → Custom modes)
- Java project with Maven or Gradle
- JaCoCo configured for coverage reporting
- Java test rule file at `.cursor/rules/java-test-rule.mdc`

### Step 1: Enable Custom Modes in Cursor
1. Open Cursor Settings (Cmd+, or Ctrl+,)
2. Navigate to: **Features → Chat**
3. Enable: **"Custom modes"**
4. Restart Cursor if prompted

### Step 2: Create Custom Modes
For each of the 5 modes, create a custom mode in Cursor:

#### Mode 1: 🧪 TEST-VAN
- **Name**: `🧪 TEST-VAN`
- **Tools**: ☑️ All tools (especially Terminal, Read File, List Directory)
- **Advanced Options**: Paste entire content from `test_van_instructions.md`

#### Mode 2: 📋 TEST-PLAN
- **Name**: `📋 TEST-PLAN`
- **Tools**: ☑️ Codebase Search, Read File, Terminal, List Directory
- **Advanced Options**: Paste entire content from `test_plan_instructions.md`

#### Mode 3: 🎨 TEST-CREATIVE
- **Name**: `🎨 TEST-CREATIVE`
- **Tools**: ☑️ Codebase Search, Read File, Terminal, List Directory, Edit File
- **Advanced Options**: Paste entire content from `test_creative_instructions.md`

#### Mode 4: ⚒️ TEST-IMPLEMENT
- **Name**: `⚒️ TEST-IMPLEMENT`
- **Tools**: ☑️ ALL TOOLS (enable every available tool)
- **Advanced Options**: Paste entire content from `test_implement_instructions.md`

#### Mode 5: 🔍 TEST-REFLECT
- **Name**: `🔍 TEST-REFLECT`
- **Tools**: ☑️ Codebase Search, Read File, Terminal, List Directory
- **Advanced Options**: Paste entire content from `test_reflect_archive_instructions.md`

### Step 3: Verify Setup
```bash
# Verify JaCoCo is configured
mvn -q test jacoco:report | cat

# Verify java-test-rule.mdc exists
ls .cursor/rules/java-test-rule.mdc

# Verify test directory structure
ls -la src/test/java
```

## Usage Workflow

### Starting a Test Session

1. **Switch to TEST-VAN mode** in Cursor chat
2. Type: `TEST-VAN`
3. TEST-VAN will:
   - Run coverage analysis
   - Identify test gaps
   - Create `memory-bank/test-tasks.md`
   - Recommend next steps

### Example Session

```
You: [Switch to TEST-VAN] → Type: TEST-VAN

AI: ## TEST-VAN MODE ACTIVATED ✅
    Coverage: 65%
    Classes needing tests: 12
    High priority:
    1. UserService (45% → 80%) - Level 2
    2. OrderConverter (0% → 80%) - Level 1
    3. PaymentProcessor (30% → 80%) - Level 3
    
    Recommended: Start with OrderConverter (Level 1)
    Next: TEST-IMPLEMENT (skip PLAN for Level 1)

You: [Switch to TEST-IMPLEMENT] → Implement OrderConverterTest

AI: ## TEST-IMPLEMENT MODE ACTIVATED ✅
    [Writes comprehensive tests...]
    Results:
    - Tests: 5 passed, 0 failed
    - Coverage: 87%
    - Test Quality Matrix: 100/100 ✅
    
    Next: TEST-REFLECT

You: [Switch to TEST-REFLECT] → TEST-REFLECT

AI: ## TEST-REFLECT MODE ACTIVATED ✅
    [Analyzes tests, documents patterns...]
    Created: test-reflection-OrderConverter.md
    
    Type 'ARCHIVE NOW' to complete

You: ARCHIVE NOW

AI: ## ARCHIVING COMPLETE ✅
    Created: docs/test-archive/OrderConverterTest-2025-10-30.md
    Updated test pattern library
    
    Next: TEST-VAN for UserService?
```

## Memory Bank Structure

The modes create and maintain these files in `memory-bank/`:

```
memory-bank/
├── test-tasks.md              # Single source of truth for test sessions
├── test-plan-[Class].md       # Detailed test plans (from TEST-PLAN)
├── test-creative-[Topic].md   # Creative strategies (from TEST-CREATIVE)
├── test-reflection-[Class].md # Reflection docs (from TEST-REFLECT)
└── test-pattern-library.md    # Reusable patterns (updated by TEST-REFLECT)
```

Archive documentation is stored separately:
```
docs/test-archive/
└── [ClassName]Test-archive-[Date].md
```

## Java Test Guidelines Integration

These modes are built on top of the Java test guidelines from `.cursor/rules/java-test-rule.mdc`, enforcing:

1. **JUnit 5 Annotations**: `@Test`, `@BeforeEach`, `@DisplayName`, `@ParameterizedTest`
2. **AssertJ Assertions**: Fluent, expressive assertions
3. **Given-When-Then Structure**: Clear test organization with visual separation
4. **Test Independence**: No shared state, no execution order dependencies
5. **Comprehensive Scenarios**: Fewer, more complete tests vs. many fragmented tests
6. **Mockito Best Practices**: Proper mocking and verification
7. **Local Test Data**: Prefer local variables over instance fields
8. **Package-Private Visibility**: No need for public test classes/methods

## Best Practices

### 1. Always Start with TEST-VAN
Don't guess which classes need tests—let TEST-VAN analyze coverage and prioritize.

### 2. Follow Recommended Workflows
Don't skip modes for higher complexity levels:
- Level 1: TEST-VAN → TEST-IMPLEMENT → TEST-REFLECT
- Level 2: TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-REFLECT
- Level 3-4: TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-REFLECT

### 3. Target the Test Quality Matrix
Aim for ≥90/100 points:
- All tests must pass (40 points)
- Coverage ≥80% (30 points)
- Test count ≤10 (30 points)

### 4. Consolidate Tests
Write comprehensive scenario tests rather than many small focused tests. Example:
- ❌ Bad: 15 fragmented tests, each testing one assertion
- ✅ Good: 6 comprehensive tests, each validating complete scenarios

### 5. Use Parameterized Tests
Reduce test count while increasing coverage:
```java
@ParameterizedTest
@CsvSource({
    "valid@email.com, true",
    "invalid.email, false",
    "@example.com, false"
})
void shouldValidateEmailFormat(String email, boolean expected) {
    assertThat(validator.isValid(email)).isEqualTo(expected);
}
```

### 6. Document Reusable Patterns
After each test session, extract patterns into the test pattern library for team reuse.

### 7. Iterate Until Quality Targets Met
If Test Quality Matrix score < 90:
- Tests failing? Fix them first
- Coverage < 80%? Add more test scenarios
- Test count > 10? Consolidate into comprehensive tests

## Troubleshooting

| Problem | Solution |
|---------|----------|
| **Coverage not generating** | Verify JaCoCo plugin in pom.xml/build.gradle; run `mvn clean test jacoco:report` |
| **Tests not finding class** | Check package structure matches src/main/java; verify imports |
| **Mocks not working** | Ensure `@ExtendWith(MockitoExtension.class)`; check `@Mock` and `@InjectMocks` |
| **Test count too high** | Consolidate tests into comprehensive scenarios; use parameterized tests |
| **Coverage stuck below 80%** | Review uncovered branches in JaCoCo report; add edge case tests |
| **Reactive tests failing** | Use `StepVerifier`; check Mono/Flux emissions carefully |

## Advanced Features

### Test Pattern Library
As you complete test sessions, reusable patterns are extracted and stored in `memory-bank/test-pattern-library.md`. These patterns can be referenced in future test sessions.

### Creative Test Strategies
For complex scenarios (concurrency, reactive, retry logic), TEST-CREATIVE mode generates multiple strategy options with pros/cons analysis, helping you choose the best approach.

### Coverage Tracking
TEST-VAN tracks overall project coverage across sessions, showing improvement over time in `test-tasks.md`.

## Integration with Original Memory Bank

These test modes can be used alongside the original Memory Bank modes for feature development:

1. Use **VAN → PLAN → CREATIVE → IMPLEMENT** for feature development
2. Use **TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT** for test creation
3. Both share the same `memory-bank/` directory structure
4. Tests are tracked separately in `test-tasks.md`

## Resources

- **Original Memory Bank**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)
- **Java Test Guidelines**: `.cursor/rules/java-test-rule.mdc` (provided in your project)
- **JUnit 5 User Guide**: [https://junit.org/junit5/docs/current/user-guide/](https://junit.org/junit5/docs/current/user-guide/)
- **AssertJ Documentation**: [https://assertj.github.io/doc/](https://assertj.github.io/doc/)
- **Mockito Documentation**: [https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html)

## Contributing

These modes are adapted specifically for unit testing. If you have improvements or additional patterns to suggest, please contribute back to both:
- This unit test mode collection
- The original [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) project

## License

Adapted from cursor-memory-bank. Please refer to the original repository for license information.

---

**Version**: 1.0  
**Based on**: cursor-memory-bank v0.7-beta  
**Last Updated**: 2025-10-30
