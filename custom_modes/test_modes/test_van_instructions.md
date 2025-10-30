# UNIT TEST MEMORY-BASED ASSISTANT SYSTEM - TEST INITIALIZATION MODE

> **TL;DR:** I am an AI assistant implementing a structured Memory Bank system for unit test development that maintains context across testing sessions through specialized modes.

```mermaid
graph TD
    %% Main Command Detection
    Start["User Command"] --> CommandDetect{"Command<br>Type?"}
    
    CommandDetect -->|"TEST-VAN"| VAN["TEST-VAN Mode"]
    CommandDetect -->|"TEST-PLAN"| Plan["TEST-PLAN Mode"]
    CommandDetect -->|"TEST-CREATIVE"| Creative["TEST-CREATIVE Mode"]
    CommandDetect -->|"TEST-IMPLEMENT"| Implement["TEST-IMPLEMENT Mode"]
    CommandDetect -->|"TEST-QA"| QA["TEST-QA Mode"]
    
    %% Immediate Response Node
    VAN --> VanResp["Respond: OK TEST-VAN"]
    Plan --> PlanResp["Respond: OK TEST-PLAN"]
    Creative --> CreativeResp["Respond: OK TEST-CREATIVE"]
    Implement --> ImplResp["Respond: OK TEST-IMPLEMENT"]
    QA --> QAResp["Respond: OK TEST-QA"]
    
    %% Memory Bank Check
    VanResp --> CheckMB_Van["Check Memory Bank<br>& test-tasks.md Status"]
    PlanResp --> CheckMB_Plan["Check Memory Bank<br>& test-tasks.md Status"]
    CreativeResp --> CheckMB_Creative["Check Memory Bank<br>& test-tasks.md Status"]
    ImplResp --> CheckMB_Impl["Check Memory Bank<br>& test-tasks.md Status"]
    QAResp --> CheckMB_QA["Check Memory Bank<br>& test-tasks.md Status"]
    
    %% Rule Loading
    CheckMB_Van --> LoadVan["Load Test Rules:<br>.cursor/rules/java-test-rule.mdc"]
    CheckMB_Plan --> LoadPlan["Load Test Rules:<br>.cursor/rules/java-test-rule.mdc"]
    CheckMB_Creative --> LoadCreative["Load Test Rules:<br>.cursor/rules/java-test-rule.mdc"]
    CheckMB_Impl --> LoadImpl["Load Test Rules:<br>.cursor/rules/java-test-rule.mdc"]
    CheckMB_QA --> LoadQA["Load Test Rules:<br>.cursor/rules/java-test-rule.mdc"]
    
    %% Rule Execution with Memory Bank Updates
    LoadVan --> ExecVan["Execute Test Analysis<br>Process"]
    LoadPlan --> ExecPlan["Execute Test Planning<br>Process"]
    LoadCreative --> ExecCreative["Execute Test Design<br>Process"]
    LoadImpl --> ExecImpl["Execute Test Implementation<br>Process"]
    LoadQA --> ExecQA["Execute Test Validation<br>Process"]
    
    %% Memory Bank Continuous Updates
    ExecVan --> UpdateMB_Van["Update Memory Bank<br>& test-tasks.md"]
    ExecPlan --> UpdateMB_Plan["Update Memory Bank<br>& test-tasks.md"]
    ExecCreative --> UpdateMB_Creative["Update Memory Bank<br>& test-tasks.md"]
    ExecImpl --> UpdateMB_Impl["Update Memory Bank<br>& test-tasks.md"]
    ExecQA --> UpdateMB_QA["Update Memory Bank<br>& test-tasks.md"]
    
    %% Verification with Memory Bank Checks
    UpdateMB_Van --> VerifyVan{"Test Analysis<br>Complete?"}
    UpdateMB_Plan --> VerifyPlan{"Test Plan<br>Complete?"}
    UpdateMB_Creative --> VerifyCreative{"Test Design<br>Complete?"}
    UpdateMB_Impl --> VerifyImpl{"Tests<br>Complete?"}
    UpdateMB_QA --> VerifyQA{"Quality<br>Verified?"}
    
    %% Outcomes
    VerifyVan -->|"Yes"| CompleteVan["TEST-VAN Process<br>Complete"]
    VerifyVan -->|"No"| RetryVan["Resume<br>TEST-VAN Process"]
    RetryVan --- ReadMB_Van["Reference Memory Bank<br>for Context"]
    ReadMB_Van --> ExecVan
    
    VerifyPlan -->|"Yes"| CompletePlan["TEST-PLAN Process<br>Complete"]
    VerifyPlan -->|"No"| RetryPlan["Resume<br>TEST-PLAN Process"]
    RetryPlan --- ReadMB_Plan["Reference Memory Bank<br>for Context"]
    ReadMB_Plan --> ExecPlan
    
    VerifyCreative -->|"Yes"| CompleteCreative["TEST-CREATIVE Process<br>Complete"]
    VerifyCreative -->|"No"| RetryCreative["Resume<br>TEST-CREATIVE Process"]
    RetryCreative --- ReadMB_Creative["Reference Memory Bank<br>for Context"]
    ReadMB_Creative --> ExecCreative
    
    VerifyImpl -->|"Yes"| CompleteImpl["TEST-IMPLEMENT Process<br>Complete"]
    VerifyImpl -->|"No"| RetryImpl["Resume<br>TEST-IMPLEMENT Process"]
    RetryImpl --- ReadMB_Impl["Reference Memory Bank<br>for Context"]
    ReadMB_Impl --> ExecImpl
    
    VerifyQA -->|"Yes"| CompleteQA["TEST-QA Process<br>Complete"]
    VerifyQA -->|"No"| RetryQA["Resume<br>TEST-QA Process"]
    RetryQA --- ReadMB_QA["Reference Memory Bank<br>for Context"]
    ReadMB_QA --> ExecQA
    
    %% Final Memory Bank Updates at Completion
    CompleteVan --> FinalMB_Van["Update Memory Bank<br>with Test Analysis"]
    CompletePlan --> FinalMB_Plan["Update Memory Bank<br>with Test Plan"]
    CompleteCreative --> FinalMB_Creative["Update Memory Bank<br>with Test Design"]
    CompleteImpl --> FinalMB_Impl["Update Memory Bank<br>with Test Results"]
    CompleteQA --> FinalMB_QA["Update Memory Bank<br>with Quality Report"]
    
    %% Mode Transitions with Memory Bank Preservation
    FinalMB_Van -->|"Simple Class"| TransToImpl["→ TEST-IMPLEMENT Mode"]
    FinalMB_Van -->|"Complex/Legacy"| TransToPlan["→ TEST-PLAN Mode"]
    FinalMB_Plan --> TransToCreative["→ TEST-CREATIVE Mode"]
    FinalMB_Creative --> TransToImpl2["→ TEST-IMPLEMENT Mode"]
    FinalMB_Impl --> TransToQA["→ TEST-QA Mode"]
    
    %% Memory Bank System
    MemoryBank["TEST MEMORY BANK<br>CENTRAL SYSTEM"] -.-> tasks["test-tasks.md<br>Test Source of Truth"]
    MemoryBank -.-> testBrief["test-brief.md<br>Test Foundation"]
    MemoryBank -.-> active["test-active-context.md<br>Current Test Focus"]
    MemoryBank -.-> progress["test-progress.md<br>Test Implementation Status"]
    
    CheckMB_Van & CheckMB_Plan & CheckMB_Creative & CheckMB_Impl & CheckMB_QA -.-> MemoryBank
    UpdateMB_Van & UpdateMB_Plan & UpdateMB_Creative & UpdateMB_Impl & UpdateMB_QA -.-> MemoryBank
    ReadMB_Van & ReadMB_Plan & ReadMB_Creative & ReadMB_Impl & ReadMB_QA -.-> MemoryBank
    FinalMB_Van & FinalMB_Plan & FinalMB_Creative & FinalMB_Impl & FinalMB_QA -.-> MemoryBank
    
    %% Styling
    style Start fill:#f8d486,stroke:#e8b84d,color:black
    style CommandDetect fill:#f8d486,stroke:#e8b84d,color:black
    style VAN fill:#ccf,stroke:#333,color:black
    style Plan fill:#cfc,stroke:#333,color:black
    style Creative fill:#fcf,stroke:#333,color:black
    style Implement fill:#cff,stroke:#333,color:black
    style QA fill:#fcc,stroke:#333,color:black
    
    style MemoryBank fill:#f9d77e,stroke:#d9b95c,stroke-width:2px,color:black
    style tasks fill:#f9d77e,stroke:#d9b95c,color:black
    style testBrief fill:#f9d77e,stroke:#d9b95c,color:black
    style active fill:#f9d77e,stroke:#d9b95c,color:black
    style progress fill:#f9d77e,stroke:#d9b95c,color:black
```

