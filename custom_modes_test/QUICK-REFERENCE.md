# Unit Test Custom Modes - Quick Reference

## Workflow

```
ANALYZE_TEST  ->  IMPLEMENT_TEST  ->  REVIEW_TEST  ->  Done (or next class)
```

## Modes

| Mode | What It Does | Next Step |
|------|-------------|-----------|
| **ANALYZE_TEST** | Scan project, plan tests, design options (Complex) | IMPLEMENT_TEST |
| **IMPLEMENT_TEST** | Write tests, run & fix, hit 100/100 | REVIEW_TEST |
| **REVIEW_TEST** | Verify quality, close task | ANALYZE_TEST (next class) |

## Complexity

| Type | Criteria | Difference |
|------|----------|-----------|
| **Simple** | 0-2 deps, straightforward | Straight to test plan |
| **Complex** | 3+ deps, branching logic | ANALYZE presents design options |

## Quality Gates (100 points)

| Gate | Target | Points |
|------|--------|--------|
| Tests Pass | 0 failures, 0 errors | 40 |
| Coverage | >= 80% | 30 |
| Test Count | Reasonable, comprehensive | 30 |

## Test Rules Checklist

- [ ] Correct test framework (not deprecated)
- [ ] Fluent assertions (project's assertion library)
- [ ] Clear structure (Arrange-Act-Assert / Given-When-Then)
- [ ] Comprehensive scenarios (not fragmented)
- [ ] Test independence (local variables, no shared state)
- [ ] Mocks for external dependencies, verify critical only
- [ ] Parameterized tests for data variations

## Memory Bank

Single file: `test-memory-bank/test-tasks.md`

Contains: plan, status, completion entries.

## Common Commands

```bash
# Run tests (Maven)
mvn -q test -Dtest=ClassNameTest

# Run tests (Gradle)
./gradlew test --tests ClassNameTest

# Generate coverage (Maven + JaCoCo)
mvn -q -DskipITs test jacoco:report | cat

# Generate coverage (Gradle + JaCoCo)
./gradlew test jacocoTestReport
```

## Tips

1. **Always start with ANALYZE_TEST** - don't skip the analysis
2. **Run tests after every change** in IMPLEMENT_TEST
3. **Fix failures immediately** - don't move on with failing tests
4. **Comprehensive > fragmented** - fewer tests validating more aspects
5. **Local variables only** - no shared state between tests
6. **Parameterize data variations** - reduces test count, increases coverage
7. **Refer to project test rules** - all conventions live there, not in mode files

## Quick Links

- **Setup**: `custom_modes_test/SETUP-GUIDE.md`
- **Test Rules**: `.cursor/rules/java-test-rule.mdc` (or your project's equivalent)
- **Test Tasks**: `test-memory-bank/test-tasks.md`
