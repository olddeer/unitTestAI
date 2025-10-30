# Unit Test Custom Modes for Cursor Memory Bank

This directory contains specialized custom modes adapted from the [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) system, specifically designed for **unit test development**.

## 🎯 Purpose

These modes guide AI assistants through a structured, comprehensive process for creating high-quality unit tests that follow Java unit testing best practices and achieve high code coverage.

## 📋 Available Modes

### 1. 🔍 TEST-VAN (Test Initialization & Analysis)
**File**: `test_van_instructions.md`

**Purpose**: Analyze production code to identify what needs testing and determine test complexity.

**Key Activities**:
- Read and analyze the class under test
- Identify dependencies requiring mocking
- Determine test complexity level (1-4)
- Identify coverage gaps
- Create initial `test-tasks.md`
- Recommend appropriate workflow

**Complexity Levels**:
- **Level 1**: Simple unit (< 1 hour) - POJOs, utilities
- **Level 2**: Standard service (< 4 hours) - Services with dependencies
- **Level 3**: Complex component (< 1 day) - Complex business logic
- **Level 4**: Legacy code (> 1 day) - Legacy/integration heavy

**Output**: Comprehensive analysis and test-tasks.md

**Next Mode**: TEST-PLAN (Level 2-4) or TEST-IMPLEMENT (Level 1)

---

### 2. 📋 TEST-PLAN (Test Planning)
**File**: `test_plan_instructions.md`

**Purpose**: Create detailed test scenarios and mocking strategy.

**Key Activities**:
- Map all dependencies
- Define mocking strategy
- Create comprehensive scenario matrix
- Design test data builders
- Plan test class structure
- Identify edge cases and error scenarios
- Flag components needing TEST-CREATIVE

**Outputs**:
- Test scenario matrix
- Mocking strategy documentation
- Test data builder designs
- Test class structure

**Next Mode**: TEST-CREATIVE (Level 3-4) or TEST-IMPLEMENT (Level 1-2)

---

### 3. 🎨 TEST-CREATIVE (Test Design)
**File**: `test_creative_instructions.md`

**Purpose**: Design solutions for complex testing challenges.

**Key Activities**:
- Design complex mocking strategies
- Architecture test data patterns
- Plan refactoring for testability
- Design performance test approaches

**Creative Phase Types**:
1. **🎭 Mocking Strategy Design** - Complex dependency mocking
2. **📦 Test Data Architecture** - Large object graph creation
3. **♻️ Refactoring for Testability** - Making legacy code testable
4. **⚡ Performance Test Design** - Performance testing strategies

**Outputs**:
- Multiple design options with pros/cons
- Recommended approach with justification
- Implementation guidelines
- Creative phase documentation

**Next Mode**: TEST-IMPLEMENT

---

### 4. ⚒️ TEST-IMPLEMENT (Test Implementation)
**File**: `test_implement_instructions.md`

**Purpose**: Write the actual unit tests following plans and best practices.

**Key Activities**:
- Create test class with proper annotations
- Implement test data builders
- Write test methods (happy path, errors, edge cases)
- Run tests iteratively
- Fix failures until all tests pass
- Generate coverage reports
- Verify >80% coverage achieved

**Java Test Rule Compliance**:
- ✅ JUnit 5 annotations (`@Test`, `@BeforeEach`, `@ExtendWith`)
- ✅ AssertJ assertions
- ✅ Mockito for mocking
- ✅ Given-When-Then structure
- ✅ Descriptive test names
- ✅ Test independence
- ✅ Parameterized tests
- ✅ Comprehensive scenario coverage
- ✅ Local test data (no instance fields)

**Outputs**:
- Fully implemented test class
- All tests passing
- Coverage report (>80%)
- test-progress.md updates

**Next Mode**: TEST-QA

---

### 5. 🔍 TEST-REFLECT & ARCHIVE (Test Review & Documentation)
**File**: `test_reflect_archive_instructions.md`

**Purpose**: Reflect on test quality and archive documentation.

**Key Activities**:

**Reflection Phase** (Default):
- Review test execution results
- Analyze coverage reports
- Assess test quality (A-TRIP principles)
- Document successes and challenges
- Identify lessons learned
- Recommend improvements
- Create test-reflection.md

