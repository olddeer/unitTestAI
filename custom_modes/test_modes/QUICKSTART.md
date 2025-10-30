# Quick Start Guide - Unit Test Custom Modes

## 🚀 Get Testing in 5 Minutes

### Step 1: Configure Modes in Cursor (5 modes)

Open Cursor → Click mode selector → "Add custom mode" → Configure each:

#### Mode 1: 🔍 TEST-VAN
```
Name: 🔍 TEST-VAN
Tools: ✅ Codebase Search, ✅ Read File, ✅ Terminal, ✅ List Directory, ✅ Fetch Rules
Advanced Options: [Paste entire content from test_van_instructions.md]
```

#### Mode 2: 📋 TEST-PLAN
```
Name: 📋 TEST-PLAN
Tools: ✅ Codebase Search, ✅ Read File, ✅ Terminal, ✅ List Directory
Advanced Options: [Paste entire content from test_plan_instructions.md]
```

#### Mode 3: 🎨 TEST-CREATIVE
```
Name: 🎨 TEST-CREATIVE
Tools: ✅ Codebase Search, ✅ Read File, ✅ Terminal, ✅ List Directory, ✅ Edit File, ✅ Fetch Rules
Advanced Options: [Paste entire content from test_creative_instructions.md]
```

#### Mode 4: ⚒️ TEST-IMPLEMENT
```
Name: ⚒️ TEST-IMPLEMENT
Tools: ✅ ALL TOOLS (Enable everything)
Advanced Options: [Paste entire content from test_implement_instructions.md]
```

#### Mode 5: 🔍 TEST-REFLECT
```
Name: 🔍 TEST-REFLECT
Tools: ✅ Codebase Search, ✅ Read File, ✅ Terminal, ✅ List Directory
Advanced Options: [Paste entire content from test_reflect_archive_instructions.md]
```

---

### Step 2: Test Your First Class

#### Example: Testing a Simple Service

**Switch to TEST-VAN mode and type:**
```
TEST-VAN

I need to create unit tests for com.example.service.UserService
```

**AI will:**
1. Analyze the UserService class
2. Identify dependencies (UserRepository, EmailService, etc.)
3. Determine complexity level
4. Create test-tasks.md
5. Recommend next mode

**Expected Output:**
```markdown
## 🔍 TEST-VAN ANALYSIS COMPLETE

Target Class: UserService
Complexity: Level 2 (Standard Service)
Dependencies: 3 (UserRepository, EmailService, ValidationService)
Recommended Workflow: TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-QA

Next: Type 'TEST-PLAN' to create detailed test scenarios
```

---

### Step 3: Follow the Workflow

#### For Level 1 (Simple): TEST-VAN → TEST-IMPLEMENT → TEST-REFLECT

**Switch to TEST-IMPLEMENT and type:**
```
TEST-IMPLEMENT

Implement unit tests for Calculator class
```

#### For Level 2+ (Service): TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-REFLECT

**Switch to TEST-PLAN and type:**
```
TEST-PLAN

Create test plan for UserService
```

**Then switch to TEST-IMPLEMENT:**
```
TEST-IMPLEMENT

Implement the tests according to the plan
```

---

### Step 4: Validate & Reflect

**Switch to TEST-REFLECT and type:**
```
TEST-REFLECT

Review the UserService tests
```

**After reflection, archive:**
```
TEST-ARCHIVE NOW
```

---

## 📋 Cheat Sheet

### Quick Commands
| What You Want | Mode | Command |
|---------------|------|---------|
| Analyze class for testing | TEST-VAN | `TEST-VAN` |
| Create test plan | TEST-PLAN | `TEST-PLAN` |
| Design complex test strategy | TEST-CREATIVE | `TEST-CREATIVE` |
| Write the tests | TEST-IMPLEMENT | `TEST-IMPLEMENT` |
| Validate quality | Any | `TEST-QA` |
| Review & archive | TEST-REFLECT | `TEST-REFLECT` then `TEST-ARCHIVE NOW` |

