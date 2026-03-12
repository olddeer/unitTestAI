# Unit Test Agents - Quick Reference

## Workflow

```
run-tests (orchestrator)  ->  analyze-test  ->  implement-test  ->  review-test  ->  Done (or next class)
```

## Agents

| Agent | Role | What It Does |
|-------|------|-------------|
| **run-tests** | Orchestrator | Build priority queue, drive full cycle, escalate blockers |
| **analyze-test** | Specialist | Scan project, plan tests, design options (Complex) |
| **implement-test** | Specialist | Write tests, run & fix, hit 100/100 |
| **review-test** | Specialist | Verify quality, close task |

## Slash Commands

| Command | What It Does |
|---------|-------------|
| `/quick-test <Class>` | Full cycle for one class (analyze → implement → review) |
| `/quick-test <Class> --plan-only` | Run analyze-test only; stop after plan is written |
| `/quick-test <Class> --coverage-only` | Report current coverage without writing tests |
| `/check-coverage <Class>` | Report line + branch coverage; list uncovered areas |

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

1. **Use `run-tests` for batch work** - it handles the full queue autonomously
2. **Use `/quick-test` for a single class** - one command, full cycle
3. **Use `/check-coverage` before writing tests** - know what's actually missing
4. **Fix failures immediately** in implement-test - don't move on with failing tests
5. **Comprehensive > fragmented** - fewer tests validating more aspects
6. **Local variables only** - no shared state between tests
7. **Parameterize data variations** - reduces test count, increases coverage

## Quick Links

- **Setup**: `MEMORY-BANK-SETUP-TEST.md`
- **Test Rules**: `rules/java-test-rule.mdc` (or your project's equivalent)
- **Test Tasks**: `test-memory-bank/test-tasks.md`
