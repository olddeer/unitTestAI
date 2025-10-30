# UNIT TEST PLANNING MODE (TEST-PLAN)

Your role is to create a detailed test plan based on the complexity level determined in TEST-VAN mode.

```mermaid
graph TD
    Start["🚀 START TEST-PLAN"] --> ReadTasks["📚 Read test-tasks.md<br>.cursor/rules/java-test-rule.mdc"]
    
    %% Complexity Level Determination
    ReadTasks --> CheckLevel{"🧩 Determine<br>Test Complexity"}
    CheckLevel -->|"Level 2"| Level2["📝 LEVEL 2 TEST PLANNING<br>Standard Unit Tests"]
    CheckLevel -->|"Level 3"| Level3["📋 LEVEL 3 TEST PLANNING<br>Complex Unit Tests"]
    CheckLevel -->|"Level 4"| Level4["📊 LEVEL 4 TEST PLANNING<br>Critical Test Suites"]
    
    %% Level 2 Planning
    Level2 --> L2Review["🔍 Review Class<br>Under Test"]
    L2Review --> L2Scenarios["📋 Identify Test Scenarios:<br>- Happy path<br>- Edge cases<br>- Error handling"]
    L2Scenarios --> L2Mocking["🎭 Identify Dependencies<br>to Mock"]
    L2Mocking --> L2Structure["📐 Plan Test Structure:<br>- Setup (@BeforeEach)<br>- Test methods<br>- Assertions"]
    L2Structure --> L2Params["🔢 Identify Parameterized<br>Test Opportunities"]
    L2Params --> L2Update["📝 Update test-tasks.md<br>with Test Plan"]
    L2Update --> L2Verify["✓ Verify Plan<br>Completeness"]
    
    %% Level 3 Planning
    Level3 --> L3Review["🔍 Deep Review of<br>Business Logic"]
    L3Review --> L3Scenarios["📋 Comprehensive Scenarios:<br>- Multiple workflows<br>- State transitions<br>- Integration points<br>- Reactive streams"]
    L3Scenarios --> L3Mocking["🎭 Complex Mocking Strategy"]
    L3Mocking --> L3Structure["📐 Detailed Test Structure:<br>- Helper methods<br>- Test data builders<br>- Nested test classes"]
    L3Structure --> L3Coverage["📊 Coverage Strategy:<br>Target specific untested paths"]
    L3Coverage --> L3Update["📝 Update test-tasks.md<br>with Comprehensive Plan"]
    L3Update --> L3Flag["🎨 Flag Components<br>Requiring TEST-CREATIVE"]
    L3Flag --> L3Verify["✓ Verify Plan<br>Completeness"]
    
    %% Level 4 Planning
    Level4 --> L4Analysis["🔍 Critical Path<br>Analysis"]
    L4Analysis --> L4Scenarios["📋 Exhaustive Scenarios:<br>- All code paths<br>- Security aspects<br>- Performance criteria<br>- Error recovery"]
    L4Scenarios --> L4Strategy["🏗️ Multi-Layer Test Strategy:<br>- Unit tests<br>- Integration tests<br>- Performance tests"]
    L4Strategy --> L4Structure["📐 Advanced Test Structure:<br>- Test suites<br>- Test fixtures<br>- Custom matchers"]
    L4Structure --> L4Matrix["📊 Detailed Test Matrix<br>Coverage Plan"]
    L4Matrix --> L4Update["📝 Update test-tasks.md<br>with Strategic Plan"]
    L4Update --> L4Flag["🎨 Flag Components<br>Requiring TEST-CREATIVE"]
    L4Flag --> L4Verify["✓ Verify Plan<br>Completeness"]
    
    %% Verification & Completion
    L2Verify & L3Verify & L4Verify --> CheckCreative{"🎨 Creative<br>Test Strategy<br>Required?"}
    
    %% Mode Transition
    CheckCreative -->|"Yes"| RecCreative["⏭️ NEXT MODE:<br>TEST-CREATIVE MODE"]
    CheckCreative -->|"No"| RecImplement["⏭️ NEXT MODE:<br>TEST-IMPLEMENT MODE"]
    
    %% Template Reference
    Start -.-> Template["📋 TEST PLAN TEMPLATE:<br>- Class Under Test<br>- Dependencies to Mock<br>- Test Scenarios<br>- Assertions to Validate<br>- Parameterized Test Data<br>- Expected Coverage Impact"]
    
    %% Styling
    style Start fill:#4da6ff,stroke:#0066cc,color:white
    style ReadTasks fill:#80bfff,stroke:#4da6ff,color:black
    style CheckLevel fill:#d94dbb,stroke:#a3378a,color:white
    style Level2 fill:#4dbb5f,stroke:#36873f,color:white
    style Level3 fill:#ffa64d,stroke:#cc7a30,color:white
    style Level4 fill:#ff5555,stroke:#cc0000,color:white
    style CheckCreative fill:#d971ff,stroke:#a33bc2,color:white
    style RecCreative fill:#ffa64d,stroke:#cc7a30,color:black
    style RecImplement fill:#4dbb5f,stroke:#36873f,color:black
```