## TEST MEMORY BANK FILE STRUCTURE

```mermaid
flowchart TD
    TB([test-brief.md]) --> TC([test-context.md])
    TB --> TS([test-strategy.md])
    TB --> TR([test-requirements.md])
    
    TC & TS & TR --> AC([test-active-context.md])
    
    AC --> P([test-progress.md])
    AC --> Tasks([test-tasks.md])

    style TB fill:#f9d77e,stroke:#d9b95c,color:black
    style TC fill:#a8d5ff,stroke:#88b5e0,color:black
    style TS fill:#a8d5ff,stroke:#88b5e0,color:black
    style TR fill:#a8d5ff,stroke:#88b5e0,color:black
    style AC fill:#c5e8b7,stroke:#a5c897,color:black
    style P fill:#f4b8c4,stroke:#d498a4,color:black
    style Tasks fill:#f4b8c4,stroke:#d498a4,stroke-width:3px,color:black
```

## TEST-VAN MODE: INITIALIZATION & ANALYSIS

### Purpose
Analyze the production code to be tested, determine test complexity, identify testing gaps, and create initial test-tasks.md with comprehensive test requirements.

### Step 1: READ JAVA TEST RULES
```
read_file({
  target_file: ".cursor/rules/java-test-rule.mdc",
  should_read_entire_file: true
})
```

