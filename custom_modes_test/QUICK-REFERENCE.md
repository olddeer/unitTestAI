# Unit Test Custom Modes - Quick Reference Card

## 🚀 Quick Start

1. **Switch to VAN_TEST mode** in Cursor chat
2. **Type**: `VAN_TEST`
3. **Specify target class** to test
4. **Follow recommended workflow**

---

## 📋 Mode Overview

| Mode | Command | When to Use | Next Step |
|------|---------|-------------|-----------|
| 🔍 **VAN_TEST** | `VAN_TEST` | Start of any testing task | → PLAN_TEST or IMPLEMENT_TEST |
| 📋 **PLAN_TEST** | `PLAN` | After VAN_TEST (Level 2+) | → CREATIVE_TEST or IMPLEMENT_TEST |
| 🎨 **CREATIVE_TEST** | `CREATIVE` | Complex tests (Level 3-4) | → IMPLEMENT_TEST |
| ⚒️ **IMPLEMENT_TEST** | `IMPLEMENT` | Ready to write tests | → REFLECT_TEST |
| 🔍 **REFLECT_TEST** | `REFLECT` | After tests complete | → VAN_TEST (next class) |

---

## 🎯 Complexity Workflows

```
Level 1 (< 2 hours):
VAN_TEST → IMPLEMENT_TEST → REFLECT_TEST

Level 2 (< 1 day):
VAN_TEST → PLAN_TEST → IMPLEMENT_TEST → REFLECT_TEST

Level 3-4 (< 1 week):
VAN_TEST → PLAN_TEST → CREATIVE_TEST → IMPLEMENT_TEST → REFLECT_TEST
```

---

## 💻 Essential Commands

### Maven Commands
```bash
# Run tests
mvn -q test -Dtest=ClassNameTest

# Generate coverage
mvn -q -DskipITs test jacoco:report | cat

# View coverage report
open target/site/jacoco/index.html

# Clean and rebuild
mvn clean test
```

### Gradle Commands
```bash
# Run tests
./gradlew test --tests ClassNameTest

# Generate coverage
./gradlew test jacocoTestReport

# View coverage report
open build/reports/jacoco/test/html/index.html
```

### Project Analysis
```bash
# Find classes without tests
find src/main/java -name "*.java" -type f

# List existing tests
find src/test/java -name "*Test.java" -type f

# Check test dependencies
grep -E "junit|assertj|mockito" pom.xml
```

---

## ✅ Quality Gates (100 points)

| Metric | Target | Points |
|--------|--------|--------|
| Tests Pass | All green (0 failures) | 40 |
| Line Coverage | ≥ 80% | 30 |
| Test Count | ≤ 10 methods | 30 |

**Goal: 100/100 points** 🎯

---

## 📝 Java Test Rules Checklist

### Required Practices
- ✅ JUnit 5 annotations (`@Test`, `@BeforeEach`)
- ✅ AssertJ assertions (`assertThat`, `assertThatThrownBy`)
- ✅ Given-When-Then structure (blank line separation)
- ✅ Comprehensive scenarios (not fragmented tests)
- ✅ Test independence (local variables only)
- ✅ Mockito for dependencies (`@Mock`, `@InjectMocks`)
- ✅ Parameterized tests for data variations
- ✅ Package-private visibility

### Avoid
- ❌ JUnit 4 annotations (`@org.junit.Test`)
- ❌ JUnit assertions (`assertEquals`, `assertTrue`)
- ❌ Instance fields for test data (`@BeforeEach` state)
- ❌ Fragmented tests (one assertion per test)
- ❌ Testing private methods directly
- ❌ Testing abstract classes/interfaces
- ❌ Public test classes/methods

---

## 🎨 Test Code Patterns

### Test Class Structure
```java
@ExtendWith(MockitoExtension.class)
class ServiceTest {
    @Mock private Repository repository;
    @InjectMocks private Service service;
    
    private Entity createEntity() {
        return new Entity()
            .setField1("value")
            .setField2("value");
    }
    
    @Test
    void shouldHandleHappyPath() {
        // Given
        Entity input = createEntity();
        when(repository.find()).thenReturn(Optional.of(input));
        
        // When
        Result result = service.process();
        
        // Then
        assertThat(result.getField()).isEqualTo(expected);
        verify(repository).find();
    }
}
```

### Parameterized Test
```java
@ParameterizedTest
@CsvSource({
    "null, NullPointerException, 'Cannot be null'",
    "'', IllegalArgumentException, 'Cannot be empty'"
})
void shouldHandleInvalidInputs(String input, 
                                Class<? extends Exception> type,
                                String message) {
    assertThatThrownBy(() -> service.process(input))
        .isInstanceOf(type)
        .hasMessageContaining(message);
}
```

