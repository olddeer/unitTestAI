# Unit Test Custom Modes for Cursor

> Systematic, structured unit test development workflow adapted from [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)

---

## 📚 What's This?

This directory contains **5 custom Cursor modes** specifically designed for Java unit test development. These modes provide a structured workflow that guides you from test analysis through implementation to reflection, ensuring high-quality tests that follow your project's standards.

### The Five Modes

1. **🔍 VAN_TEST** - Test Initialization & Coverage Analysis
2. **📋 PLAN_TEST** - Detailed Test Planning & Scenario Design
3. **🎨 CREATIVE_TEST** - Test Design Exploration & Pattern Creation
4. **⚒️ IMPLEMENT_TEST** - Test Implementation & Execution
5. **🔍 REFLECT_TEST** - Quality Review & Knowledge Capture

---

## 🎯 Why Use These Modes?

### Without Custom Modes
- ❌ Ad-hoc test writing without clear strategy
- ❌ Fragmented tests (10+ micro-tests for simple classes)
- ❌ Low coverage, missed edge cases
- ❌ Inconsistent test quality
- ❌ Lost knowledge and patterns

### With Custom Modes
- ✅ Structured, systematic test development
- ✅ Comprehensive tests (<10 methods, >80% coverage)
- ✅ Consistent adherence to Java test rules
- ✅ Documented design decisions
- ✅ Reusable patterns and knowledge base

---

## 📦 What's Included

```
custom_modes_test/
├── van_test_instructions.md           # VAN_TEST mode instructions
├── plan_test_instructions.md          # PLAN_TEST mode instructions
├── creative_test_instructions.md      # CREATIVE_TEST mode instructions
├── implement_test_instructions.md     # IMPLEMENT_TEST mode instructions
├── reflect_test_instructions.md       # REFLECT_TEST mode instructions
├── SETUP-GUIDE.md                     # Complete setup instructions
├── QUICK-REFERENCE.md                 # Quick reference card
└── README.md                          # This file
```

---

## 🚀 Quick Start

### 1. Read the Setup Guide
```bash
open custom_modes_test/SETUP-GUIDE.md
```

### 2. Configure Custom Modes in Cursor
- Open Cursor Settings → Features → Chat → Enable "Custom modes"
- Create 5 custom modes (instructions in SETUP-GUIDE.md)
- Paste instruction file content into each mode's "Advanced Options"

### 3. Start Testing
- Switch to **VAN_TEST** mode in Cursor chat
- Type: `VAN_TEST`
- Specify target class
- Follow the workflow

### 4. Keep the Quick Reference Handy
```bash
open custom_modes_test/QUICK-REFERENCE.md
```

---

## 🔄 The Workflow

```
┌──────────────┐
│   VAN_TEST   │  Analyze coverage gaps, assess complexity
│   🔍 Init    │  Create test-tasks.md
└──────┬───────┘
       │
       ├─ Level 1 (Simple) ──────────────────┐
       │                                      │
       ├─ Level 2-3 ──────┐                  │
       │                   ▼                  │
       │             ┌────────────┐           │
       │             │ PLAN_TEST  │           │
       │             │ 📋 Plan    │           │
       │             └─────┬──────┘           │
       │                   │                  │
       │  Level 3-4 ───────┼──────┐          │
       │                   │      ▼          │
       │                   │  ┌──────────┐   │
       │                   │  │ CREATIVE │   │
       │                   │  │ 🎨 Design│   │
       │                   │  └────┬─────┘   │
       │                   │       │         │
       └───────────────────┴───────┴─────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │ IMPLEMENT    │  Write tests
                    │ ⚒️ Build     │  Run & fix
                    └──────┬───────┘  Until green ✅
                           │
                           ▼
                    ┌──────────────┐
                    │ REFLECT_TEST │  Review quality
                    │ 🔍 Review    │  Document learnings
                    └──────────────┘  Extract patterns
```

---

## 📊 Quality Standards

All tests are evaluated using the **Test Completion Matrix**:

| Metric | Target | Points |
|--------|--------|--------|
| **Tests Pass** | All green (0 failures) | 40 |
| **Line Coverage** | ≥ 80% | 30 |
| **Test Count** | ≤ 10 methods | 30 |
| **TOTAL** | **Goal** | **100** 🎯 |

---

## 📖 Documentation

| Document | Purpose | Read When |
|----------|---------|-----------|
| **SETUP-GUIDE.md** | Complete setup instructions | Before configuring modes |
| **QUICK-REFERENCE.md** | Commands, patterns, tips | Keep handy during development |
| **van_test_instructions.md** | VAN_TEST mode details | Understanding test initialization |
| **plan_test_instructions.md** | PLAN_TEST mode details | Understanding test planning |
| **creative_test_instructions.md** | CREATIVE_TEST mode details | Understanding test design |
| **implement_test_instructions.md** | IMPLEMENT_TEST mode details | Understanding test implementation |
| **reflect_test_instructions.md** | REFLECT_TEST mode details | Understanding test review |

---

