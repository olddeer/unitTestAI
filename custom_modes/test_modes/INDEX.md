# Unit Test Custom Modes - Documentation Index

**Welcome!** This directory contains a complete system for structured unit test development using Cursor custom modes.

## 📖 Documentation Guide

### 🚀 Getting Started (Read First!)

1. **[QUICKSTART.md](QUICKSTART.md)** ⚡ **(START HERE - 5 minutes)**
   - Quickest path to testing your first class
   - Mode configuration instructions
   - Example session walkthrough
   - Success checklist

2. **[UNIT-TEST-MODES-SUMMARY.md](../../UNIT-TEST-MODES-SUMMARY.md)** 📋 **(Overview - 10 minutes)**
   - What was created and why
   - Comparison with original Memory Bank modes
   - Key adaptations for unit testing
   - Integration with Java test rules

3. **[README.md](README.md)** 📚 **(Complete Guide - 30 minutes)**
   - Comprehensive documentation for all modes
   - Detailed workflows and best practices
   - Memory bank structure
   - Troubleshooting and tips

---

### 🔧 Mode Instruction Files (For Cursor Configuration)

**Copy these into Cursor's "Advanced Options" when creating custom modes:**

4. **[test_van_instructions.md](test_van_instructions.md)** 🔍
   - **Mode**: TEST-VAN (Test Analysis & Initialization)
   - **Purpose**: Analyze code, identify dependencies, determine test complexity
   - **Length**: ~450 lines

5. **[test_plan_instructions.md](test_plan_instructions.md)** 📋
   - **Mode**: TEST-PLAN (Test Planning)
   - **Purpose**: Create test scenarios and mocking strategies
   - **Length**: ~520 lines

6. **[test_creative_instructions.md](test_creative_instructions.md)** 🎨
   - **Mode**: TEST-CREATIVE (Test Design)
   - **Purpose**: Design solutions for complex testing challenges
   - **Length**: ~585 lines

7. **[test_implement_instructions.md](test_implement_instructions.md)** ⚒️
   - **Mode**: TEST-IMPLEMENT (Test Implementation)
   - **Purpose**: Write actual unit tests with best practices
   - **Length**: ~735 lines

8. **[test_reflect_archive_instructions.md](test_reflect_archive_instructions.md)** 🔍
   - **Mode**: TEST-REFLECT & ARCHIVE (Test Review & Documentation)
   - **Purpose**: Reflect on test quality and archive documentation
   - **Length**: ~790 lines

---

## 🎯 Quick Reference

### By Your Goal

| What You Want to Do | Start With | Time Needed |
|---------------------|-----------|-------------|
| Get started immediately | [QUICKSTART.md](QUICKSTART.md) | 5 min |
| Understand the system | [UNIT-TEST-MODES-SUMMARY.md](../../UNIT-TEST-MODES-SUMMARY.md) | 10 min |
| Deep dive into details | [README.md](README.md) | 30 min |
| Configure TEST-VAN mode | [test_van_instructions.md](test_van_instructions.md) | Copy & paste |
| Configure TEST-PLAN mode | [test_plan_instructions.md](test_plan_instructions.md) | Copy & paste |
| Configure TEST-CREATIVE mode | [test_creative_instructions.md](test_creative_instructions.md) | Copy & paste |
| Configure TEST-IMPLEMENT mode | [test_implement_instructions.md](test_implement_instructions.md) | Copy & paste |
| Configure TEST-REFLECT mode | [test_reflect_archive_instructions.md](test_reflect_archive_instructions.md) | Copy & paste |

---

### By Your Experience Level

#### 🌱 New to Memory Bank System
1. Read [QUICKSTART.md](QUICKSTART.md) - Understand basic workflow
2. Read [UNIT-TEST-MODES-SUMMARY.md](../../UNIT-TEST-MODES-SUMMARY.md) - Understand adaptations
3. Configure modes using instruction files
4. Test a simple class
5. Refer back to [README.md](README.md) as needed

#### 🌿 Familiar with Original Memory Bank
1. Skim [UNIT-TEST-MODES-SUMMARY.md](../../UNIT-TEST-MODES-SUMMARY.md) - See what changed
2. Read "Key Adaptations" section
3. Configure modes using instruction files
4. Review [QUICKSTART.md](QUICKSTART.md) for quick usage patterns
5. Use [README.md](README.md) as reference

#### 🌳 Expert User
1. Review [UNIT-TEST-MODES-SUMMARY.md](../../UNIT-TEST-MODES-SUMMARY.md) - Key differences table
2. Configure modes directly from instruction files
3. Use [README.md](README.md) as reference when needed
4. Customize templates in memory bank files for your project

---