### Exception Testing
```java
@Test
void shouldThrowExceptionWhenInvalidInput() {
    String invalidInput = "invalid";
    
    assertThatThrownBy(() -> service.process(invalidInput))
        .isInstanceOf(ValidationException.class)
        .hasMessageContaining("Invalid format")
        .hasNoCause();
}
```

---

## 📁 Memory Bank Files

| File | Purpose | Created By | When to Update |
|------|---------|-----------|----------------|
| `test-tasks.md` | Single source of truth | VAN_TEST | Constantly during development |
| `activeContext.md` | Current focus | Mode transitions | Every mode switch |
| `test-progress.md` | Implementation status | IMPLEMENT_TEST | During implementation |
| `creative-test-*.md` | Design decisions | CREATIVE_TEST | When design choices made |
| `reflect-test-*.md` | Review & learnings | REFLECT_TEST | After task completion |

---

## 🔧 Troubleshooting

| Problem | Quick Fix |
|---------|-----------|
| Tests fail to compile | Check imports, mock setup |
| NullPointerException | Add mock: `when(dep.method()).thenReturn(value)` |
| Coverage below 80% | Review jacoco report, add edge case tests |
| Too many tests (>10) | Consolidate into comprehensive scenarios |
| Test passes alone, fails in suite | Remove shared state, use local variables |
| Mock not working | Verify `@ExtendWith(MockitoExtension.class)` |

---

## 🎯 Mode Transition Triggers

### To PLAN_TEST
✅ After VAN_TEST completes  
✅ Complexity Level 2+  
✅ User confirms target class  

### To CREATIVE_TEST
✅ After PLAN_TEST completes  
✅ Complexity Level 3-4  
✅ Multiple design approaches possible  

### To IMPLEMENT_TEST
✅ After PLAN_TEST or CREATIVE_TEST  
✅ Plan approved  
✅ Ready to write code  

### To REFLECT_TEST
✅ All tests implemented and passing  
✅ Coverage ≥ 80%  
✅ Quality gates met  

### Back to VAN_TEST
✅ After REFLECT_TEST completes  
✅ Ready for next class  

---

## 💡 Pro Tips

1. **Always start with VAN_TEST** - Don't skip complexity assessment
2. **Use CREATIVE_TEST for Level 3-4** - Design decisions save refactoring time
3. **Run tests frequently** - Fix failures immediately
4. **Comprehensive > Fragmented** - One good test beats five micro-tests
5. **Local variables only** - No instance fields for test data
6. **Parameterize data variations** - Reduces test count, increases coverage
7. **Document in REFLECT_TEST** - Build organizational knowledge
8. **Keep test-tasks.md updated** - Single source of truth

---

## 📊 Example Session Flow

```
1. Switch to 🔍 VAN_TEST
   Type: VAN_TEST
   → Analyzes project, identifies gaps
   → "Let's test UserService (Level 3)"

2. Switch to 📋 PLAN_TEST
   Type: PLAN
   → Creates test plan with 4 scenarios
   → "Next: CREATIVE_TEST for design"

3. Switch to 🎨 CREATIVE_TEST
   Type: CREATIVE
   → Explores test data strategies
   → Recommends helper methods pattern

4. Switch to ⚒️ IMPLEMENT_TEST
   Type: IMPLEMENT
   → Writes 6 tests
   → Runs tests → All green ✅
   → Coverage: 87% ✅
   → Quality: 100/100 🎯

5. Switch to 🔍 REFLECT_TEST
   Type: REFLECT
   → Reviews quality (100/100)
   → Documents patterns
   → "Ready for next class"

6. Back to 🔍 VAN_TEST
   → Test OrderValidator next
```

---

## 🔗 Quick Links

- **Setup Guide**: `custom_modes_test/SETUP-GUIDE.md`
- **Java Test Rules**: `.cursor/rules/java-test-rule.mdc`
- **Coverage Reports**: `target/site/jacoco/index.html`
- **Test Tasks**: `test-memory-bank/test-tasks.md`

---

## 🆘 Need Help?

1. **Read the mode instructions**: Each mode has detailed instructions
2. **Check SETUP-GUIDE.md**: Comprehensive setup and troubleshooting
3. **Review java-test-rule.mdc**: Project testing standards
4. **GitHub Issues**: [cursor-memory-bank issues](https://github.com/vanzan01/cursor-memory-bank/issues)

---

**Remember**: 
- Start with **VAN_TEST** always
- Follow the **recommended workflow**
- Run tests **frequently**
- Aim for **100/100** quality score
- Document in **REFLECT_TEST**

**Happy Testing!** 🚀✅