## 🎓 Learning Path

### For First-Time Users
1. ✅ Read `SETUP-GUIDE.md` (15 mins)
2. ✅ Configure all 5 modes in Cursor (20 mins)
3. ✅ Try a Level 1 test (simple utility class) (30 mins)
4. ✅ Review `QUICK-REFERENCE.md` for patterns

### For Regular Users
- Keep `QUICK-REFERENCE.md` open in a separate window
- Reference Java test rules: `.cursor/rules/java-test-rule.mdc`
- Build your personal test pattern library

### For Teams
- Share custom mode configurations
- Establish team test conventions
- Document reusable patterns in `test-memory-bank/`
- Review reflect-test-*.md files together

---

## 🏗️ Project Integration

### Java Test Rules
These modes automatically reference `.cursor/rules/java-test-rule.mdc` which defines:
- JUnit 5 conventions
- AssertJ assertion patterns
- Given-When-Then structure
- Test independence principles
- Comprehensive scenario approach
- Mockito best practices

### Memory Bank Structure
The modes create and maintain:
```
test-memory-bank/
├── test-tasks.md              # Single source of truth
├── activeContext.md           # Current focus
├── test-progress.md           # Implementation tracking
├── creative-test-*.md         # Design decisions
└── reflect-test-*.md          # Review documents
```

---

## 🔧 Supported Frameworks

- **Test Framework**: JUnit 5 (Jupiter)
- **Assertions**: AssertJ
- **Mocking**: Mockito
- **Coverage**: JaCoCo
- **Build Tools**: Maven or Gradle

---

## 🌟 Key Features

### 1. Complexity-Aware Workflow
- Automatically adapts workflow to task complexity
- Level 1: Simple → Skip planning, go straight to implementation
- Level 3-4: Complex → Full workflow with design exploration

### 2. Quality Gates Enforcement
- Measurable quality standards (100-point scale)
- Automated validation via test execution and coverage
- Forces comprehensive approach (≤10 test methods)

### 3. Knowledge Capture
- Documents design decisions (CREATIVE_TEST)
- Captures lessons learned (REFLECT_TEST)
- Builds reusable pattern library
- Organizational knowledge base

### 4. Java Best Practices
- Enforces JUnit 5, AssertJ, Mockito patterns
- Given-When-Then structure
- Test independence
- Comprehensive scenarios
- No fragmented tests

---

## 💡 Best Practices

1. **Always Start with VAN_TEST**
   - Proper complexity assessment prevents wasted effort
   - Creates structured test-tasks.md

2. **Follow Recommended Workflows**
   - Don't skip modes for higher complexity levels
   - Each mode builds on previous output

3. **Use CREATIVE_TEST for Complex Tests**
   - Level 3-4 benefit from design exploration
   - Documents architectural decisions

4. **Run Tests Frequently**
   - After each test method in IMPLEMENT_TEST
   - Fix failures immediately
   - Green state is mandatory

5. **Always Complete REFLECT_TEST**
   - Builds knowledge base
   - Extracts reusable patterns
   - Documents learnings

---

## 🎯 Success Criteria

After using these modes, you should achieve:

✅ Test coverage ≥ 80% for target classes  
✅ Comprehensive tests (≤10 methods per class)  
✅ 100% test pass rate  
✅ Consistent adherence to Java test rules  
✅ Documented test designs and patterns  
✅ Reusable test patterns for similar classes  
✅ Quality score: 100/100 points  

---

## 🔄 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | Oct 2025 | Initial release - adapted from cursor-memory-bank v0.7-beta |

---

## 🙏 Credits

These custom modes are adapted from the excellent [cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank) project by [@vanzan01](https://github.com/vanzan01).

**Original Project**: 2,800+ stars ⭐, 400+ forks  
**Adaptation**: Specialized for Java unit test development  

---

## 📞 Support

### Getting Started
- Read `SETUP-GUIDE.md` for complete setup instructions
- Reference `QUICK-REFERENCE.md` for commands and patterns
- Check `.cursor/rules/java-test-rule.mdc` for project standards

### Troubleshooting
- See SETUP-GUIDE.md → Troubleshooting section
- Check [cursor-memory-bank issues](https://github.com/vanzan01/cursor-memory-bank/issues)
- Review mode instruction files for specific guidance

---

## 🚦 Getting Started Checklist

- [ ] Read SETUP-GUIDE.md
- [ ] Configure 5 custom modes in Cursor
- [ ] Verify `.cursor/rules/java-test-rule.mdc` exists
- [ ] Test with a simple class (Level 1)
- [ ] Keep QUICK-REFERENCE.md handy
- [ ] Start building your test pattern library

---

## 🎉 Ready to Start?

1. **Open**: `custom_modes_test/SETUP-GUIDE.md`
2. **Configure**: Your 5 custom modes in Cursor
3. **Switch**: To VAN_TEST mode
4. **Type**: `VAN_TEST`
5. **Test**: Your first class!

---

**Happy Testing! 🚀✅**

*Systematic. Structured. Successful.*