## IMPLEMENTATION STEPS

### Step 1: READ TEST RULES & TASKS
```
read_file({
  target_file: ".cursor/rules/java-test-rule.mdc",
  should_read_entire_file: true
})

read_file({
  target_file: "memory-bank/test-tasks.md",
  should_read_entire_file: true
})
```

### Step 2: ANALYZE CLASS UNDER TEST
```
# Read the class that needs testing
read_file({
  target_file: "src/main/java/com/example/YourClass.java",
  should_read_entire_file: true
})
```

### Step 3: IDENTIFY EXISTING TEST (IF ANY)
```
# Check if test already exists
read_file({
  target_file: "src/test/java/com/example/YourClassTest.java",
  should_read_entire_file: true
})
```

## TEST PLANNING APPROACH

Create a detailed test plan that identifies test scenarios, mocking strategies, and assertion strategies based on complexity level.

### Level 2: Standard Test Planning

For Level 2 tests, focus on identifying the main test scenarios, dependencies to mock, and straightforward assertions.

```mermaid
graph TD
    L2["📝 LEVEL 2 TEST PLANNING"] --> Analyze["Analyze class methods"]
    Analyze --> Scenarios["Identify scenarios:"]
    Scenarios --> Happy["✓ Happy path per method"]
    Scenarios --> Edge["⚠️ Edge cases"]
    Scenarios --> Error["❌ Error scenarios"]
    Happy & Edge & Error --> Mock["🎭 List dependencies to mock"]
    Mock --> Assert["📋 Plan assertions"]
    Assert --> Param["🔢 Identify parameterized opportunities"]
    
    style L2 fill:#4dbb5f,stroke:#36873f,color:white
    style Analyze fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Scenarios fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Happy fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Edge fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Error fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Mock fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Assert fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Param fill:#d6f5dd,stroke:#a3e0ae,color:black
```

**Example Test Plan for Level 2:**

```markdown
## Test Plan: UserService

### Class Under Test
- `UserService.java`
- Dependencies: `UserRepository`, `EmailService`

### Test Scenarios
1. **findUserById - Happy Path**
   - Given: Valid user ID exists in repository
   - When: findUserById called
   - Then: User returned successfully

2. **findUserById - Not Found**
   - Given: User ID doesn't exist
   - When: findUserById called
   - Then: Optional.empty() returned

3. **createUser - Success**
   - Given: Valid user data
   - When: createUser called
   - Then: User saved, email sent

4. **createUser - Validation Failure**
   - Given: Invalid email format
   - When: createUser called
   - Then: ValidationException thrown

### Mocking Strategy
- Mock `UserRepository` with `@Mock`
- Mock `EmailService` with `@Mock`
- Use `@InjectMocks` for `UserService`

### Parameterized Tests
- Email validation: multiple invalid formats
- User search: various ID formats

### Expected Coverage Impact
- Current: 45% → Target: 82%
- Methods covered: 7/8
```

### Level 3-4: Comprehensive Test Planning

For Level 3-4 tests, develop detailed test plans that cover complex scenarios, reactive patterns, and integration points.

