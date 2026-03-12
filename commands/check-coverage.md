# /check-coverage - Class Coverage Check

## Usage

```
/check-coverage <ClassName>
```

Example: `/check-coverage UserService`

## What It Does

Runs the project's coverage tool, then reports line and branch coverage for the specified class. If coverage is below 80%, lists the uncovered methods/branches.

## Workflow

### Step 1: Detect build tool

Check for `pom.xml` (Maven) or `build.gradle` / `build.gradle.kts` (Gradle).

### Step 2: Run tests with coverage

**Maven:**
```bash
mvn -q -DskipITs test jacoco:report | cat
```

**Gradle:**
```bash
./gradlew test jacocoTestReport
```

If tests fail, report failures and stop — coverage data from failed runs is unreliable.

### Step 3: Parse the report for the target class

Look up `<ClassName>` in the JaCoCo XML report:

- Maven: `target/site/jacoco/jacoco.xml`
- Gradle: `build/reports/jacoco/test/jacocoTestReport.xml`

Extract from the matching `<class>` element:
- **Line coverage**: `INSTRUCTION` or `LINE` counter — `covered / (covered + missed)`
- **Branch coverage**: `BRANCH` counter — `covered / (covered + missed)`

If the class is not found in the report, say so clearly (class may not have tests or the name may not match).

### Step 4: Report results

```
Coverage for UserService:
  Line coverage:   87% (52/60 lines)
  Branch coverage: 75% (12/16 branches)
  Status: PASS (>= 80%)
```

If below 80%:
```
Coverage for UserService:
  Line coverage:   62% (37/60 lines)
  Branch coverage: 50% (8/16 branches)
  Status: BELOW TARGET

Uncovered areas:
  - handleEdgeCase() — lines 45-52 (no test exercises this path)
  - validateInput() branch at line 23 — null input path not tested
```

### Step 5: Suggest next step (if below target)

- If no test file exists: suggest running `analyze-test`
- If test file exists but coverage is low: suggest running `implement-test` to add missing scenarios