## 📁 File Sizes

| File | Lines | Purpose |
|------|-------|---------|
| QUICKSTART.md | ~250 | Quick start guide |
| README.md | ~850 | Comprehensive documentation |
| test_van_instructions.md | ~450 | TEST-VAN mode configuration |
| test_plan_instructions.md | ~520 | TEST-PLAN mode configuration |
| test_creative_instructions.md | ~585 | TEST-CREATIVE mode configuration |
| test_implement_instructions.md | ~735 | TEST-IMPLEMENT mode configuration |
| test_reflect_archive_instructions.md | ~790 | TEST-REFLECT mode configuration |
| **TOTAL** | **~2,850** | **Complete system** |

---

## 🎓 Recommended Reading Path

### Path 1: Fast Track (15 minutes)
```
QUICKSTART.md → Configure modes → Start testing
```
**Best for**: Getting started immediately

### Path 2: Understanding Track (45 minutes)
```
QUICKSTART.md → UNIT-TEST-MODES-SUMMARY.md → README.md → Configure modes → Start testing
```
**Best for**: Understanding the system deeply

### Path 3: Expert Track (5 minutes)
```
UNIT-TEST-MODES-SUMMARY.md (Key Differences) → Configure modes → Start testing
```
**Best for**: Experienced Memory Bank users

---

## 🔗 Related Resources

### Required Files
- **`.cursor/rules/java-test-rule.mdc`** - Java unit testing guidelines
  - Must exist in your project
  - Enforced by all test modes
  - Contains testing best practices

### External Resources
- **[Original Memory Bank](https://github.com/vanzan01/cursor-memory-bank)** - Source system
- **[JUnit 5 Documentation](https://junit.org/junit5/docs/current/user-guide/)** - Testing framework
- **[AssertJ Documentation](https://assertj.github.io/doc/)** - Assertions library
- **[Mockito Documentation](https://javadoc.io/doc/org.mockito/mockito-core/latest/)** - Mocking framework
- **[JaCoCo Documentation](https://www.jacoco.org/jacoco/trunk/doc/)** - Coverage tool

---

## 🎯 Mode Configuration Quick Links

**To configure a mode in Cursor:**
1. Open Cursor → Click mode selector → "Add custom mode"
2. Set name and tools (see QUICKSTART.md)
3. Click "Advanced options"
4. Copy **entire content** from the instruction file
5. Save

**Direct links to instruction files:**
- [TEST-VAN Instructions](test_van_instructions.md)
- [TEST-PLAN Instructions](test_plan_instructions.md)
- [TEST-CREATIVE Instructions](test_creative_instructions.md)
- [TEST-IMPLEMENT Instructions](test_implement_instructions.md)
- [TEST-REFLECT Instructions](test_reflect_archive_instructions.md)

---

## 💡 Quick Tips

### First Time Setup
1. Start with QUICKSTART.md
2. Configure one mode at a time
3. Test the mode after configuration
4. Move to next mode when working

### Daily Usage
1. Always start with TEST-VAN
2. Follow recommended workflow
3. Keep test-tasks.md updated
4. Run tests frequently during implementation

### Troubleshooting
1. Verify mode configuration (entire content pasted?)
2. Check java-test-rule.mdc exists
3. Ensure proper tools enabled for each mode
4. Review README.md troubleshooting section

---

## ✅ Verification Checklist

Before starting your first test:

- [ ] Read QUICKSTART.md
- [ ] Understood recommended workflows
- [ ] All 5 modes configured in Cursor
- [ ] Tested each mode with simple command
- [ ] `.cursor/rules/java-test-rule.mdc` exists
- [ ] `memory-bank/` directory created (or will be auto-created)
- [ ] `docs/tests/` directory created (or will be auto-created)

---

## 🚀 Ready to Start?

**Absolute Beginner**: [QUICKSTART.md](QUICKSTART.md)  
**Want Full Picture**: [UNIT-TEST-MODES-SUMMARY.md](../../UNIT-TEST-MODES-SUMMARY.md)  
**Need Reference**: [README.md](README.md)  

**Already configured?** Switch to TEST-VAN mode and type: `TEST-VAN`

---

## 📞 Support

### Questions about the modes?
- Check [README.md](README.md) "Troubleshooting" section
- Review [QUICKSTART.md](QUICKSTART.md) "Troubleshooting" section

### Questions about original Memory Bank?
- See [cursor-memory-bank repository](https://github.com/vanzan01/cursor-memory-bank)
- Check [Issues](https://github.com/vanzan01/cursor-memory-bank/issues)

---

**Last Updated**: 2025-10-30  
**Version**: 1.0  
**Status**: ✅ Ready for Production Use
