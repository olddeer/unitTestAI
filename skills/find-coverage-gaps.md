---
name: find-coverage-gaps
description: Scan the project to find service and repository classes below 80% line coverage. Ranks them by priority score and suggests which ones to test next.
---

# /find-coverage-gaps — Find Classes Needing Tests

## Usage

```
/find-coverage-gaps
/find-coverage-gaps <package>
```

Examples:
```
/find-coverage-gaps
/find-coverage-gaps com.example.service
/find-coverage-gaps com.example.order
```

## What It Does

Scans the project for testable classes (services, repositories, controllers) that are below 80% line coverage. Filters out entity, DTO, and utility classes. Ranks results by priority score and prints a prioritized list with suggested next steps.

## Rules

Only report classes that match the target types:
- Service, Repository, Controller, Processor, Handler, Manager, Validator, Converter

Always exclude:
- Entity (`@Entity`, `@Table`, or name ends with `Entity`)
- DTO (name ends with `Dto`, `DTO`, `Request`, `Response`)
- Utility (name ends with `Util`, `Utils`, `Helper`, `Helpers`)
- Abstract classes and interfaces

## Workflow

### Step 1: Detect build tool

Check for `pom.xml` (Maven) or `build.gradle` / `build.gradle.kts` (Gradle).

### Step 2: Run coverage report

**Maven:**
```bash
mvn -q -DskipITs test jacoco:report | cat
```

**Gradle:**
```bash
./gradlew test jacocoTestReport
```

If tests fail, stop and report — do not read coverage data from a broken build.

### Step 3: Parse JaCoCo XML

- Maven: `target/site/jacoco/jacoco.xml`
- Gradle: `build/reports/jacoco/test/jacocoTestReport.xml`

For each `<class>` element in the report:
1. Extract class name and package
2. Check if the class name matches target types (Service, Repository, etc.)
3. Skip if it matches any exclude pattern (Entity, Dto, Util, etc.)
4. Extract LINE coverage: `covered / (covered + missed)`
5. Keep only classes with line coverage < 80%

If a class has no test file at all, treat its coverage as 0%.

### Step 4: Score and rank

For each candidate, calculate priority score:

```
Priority = (100 - line_coverage%) × dependency_count × 2 + business_logic_bonus
```

Where:
- `dependency_count` = approximate count (use 3 as default if unknown)
- `business_logic_bonus` = 20 if name contains Service or Repository; 10 otherwise

Sort descending.

### Step 5: Report results

Print a prioritized table:

```
Coverage gaps found — 5 classes below 80%

| Priority | Class                 | Package                  | Coverage | Has Tests |
|----------|-----------------------|--------------------------|----------|-----------|
| 1        | OrderService          | com.example.service      | 0%       | no        |
| 2        | PaymentRepository     | com.example.repository   | 31%      | yes       |
| 3        | NotificationService   | com.example.service      | 45%      | yes       |
| 4        | InvoiceProcessor      | com.example.billing      | 58%      | yes       |
| 5        | UserService           | com.example.user         | 74%      | yes       |

Suggested next step:
  /write-unit-test OrderService        ← 0% coverage, no tests yet
  /write-unit-test PaymentRepository   ← 31% coverage, tests incomplete
```

If no gaps are found:
```
All target classes are at >= 80% line coverage.
```

If the scope was limited to a package:
```
No coverage gaps found in com.example.service.
```