```mermaid
graph TD
    L34["📊 LEVEL 3-4 TEST PLANNING"] --> Analyze["Deep analysis of business logic"]
    Analyze --> Workflows["Identify workflows:"]
    Workflows --> Success["✓ Success paths"]
    Workflows --> Alternative["🔄 Alternative flows"]
    Workflows --> Failure["❌ Failure scenarios"]
    Workflows --> State["📊 State transitions"]
    Success & Alternative & Failure & State --> Mock["🎭 Complex mocking strategy"]
    Mock --> Reactive["⚡ Reactive testing approach<br>(StepVerifier for Flux/Mono)"]
    Reactive --> Assert["📋 Comprehensive assertions"]
    Assert --> Helper["🛠️ Plan helper methods"]
    Helper --> Creative["🎨 Flag for creative strategy"]
    
    style L34 fill:#ffa64d,stroke:#cc7a30,color:white
    style Analyze fill:#ffe6cc,stroke:#ffa64d,color:black
    style Workflows fill:#ffe6cc,stroke:#ffa64d,color:black
    style Success fill:#ffe6cc,stroke:#ffa64d,color:black
    style Alternative fill:#ffe6cc,stroke:#ffa64d,color:black
    style Failure fill:#ffe6cc,stroke:#ffa64d,color:black
    style State fill:#ffe6cc,stroke:#ffa64d,color:black
    style Mock fill:#ffe6cc,stroke:#ffa64d,color:black
    style Reactive fill:#ffe6cc,stroke:#ffa64d,color:black
    style Assert fill:#ffe6cc,stroke:#ffa64d,color:black
    style Helper fill:#ffe6cc,stroke:#ffa64d,color:black
    style Creative fill:#ffe6cc,stroke:#ffa64d,color:black
```

**Example Test Plan for Level 3:**

```markdown
## Test Plan: PaymentProcessor

### Class Under Test
- `PaymentProcessor.java` (Reactive)
- Dependencies: `PaymentGateway`, `AccountService`, `NotificationService`

### Complex Test Scenarios

#### 1. Successful Payment Flow
- Given: Valid payment request, sufficient balance
- When: processPayment called
- Then: Payment completed, account debited, notification sent
- **Reactive**: Use StepVerifier to verify Mono/Flux emissions

#### 2. Insufficient Balance Flow
- Given: Valid payment request, insufficient balance
- When: processPayment called
- Then: InsufficientFundsException, rollback, notification sent

#### 3. Gateway Timeout Scenario
- Given: Valid payment, gateway timeout
- When: processPayment called
- Then: Retry logic triggered, eventual success or failure

#### 4. Concurrent Payment Handling
- Given: Multiple payments for same account
- When: Parallel processPayment calls
- Then: Proper concurrency control, no double-charging

### Mocking Strategy (Complex)
- Mock `PaymentGateway` with different responses:
  - Success (Mono.just)
  - Timeout (Mono.delay with error)
  - Failure (Mono.error)
- Mock `AccountService` reactive methods
- Verify interaction order with `InOrder`

### Reactive Testing Approach
```java
StepVerifier.create(paymentProcessor.processPayment(request))
    .expectNext(expectedResult)
    .verifyComplete();

StepVerifier.create(paymentProcessor.processPayment(invalidRequest))
    .expectError(InsufficientFundsException.class)
    .verify();
```

### Helper Methods Needed
- `createValidPaymentRequest()`
- `createPaymentAccount(BigDecimal balance)`
- `mockGatewaySuccess()`
- `mockGatewayTimeout()`

### Test Data Builders
- `PaymentRequestBuilder` for fluent test data creation

### Coverage Strategy
- Target untested branches in error handling
- Cover all state transitions
- Test retry logic paths

### Expected Coverage Impact
- Current: 30% → Target: 85%
- Critical paths: 100% coverage

### Creative Strategy Flag
⚠️ **Requires TEST-CREATIVE**: Complex retry logic testing strategy
```

## TEST SCENARIO IDENTIFICATION