### Workflow Shortcuts
```
Simple class (POJO):
  TEST-VAN → TEST-IMPLEMENT → TEST-REFLECT

Service with mocks:
  TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-REFLECT

Complex/Legacy:
  TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-REFLECT
```

---

## 💡 Example Session

### Testing UserService (Level 2)

**1. Analysis (TEST-VAN mode)**
```
You: TEST-VAN - analyze com.example.UserService

AI: ✅ Analysis Complete
    - 5 public methods identified
    - 3 dependencies require mocking
    - Level 2 complexity (Standard Service)
    - Estimated: 3-4 hours
    
    Next: TEST-PLAN
```

**2. Planning (TEST-PLAN mode)**
```
You: TEST-PLAN - create test scenarios for UserService

AI: ✅ Test Plan Complete
    - 12 test scenarios identified
    - Mocking strategy: @Mock for all dependencies
    - Test data builders designed
    - Happy path (3), Errors (5), Edge cases (4)
    
    Next: TEST-IMPLEMENT
```

**3. Implementation (TEST-IMPLEMENT mode)**
```
You: TEST-IMPLEMENT - write the unit tests

AI: ✅ Tests Implemented
    - UserServiceTest.java created
    - 12 tests written
    - All tests passing ✓
    - Coverage: 87% (target: >80%)
    - Execution time: 2.1s
    
    Next: TEST-REFLECT
```

**4. Reflection (TEST-REFLECT mode)**
```
You: TEST-REFLECT - review the tests

AI: ✅ Reflection Complete
    - Test quality: High (A-TRIP compliant)
    - Coverage: Excellent (87%)
    - Key successes: Mocking strategy, test data builders
    - Lessons: Start with builders early
    
    Type 'TEST-ARCHIVE NOW' to archive

You: TEST-ARCHIVE NOW

AI: ✅ Archive Complete
    - Test documentation archived
    - Memory bank updated
    - Ready for next test
```

---

## 🎯 Success Checklist

After your first test cycle, verify:

- [ ] All tests passing (`mvn test`)
- [ ] Coverage >80% (`mvn jacoco:report`)
- [ ] Tests use JUnit 5 + AssertJ + Mockito
- [ ] Given-When-Then structure in all tests
- [ ] Descriptive test names
- [ ] No shared test data (independent tests)
- [ ] Fast execution (< 5s per test class)
- [ ] Memory bank files created (test-tasks.md, test-reflection.md)
- [ ] Archive document created in docs/tests/

---

## 🆘 Troubleshooting

### Issue: Mode not responding
**Solution**: Verify you pasted the ENTIRE content from the instruction file in Advanced Options

### Issue: Tests not following Java best practices
**Solution**: Ensure `.cursor/rules/java-test-rule.mdc` exists and is loaded

### Issue: Coverage not generating
**Solution**: Verify JaCoCo plugin is configured in pom.xml/build.gradle

### Issue: Memory bank files not created
**Solution**: Ensure the mode has Read/Write file permissions enabled

---

## 📚 Next Steps

1. **Test a simple class first** - Start with a POJO or utility class
2. **Review the generated tests** - Learn from the AI's implementation
3. **Try a service class** - Practice the full workflow with mocking
4. **Customize for your project** - Adapt test-tasks.md templates to your needs
5. **Read the full README** - Deep dive into each mode's capabilities

---

## 🔗 Resources

- **Full Documentation**: `README.md` in this directory
- **Java Test Rules**: `.cursor/rules/java-test-rule.mdc`
- **Original Memory Bank**: https://github.com/vanzan01/cursor-memory-bank
- **JUnit 5**: https://junit.org/junit5/docs/current/user-guide/
- **AssertJ**: https://assertj.github.io/doc/
- **Mockito**: https://javadoc.io/doc/org.mockito/mockito-core/latest/

---

**Ready to start?** Switch to TEST-VAN mode and type `TEST-VAN`!