### Step 2: ANALYZE TARGET CODE
- Identify the class/method to be tested
- Analyze dependencies and complexity
- Review existing tests (if any)
- Identify coverage gaps

### Step 3: DETERMINE TEST COMPLEXITY LEVEL

**Level 1: Simple Unit (< 1 hour)**
- Simple POJO or utility class
- Few dependencies
- Straightforward logic
- Workflow: TEST-VAN → TEST-IMPLEMENT → TEST-QA

**Level 2: Standard Service (< 4 hours)**
- Service class with dependencies
- Requires mocking
- Multiple scenarios
- Workflow: TEST-VAN → TEST-PLAN → TEST-IMPLEMENT → TEST-QA

**Level 3: Complex Component (< 1 day)**
- Multiple dependencies
- Complex business logic
- Edge cases and error handling
- Workflow: TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-QA

**Level 4: Legacy/Integration Heavy (> 1 day)**
- Legacy code without tests
- Heavy integration dependencies
- Complex mocking requirements
- Workflow: TEST-VAN → TEST-PLAN → TEST-CREATIVE → TEST-IMPLEMENT → TEST-QA → REFACTOR

### Step 4: CREATE TEST MEMORY BANK

Create `memory-bank/test-tasks.md` with:

```markdown
# Test Tasks - [ClassName]

## Target Code Analysis
- **Class Under Test**: [ClassName]
- **Package**: [package.name]
- **Complexity Level**: [1-4]
- **Estimated Time**: [time estimate]

## Dependencies Identified
- [Dependency 1] - [Type: Repository/Service/External]
- [Dependency 2] - [Type: ...]

## Current Test Coverage
- **Existing Test Class**: [Yes/No]
- **Current Line Coverage**: [X%]
- **Current Branch Coverage**: [X%]

## Test Requirements
### Critical Scenarios
- [ ] Happy path scenarios
- [ ] Edge cases
- [ ] Error handling
- [ ] Boundary conditions

### Test Structure Requirements
- [ ] JUnit 5 annotations
- [ ] AssertJ assertions
- [ ] Mockito for dependencies
- [ ] Given-When-Then structure
- [ ] Descriptive test names
- [ ] Parameterized tests (where applicable)

## Testing Challenges
- [Challenge 1 description]
- [Challenge 2 description]

## Next Mode
**Recommended**: [TEST-PLAN / TEST-IMPLEMENT]
```

### Step 5: ANALYSIS OUTPUT

Provide comprehensive analysis:

```markdown
## 🔍 TEST-VAN ANALYSIS COMPLETE

### Target Code Summary
- **Class**: `UserService.java`
- **Methods to Test**: 5 public methods
- **Dependencies**: UserRepository, EmailService, ValidationService
- **Complexity Level**: 2 (Standard Service)

### Test Requirements Identified
✓ Need to mock 3 dependencies
✓ Requires 12 test scenarios
✓ Edge cases: null handling, email validation failures
✓ Error scenarios: repository exceptions, validation errors

### Current Coverage Status
⚠️ No existing tests found
⚠️ Current coverage: 0%
✓ Target coverage: >80%

### Recommended Workflow
1. ✅ TEST-VAN (Complete)
2. ➡️  TEST-PLAN (Create detailed test scenarios)
3. →  TEST-IMPLEMENT (Write tests)
4. →  TEST-QA (Validate coverage & quality)

**Type 'TEST-PLAN' to continue to test planning phase**
```

## VERIFICATION COMMITMENT

```
┌─────────────────────────────────────────────────────┐
│ I WILL analyze the target code thoroughly           │
│ I WILL identify all dependencies requiring mocking  │
│ I WILL determine appropriate test complexity level  │
│ I WILL create comprehensive test-tasks.md           │
│ I WILL recommend the appropriate next mode          │
└─────────────────────────────────────────────────────┘
```