```mermaid
graph TD
    Scenarios["🎯 TEST SCENARIO IDENTIFICATION"] --> Method["For each public method"]
    Method --> Happy["1️⃣ Happy Path:<br>Valid inputs, expected outputs"]
    Method --> Edge["2️⃣ Edge Cases:<br>Boundary values, empty/null"]
    Method --> Error["3️⃣ Error Handling:<br>Exceptions, validation failures"]
    Method --> State["4️⃣ State Changes:<br>Before/after conditions"]
    
    Happy & Edge & Error & State --> Coverage["Map to coverage gaps"]
    Coverage --> Priority["Prioritize by:<br>- Business criticality<br>- Current coverage<br>- Bug history"]
    
    style Scenarios fill:#d971ff,stroke:#a33bc2,color:white
    style Method fill:#e6b3ff,stroke:#d971ff,color:black
    style Happy fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Edge fill:#fff3cd,stroke:#ffc107,color:black
    style Error fill:#ffcccc,stroke:#ff8080,color:black
    style State fill:#cce6ff,stroke:#80bfff,color:black
    style Coverage fill:#e6b3ff,stroke:#d971ff,color:black
    style Priority fill:#e6b3ff,stroke:#d971ff,color:black
```

## MOCKING STRATEGY PLANNING

```mermaid
graph TD
    Mock["🎭 MOCKING STRATEGY"] --> Identify["Identify dependencies"]
    Identify --> Type{"Dependency Type?"}
    Type -->|"Repository/DAO"| Repo["Mock data access:<br>when().thenReturn()"]
    Type -->|"External Service"| External["Mock service calls:<br>Success/Failure scenarios"]
    Type -->|"Reactive"| Reactive["Mock reactive returns:<br>Mono.just(), Flux.fromIterable()"]
    Type -->|"Utility"| Util["Consider real implementation<br>or simple mock"]
    
    Repo & External & Reactive & Util --> Verify["Plan verifications:<br>verify(), times(), InOrder"]
    
    style Mock fill:#4dbbbb,stroke:#368787,color:white
    style Identify fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Type fill:#fff3cd,stroke:#ffc107,color:black
    style Repo fill:#cce6ff,stroke:#80bfff,color:black
    style External fill:#cce6ff,stroke:#80bfff,color:black
    style Reactive fill:#cce6ff,stroke:#80bfff,color:black
    style Util fill:#cce6ff,stroke:#80bfff,color:black
    style Verify fill:#d6f5dd,stroke:#a3e0ae,color:black
```

## PARAMETERIZED TEST OPPORTUNITIES

Identify opportunities to use `@ParameterizedTest` to reduce test count while increasing coverage:

```mermaid
graph TD
    Param["🔢 PARAMETERIZED TEST OPPORTUNITIES"] --> Pattern{"Look for patterns:"}
    Pattern --> SameLogic["Same logic, different inputs"]
    Pattern --> Validation["Validation rules"]
    Pattern --> Boundaries["Boundary conditions"]
    Pattern --> DataVariations["Data format variations"]
    
    SameLogic --> Example1["Example: Email validation<br>@CsvSource with valid/invalid emails"]
    Validation --> Example2["Example: Age validation<br>@ValueSource with ages"]
    Boundaries --> Example3["Example: Amount ranges<br>@MethodSource with test cases"]
    
    style Param fill:#4da6ff,stroke:#0066cc,color:white
    style Pattern fill:#cce6ff,stroke:#80bfff,color:black
    style SameLogic fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Validation fill:#d6f5dd,stroke:#a3e0ae,color:black
    style Boundaries fill:#d6f5dd,stroke:#a3e0ae,color:black
    style DataVariations fill:#d6f5dd,stroke:#a3e0ae,color:black
```

## CREATIVE STRATEGY IDENTIFICATION

```mermaid
graph TD
    Creative["🎨 CREATIVE STRATEGY NEEDED?"] --> Check{"Complex scenarios<br>requiring design?"}
    Check -->|"Yes"| Flag["Flag for TEST-CREATIVE:"]
    Flag --> Retry["• Retry/Circuit breaker logic"]
    Flag --> Concurrency["• Concurrency/Threading tests"]
    Flag --> Performance["• Performance test approach"]
    Flag --> Complex["• Complex state machines"]
    Flag --> Integration["• Integration test strategy"]
    
    Check -->|"No"| Direct["Proceed to TEST-IMPLEMENT"]
    
    style Creative fill:#d971ff,stroke:#a33bc2,color:white
    style Check fill:#fff3cd,stroke:#ffc107,color:black
    style Flag fill:#ffe6cc,stroke:#ffa64d,color:black
    style Direct fill:#d6f5dd,stroke:#a3e0ae,color:black
```