**Archiving Phase** (Triggered by `TEST-ARCHIVE NOW`):
- Create comprehensive test archive document
- Include coverage metrics
- Document key test examples
- Update all memory bank files
- Mark test cycle complete
- Prepare for next test

**Outputs**:
- test-reflection.md
- Test archive document in `docs/tests/`
- Updated memory bank files
- Recommendations for future tests

**Next Mode**: TEST-VAN (for next class)

---

## 🔄 Recommended Workflows

### Level 1: Simple Unit (< 1 hour)
```
TEST-VAN → TEST-IMPLEMENT → TEST-QA → TEST-REFLECT/ARCHIVE
```
- Quick analysis
- Direct implementation
- Simple validation
- Brief reflection

### Level 2: Standard Service (< 4 hours)
```
TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-QA → TEST-REFLECT/ARCHIVE
```
- Comprehensive analysis
- Detailed test planning
- Structured implementation
- Quality validation
- Full reflection

### Level 3: Complex Component (< 1 day)
```
TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-QA → TEST-REFLECT/ARCHIVE
```
- Deep code analysis
- Comprehensive planning
- Design complex test strategies
- Phased implementation
- Thorough validation
- Detailed reflection

### Level 4: Legacy Code (> 1 day)
```
TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-QA → TEST-REFLECT/ARCHIVE
```
- Legacy code audit
- Refactoring strategy
- Complex test design
- Phased approach
- Integration testing
- Comprehensive documentation

---

## 📁 Memory Bank Structure

These modes maintain test-specific memory bank files:

```
memory-bank/
├── test-tasks.md              # Single source of truth for test tasks
├── test-active-context.md     # Current test focus
├── test-progress.md           # Test implementation status
├── test-plan.md               # Detailed test plan
├── test-creative-*.md         # Test design decisions
└── test-reflection.md         # Test reflection document

docs/
└── tests/                     # Test archives
    └── [ClassName]-test-archive-[date].md
```

---

## 🎯 Key Principles

### Test Quality (A-TRIP)
- **Automatic**: No manual intervention
- **Thorough**: All scenarios covered
- **Repeatable**: Consistent results
- **Independent**: No test dependencies
- **Professional**: Clean, maintainable code

### Java Test Rules Compliance
All modes enforce adherence to `.cursor/rules/java-test-rule.mdc`:
- JUnit 5 annotations
- AssertJ assertions
- Mockito for mocking
- Given-When-Then structure
- Descriptive naming
- Test independence
- Comprehensive coverage
- Local test data

### Coverage Goals
- **Minimum**: 80% line coverage
- **Focus**: Meaningful coverage of business logic
- **Tool**: JaCoCo for measurement
- **Approach**: Coverage guides, not goals

---

## 🚀 Getting Started

### 1. Configure Custom Modes in Cursor

For each mode, create a custom mode in Cursor:

#### TEST-VAN Mode
- **Name**: `🔍 TEST-VAN`
- **Tools**: Codebase Search, Read File, Terminal, List Directory, Fetch Rules
- **Advanced Options**: Paste entire content from `test_van_instructions.md`

#### TEST-PLAN Mode
- **Name**: `📋 TEST-PLAN`
- **Tools**: Codebase Search, Read File, Terminal, List Directory
- **Advanced Options**: Paste entire content from `test_plan_instructions.md`

#### TEST-CREATIVE Mode
- **Name**: `🎨 TEST-CREATIVE`
- **Tools**: Codebase Search, Read File, Terminal, List Directory, Edit File, Fetch Rules
- **Advanced Options**: Paste entire content from `test_creative_instructions.md`

#### TEST-IMPLEMENT Mode
- **Name**: `⚒️ TEST-IMPLEMENT`
- **Tools**: ALL TOOLS (Enable every available tool)
- **Advanced Options**: Paste entire content from `test_implement_instructions.md`

#### TEST-REFLECT & ARCHIVE Mode
- **Name**: `🔍 TEST-REFLECT`
- **Tools**: Codebase Search, Read File, Terminal, List Directory
- **Advanced Options**: Paste entire content from `test_reflect_archive_instructions.md`

### 2. Initialize Test Memory Bank

The memory bank will be created automatically on first use, but you can prepare:

```bash
mkdir -p memory-bank
mkdir -p docs/tests
```

### 3. Start Your First Test

1. Switch to TEST-VAN mode
2. Type: `TEST-VAN` and specify the class to test
3. Follow the recommended workflow

**Example**:
```
You: TEST-VAN - analyze com.example.UserService

AI: [Analyzes UserService, identifies dependencies, determines Level 2 complexity]
    Recommends: TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-QA
```

---

## 🔧 Mode Commands

| Command | Mode | Action |
|---------|------|--------|
| `TEST-VAN` | TEST-VAN | Analyze class and create test tasks |
| `TEST-PLAN` | TEST-PLAN | Create detailed test plan |
| `TEST-CREATIVE` | TEST-CREATIVE | Design test strategies |
| `TEST-IMPLEMENT` | TEST-IMPLEMENT | Write unit tests |
| `TEST-QA` | Any mode | Validate test quality |
| `TEST-ARCHIVE NOW` | TEST-REFLECT | Archive test documentation |

---

## 📊 Success Criteria

### Test Implementation Success
- ✅ All tests passing
- ✅ >80% line coverage
- ✅ A-TRIP principles satisfied
- ✅ Java test rules compliance
- ✅ No flaky tests
- ✅ Fast execution (< 5s per test class)

### Test Quality Success
- ✅ Comprehensive scenario coverage
- ✅ Clear, descriptive test names
- ✅ Proper mocking strategy
- ✅ Reusable test data builders
- ✅ Independent tests
- ✅ Professional code quality

---

## 🆚 Differences from Original Memory Bank Modes

| Aspect | Original Modes | Test Modes |
|--------|---------------|------------|
| **Focus** | Feature development | Unit test creation |
| **Complexity Levels** | Based on feature size | Based on code testability |
| **Rules** | General isolation rules | Java test rules |
| **Output** | Production code | Test code |
| **Quality Metrics** | Feature completeness | Coverage + A-TRIP |
| **Memory Bank** | tasks.md, progress.md | test-tasks.md, test-progress.md |
| **Creative Phase** | Architecture/Algorithm/UI | Mocking/Data/Refactoring |
| **Verification** | Feature works | Tests pass + coverage |

---

## 💡 Tips for Success

### Best Practices
1. **Always start with TEST-VAN** - Proper analysis prevents wasted effort
2. **Don't skip TEST-PLAN** - Planning saves time during implementation
3. **Use TEST-CREATIVE for complex scenarios** - Design before implementation
4. **Run tests incrementally** - Fix issues early
5. **Focus on meaningful coverage** - Not just hitting percentages
6. **Keep test-tasks.md updated** - Single source of truth

### Common Pitfalls to Avoid
- ❌ Skipping modes for complex classes
- ❌ Ignoring mocking strategy design
- ❌ Writing fragmented micro-tests
- ❌ Using shared instance fields for test data
- ❌ Ignoring test execution time
- ❌ Over-relying on mocks

### Optimization Tips
- Use parameterized tests for data variations
- Create comprehensive scenario tests (not micro-tests)
- Build reusable test data utilities
- Group related tests with @Nested
- Run coverage frequently during implementation

---

## 📚 Related Documentation

### Required Reading
- `.cursor/rules/java-test-rule.mdc` - Java unit testing guidelines
- [Original Memory Bank System](https://github.com/vanzan01/cursor-memory-bank)

### Helpful Resources
- JUnit 5 Documentation
- AssertJ Documentation
- Mockito Documentation
- JaCoCo Coverage Tool

---

## 🤝 Contributing

These modes are adapted from the cursor-memory-bank system. Improvements and suggestions are welcome!

### Adaptation Credits
- **Original System**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)
- **Adapted For**: Unit test development with Java-specific best practices
- **Adaptation Date**: 2025-10-30

---

## 📝 Version History

- **v1.0** (2025-10-30) - Initial adaptation for unit test development
  - Created TEST-VAN for test analysis
  - Created TEST-PLAN for test planning
  - Created TEST-CREATIVE for test design
  - Created TEST-IMPLEMENT for test implementation
  - Created TEST-REFLECT & ARCHIVE for test review
  - Integrated Java test rules compliance
  - Added A-TRIP quality principles
  - Included coverage-driven development

---

**Status**: ✅ Ready for Use
**Compatibility**: Cursor Editor v0.48+
**Required**: Custom Modes enabled in Cursor settings