## VERIFICATION CHECKLIST

Before completing TEST-PLAN mode:

```
✓ TEST-PLAN VERIFICATION
- [ ] Class under test thoroughly analyzed
- [ ] All public methods identified
- [ ] Test scenarios documented (happy path, edge cases, errors)
- [ ] Dependencies identified for mocking
- [ ] Mocking strategy defined
- [ ] Assertion strategy planned
- [ ] Parameterized test opportunities identified
- [ ] Helper methods planned (if Level 3-4)
- [ ] Test data builders planned (if needed)
- [ ] Coverage impact estimated
- [ ] Creative strategy flagged (if needed)
- [ ] test-tasks.md updated with plan
```

## EXAMPLE INTERACTION

```
User: TEST-PLAN for UserService

AI: ## TEST-PLAN MODE ACTIVATED ✅

📋 **Test Plan: UserService**

🎯 **Class Under Test**: UserService.java
📊 **Current Coverage**: 45% → **Target**: 82%

### Test Scenarios Identified

1️⃣ **findUserById - Happy Path**
   - Valid ID → User returned

2️⃣ **findUserById - Not Found**
   - Invalid ID → Optional.empty()

3️⃣ **createUser - Success**
   - Valid data → User saved + email sent

4️⃣ **createUser - Validation Failure**
   - Invalid email → ValidationException

5️⃣ **updateUser - Concurrent Modification**
   - Version conflict → ConcurrentModificationException

🎭 **Mocking Strategy**:
- Mock UserRepository (@Mock)
- Mock EmailService (@Mock)
- Use @InjectMocks for UserService

🔢 **Parameterized Tests**:
- Email validation (6 invalid formats)
- User search (3 ID format variations)

📈 **Coverage Impact**:
Methods: 7/8 covered (87.5%)
Lines: +37% (estimated 82% total)

⏭️ **Next**: TEST-IMPLEMENT MODE
No creative strategy needed for this Level 2 test.

Ready to implement tests?
```

## TEST PLAN TEMPLATE

```markdown
## Test Plan: [ClassName]

### Class Under Test
- File: `[package.ClassName].java`
- Current Coverage: X%
- Target Coverage: 80%+
- Complexity Level: [1-4]

### Dependencies
- [Dependency1] - [Mock/Real]
- [Dependency2] - [Mock/Real]

### Test Scenarios

#### Scenario 1: [Method Name - Scenario]
- **Given**: [Preconditions]
- **When**: [Action]
- **Then**: [Expected outcome]
- **Assertions**: [Specific assertions]

#### Scenario 2: [Method Name - Scenario]
[...]

### Mocking Strategy
- Mock [Dependency]: `when([method]).thenReturn([value])`
- Verify [interaction]: `verify([mock], times(N)).[method]`

### Parameterized Tests
- Test: [Description]
- Source: @CsvSource / @ValueSource / @MethodSource
- Data: [List test data]

### Helper Methods
- `[methodName]()`: [Purpose]

### Test Data Builders (if needed)
- `[BuilderName]`: [Purpose]

### Expected Coverage Impact
- Lines: [X%] → [Y%]
- Methods: [M/N]
- Branches: [B/C]

### Creative Strategy Flag
- [ ] No creative strategy needed → TEST-IMPLEMENT
- [ ] Creative strategy required → TEST-CREATIVE
  - Reason: [Why creative approach needed]
```

## COMMITMENT

```
┌─────────────────────────────────────────────────────┐
│ I WILL thoroughly analyze the class under test      │
│ I WILL identify all meaningful test scenarios       │
│ I WILL plan appropriate mocking strategies          │
│ I WILL identify parameterized test opportunities    │
│ I WILL estimate coverage impact                     │
│ I WILL flag complex scenarios for creative strategy │
│ I WILL follow Java test rule guidelines             │
└─────────────────────────────────────────────────────┘
```
