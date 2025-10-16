# Memory Bank System v0.7-beta - Complete Setup Guide

> **Official installation guide for the Cursor Memory Bank system**  
> Source: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation Steps](#installation-steps)
- [Configuring Custom Modes](#configuring-custom-modes)
- [Understanding the System](#understanding-the-system)
- [Getting Started](#getting-started)
- [Troubleshooting](#troubleshooting)
- [Advanced Features](#advanced-features)
- [Best Practices](#best-practices)

---

## Overview

### What is Memory Bank v0.7-beta?

Memory Bank is a modular, documentation-driven framework that uses Cursor custom modes to provide persistent memory and guide AI through a structured development workflow. It uses hierarchical rule loading, progressive documentation, and visual process maps.

### Key Features

✨ **Hierarchical Rule Loading**: Load only essential rules with specialized lazy-loading  
✨ **Progressive Documentation**: Concise templates that scale with task complexity  
✨ **Unified Context Transfer**: Efficient context preservation between modes  
✨ **Mode-Specific Visual Maps**: Clear visual representations for each phase  
✨ **Level-Specific Workflows**: Adapted processes based on complexity (Levels 1-4)  
✨ **Platform-Aware Commands**: Automatically adapts commands to your OS  

### What You'll Get

```
your-project/
├── .cursor/
│   └── rules/
│       └── isolation_rules/      # Hierarchical rule system
│           ├── Core/              # Core optimization rules
│           ├── Level1/            # Quick bug fix workflows
│           ├── Level2/            # Simple enhancement workflows
│           ├── Level3/            # Intermediate feature workflows
│           ├── Level4/            # Complex system workflows
│           ├── Phases/            # Creative phase guidelines
│           ├── visual-maps/       # Process visualization
│           └── main.mdc           # Main entry point
├── custom_modes/                  # Mode instruction files
│   ├── van_instructions.md
│   ├── plan_instructions.md
│   ├── creative_instructions.md
│   ├── implement_instructions.md
│   └── reflect_archive_instructions.md
└── memory-bank/                   # Your project's context (you create)
    ├── tasks.md                   # Single source of truth
    ├── activeContext.md           # Current focus
    ├── progress.md                # Status tracking
    └── [other context files]
```

---

## Prerequisites

Before starting, ensure you have:

✅ **Cursor Editor**: Version 0.48 or higher  
✅ **Custom Modes Enabled**: Settings → Features → Chat → Custom modes  
✅ **AI Model**: Claude 4 Sonnet or Claude 4 Opus (recommended)  
✅ **Git**: For cloning the repository  

### Enabling Custom Modes in Cursor

1. Open Cursor Settings
2. Navigate to: **Features → Chat**
3. Enable: **"Custom modes"**
4. Restart Cursor if prompted

---

## Installation Steps

### Step 1: Clone the Repository

Navigate to your project directory and clone the Memory Bank repository:

```bash
# Navigate to your project directory
cd /path/to/your/project

# Clone the repository
git clone https://github.com/vanzan01/cursor-memory-bank.git

# Copy the necessary directories
cp -r cursor-memory-bank/.cursor .
cp -r cursor-memory-bank/custom_modes .

# Optional: Copy documentation
mkdir -p docs/memory-bank
cp cursor-memory-bank/*.md docs/memory-bank/

# Remove the cloned repository (keep only what you need)
rm -rf cursor-memory-bank
```

**Alternative for macOS/Linux (one-liner)**:
```bash
git clone https://github.com/vanzan01/cursor-memory-bank.git && \
cp -r cursor-memory-bank/.cursor cursor-memory-bank/custom_modes . && \
rm -rf cursor-memory-bank
```

### Step 2: Create Memory Bank Directory

Create your project's memory-bank directory structure:

```bash
# Create memory-bank directories
mkdir -p memory-bank/{creative,reflection,archive}

# Create core files
touch memory-bank/{projectbrief.md,activeContext.md,tasks.md,progress.md}
touch memory-bank/{techContext.md,systemPatterns.md,style-guide.md,productContext.md}
```

### Step 3: Initialize tasks.md

This is your **single source of truth**:

```bash
cat > memory-bank/tasks.md << 'EOF'
# Tasks - Source of Truth

**Status**: Initialized
**Project**: [Your Project Name]
**Date**: [Current Date]

## Current Task
No active task. Type "VAN" to begin initialization and analysis.

## How to Start
1. Switch to VAN mode in Cursor
2. Type: **VAN**
3. Describe your task or goal
4. Follow the guided workflow

## Task Complexity Levels
- **Level 1**: Quick Bug Fix (< 2 hours) - Direct to IMPLEMENT
- **Level 2**: Simple Enhancement (< 1 day) - VAN → PLAN → IMPLEMENT → REFLECT
- **Level 3**: Intermediate Feature (< 1 week) - Full workflow with CREATIVE
- **Level 4**: Complex System (> 1 week) - Full workflow with architecture

## Task History
- [Date]: Memory Bank system initialized
EOF
```

---

## Configuring Custom Modes

**⚠️ CRITICAL STEP**: This is the most important part of the setup. You must manually create six custom modes in Cursor.

### How to Add Custom Modes

1. Open Cursor
2. Click the **mode selector** in the chat panel (usually shows "Normal")
3. Select **"Add custom mode"** at the bottom
4. Configure each mode as detailed below

### Mode 1: 🔍 VAN (Initialization & Analysis)

**Configuration:**
- **Name**: `🔍 VAN` (copy the emoji)
- **Icon**: Choose any icon from Cursor's options
- **Shortcut**: Optional (e.g., `Cmd+1`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Fetch Rules
- **Advanced Options**: Click to expand, then paste the **entire contents** from:  
  `custom_modes/van_instructions.md`

### Mode 2: 📋 PLAN (Task Planning)

**Configuration:**
- **Name**: `📋 PLAN`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+2`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
- **Advanced Options**: Paste from `custom_modes/plan_instructions.md`

### Mode 3: 🎨 CREATIVE (Design Decisions)

**Configuration:**
- **Name**: `🎨 CREATIVE`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+3`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Edit File
  - ✅ Fetch Rules
- **Advanced Options**: Paste from `custom_modes/creative_instructions.md`

### Mode 4: ⚒️ IMPLEMENT (Code Implementation)

**Configuration:**
- **Name**: `⚒️ IMPLEMENT`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+4`)
- **Tools to Enable**: **✅ ALL TOOLS**
- **Advanced Options**: Paste from `custom_modes/implement_instructions.md`

### Mode 5: 🔍 REFLECT (Review & Archive)

**Configuration:**
- **Name**: `🔍 REFLECT` or `ARCHIVE`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+5`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
- **Advanced Options**: Paste from `custom_modes/reflect_archive_instructions.md`

> **Note**: REFLECT and ARCHIVE are combined in one mode to optimize Cursor's character limits.

### QA Functionality

QA is **not a separate mode** but a set of validation functions callable from any mode:
- Simply type **"QA"** in any mode when you need technical validation
- Available throughout the development process
- No separate mode configuration needed

---

## Understanding the System

### System Architecture Overview

The Memory Bank system consists of three key layers:

1. **Rule System** (`.cursor/rules/isolation_rules/`)
   - Hierarchical, lazy-loaded rules
   - Complexity-based workflows (Level 1-4)
   - Visual process maps
   - Platform-aware command generation

2. **Mode Instructions** (`custom_modes/`)
   - Detailed instructions for each development phase
   - Loaded into Cursor's custom modes
   - Guides AI behavior in each phase

3. **Project Context** (`memory-bank/`)
   - Your project-specific information
   - Tasks, progress, decisions
   - Progressive documentation

### Mode Workflow

```
┌─────────┐
│   VAN   │  Analysis & Complexity Determination
│ 🔍 Entry│
└────┬────┘
     │
     ├─ Level 1 ─────────────┐
     │                        │
     ├─ Level 2-4 ────┐      │
     │                 ▼      ▼
     │            ┌─────────────┐
     │            │    PLAN     │
     │            │ 📋 Planning │
     │            └──────┬──────┘
     │                   │
     │         ┌─────────┴─────────┐
     │         │                   │
     │    (Design    │         (No Design
     │     Needed)   │          Needed)
     │         │                   │
     │         ▼                   │
     │    ┌──────────┐            │
     │    │ CREATIVE │            │
     │    │ 🎨 Design│            │
     │    └────┬─────┘            │
     │         │                   │
     │         └────────┬──────────┘
     │                  ▼
     │            ┌────────────┐
     └───────────▶│ IMPLEMENT  │
                  │ ⚒️  Build   │
                  └─────┬──────┘
                        │
                        ▼
                  ┌───────────┐
                  │  REFLECT  │
                  │ 🔍 Review  │
                  └─────┬─────┘
                        │
                    (Type "ARCHIVE NOW")
                        │
                        ▼
                  ┌───────────┐
                  │  ARCHIVE  │
                  │ 📦 Document│
                  └─────┬─────┘
                        │
                        └────────┐
                                 │
                        ┌────────▼─────┐
                        │  Next Task   │
                        │  VAN mode    │
                        └──────────────┘
```

### Complexity Levels

| Level | Description | Time Estimate | Workflow |
|-------|-------------|---------------|----------|
| **Level 1** | Quick Bug Fix | < 2 hours | VAN → IMPLEMENT → REFLECT |
| **Level 2** | Simple Enhancement | < 1 day | VAN → PLAN → IMPLEMENT → REFLECT |
| **Level 3** | Intermediate Feature | < 1 week | VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT → ARCHIVE |
| **Level 4** | Complex System | > 1 week | Full workflow with comprehensive architecture |

### Core Memory Bank Files

| File | Purpose | Update Frequency |
|------|---------|------------------|
| `tasks.md` | **Single source of truth** | Constantly during active work |
| `activeContext.md` | Current focus and mode | Every mode transition |
| `progress.md` | Status tracking | After major milestones |
| `projectbrief.md` | Project overview | Once at start, rare updates |
| `techContext.md` | Technology stack | When tech changes |
| `systemPatterns.md` | Architecture patterns | When patterns emerge |
| `style-guide.md` | Coding standards | When standards evolve |
| `productContext.md` | Product information | When product evolves |

---

## Getting Started

### Verification Checklist

Before your first use, verify:

```bash
# ✅ Check .cursor/rules structure exists
ls -la .cursor/rules/isolation_rules/

# ✅ Check custom_modes files exist
ls -la custom_modes/

# ✅ Check memory-bank structure
ls -la memory-bank/

# ✅ Verify tasks.md exists
cat memory-bank/tasks.md
```

### First Usage: The VAN Command

1. **Switch to VAN Mode**
   - Open Cursor chat panel
   - Click mode selector dropdown
   - Select "🔍 VAN"

2. **Type: VAN**
   - Simply type: `VAN`
   - VAN mode will:
     - Initialize the system
     - Analyze your project structure
     - Detect platform (macOS/Linux/Windows)
     - Verify Memory Bank files
     - Wait for your task description

3. **Describe Your Task**
   - After VAN initializes, describe what you want to accomplish
   - VAN will:
     - Analyze complexity
     - Determine workflow level (1-4)
     - Update `tasks.md`
     - Recommend next mode

4. **Follow the Workflow**
   - VAN will tell you which mode to switch to next
   - Switch modes and continue

### Example First Session

```
You: VAN

AI: [Initializes, checks files, verifies platform]
    System initialized. Ready for task description.
    
You: I need to add a new settings menu to the app

AI: [Analyzes request]
    
    ## VAN Analysis Complete ✅
    
    **Task**: Add settings menu
    **Complexity**: Level 3 (Intermediate Feature)
    **Estimated Time**: 3-4 days
    **Affected Components**: 
    - UI layer (menu creation)
    - Settings storage
    - Navigation flow
    
    **Workflow**: VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT → ARCHIVE
    
    **Next Step**: Switch to PLAN mode
    
You: [Switch to PLAN mode, type: PLAN]

[Continue through workflow...]
```

---

## Troubleshooting

### Problem: Modes Not Responding Correctly

**Symptoms**: AI doesn't follow mode-specific behavior

**Solutions**:
1. ✅ Verify you pasted the **complete** content from `custom_modes/[mode]_instructions.md`
2. ✅ Check "Advanced Options" was expanded when pasting
3. ✅ Ensure correct tools are enabled for each mode
4. ✅ Try deleting and recreating the mode
5. ✅ Restart Cursor

### Problem: "Cannot Find Rules" Error

**Symptoms**: Error messages about missing rule files

**Solutions**:
```bash
# Verify .cursor/rules structure exists
ls -la .cursor/rules/isolation_rules/

# If missing, re-clone and copy
git clone https://github.com/vanzan01/cursor-memory-bank.git temp-mb
cp -r temp-mb/.cursor .
rm -rf temp-mb

# Verify main rule file exists
cat .cursor/rules/isolation_rules/main.mdc
```

### Problem: Memory Bank Files Not Found

**Symptoms**: AI says it can't find `tasks.md` or other memory-bank files

**Solutions**:
```bash
# Verify memory-bank directory exists in project root
ls -la memory-bank/

# Check tasks.md exists and has content
cat memory-bank/tasks.md

# If missing, recreate:
mkdir -p memory-bank
cat > memory-bank/tasks.md << 'EOF'
# Tasks - Source of Truth

**Status**: Initialized
**Project**: [Your Project Name]

## Current Task
Type "VAN" to begin
EOF
```

### Problem: Custom Modes Not Appearing

**Symptoms**: Mode dropdown doesn't show your custom modes

**Solutions**:
1. ✅ Verify custom modes are enabled:
   - Settings → Features → Chat → Custom modes ✓
2. ✅ Restart Cursor completely
3. ✅ Check Cursor version is 0.48+
4. ✅ Try creating a test mode to verify feature works

### Problem: Mode Instructions Too Long

**Symptoms**: Cursor won't accept the mode instructions (character limit)

**Solutions**:
1. The v0.7-beta combines REFLECT+ARCHIVE to save space
2. If still too long, you may need to trim some examples from the instructions
3. Keep the core workflow instructions, remove optional examples
4. This is a known Cursor limitation

### Problem: Platform Commands Not Working

**Symptoms**: Shell commands fail or aren't recognized

**Solutions**:
- The system auto-detects platform on VAN initialization
- Verify VAN ran successfully by checking `memory-bank/tasks.md`
- Look for "Platform: Darwin/Linux/Windows" in VAN output
- If detection failed, manually specify in VAN mode

---

## Advanced Features

### Hierarchical Rule System

The `.cursor/rules/isolation_rules/` directory contains a sophisticated rule system that:

- **Lazy-loads rules** based on complexity level
- **Optimizes token usage** by loading only what's needed
- **Provides visual process maps** for each workflow phase
- **Enables platform-aware commands**

You don't need to interact with these rules directly—they're automatically invoked by the mode system via the `Fetch Rules` tool.

### Progressive Documentation

Memory Bank uses progressive documentation that scales with task complexity:

**Level 1 (Quick Fix)**:
- Minimal documentation
- Quick updates to `tasks.md`
- Brief reflection

**Level 2 (Enhancement)**:
- Basic planning in `tasks.md`
- Simple reflection document
- No creative phase needed

**Level 3 (Feature)**:
- Comprehensive planning
- Creative phase documents in `memory-bank/creative/`
- Detailed reflection
- Full archive

**Level 4 (System)**:
- Extensive architecture planning
- Multiple creative phase documents
- Comprehensive reflection
- Detailed archive with cross-references

### QA Integration

Type **"QA"** in any mode to invoke quality assurance checks:

- **Build Test**: Verify project compiles
- **Dependency Check**: Verify dependencies
- **Config Check**: Validate configuration
- **Environment Check**: Verify environment setup

QA uses the rule system to provide context-aware validation without requiring a separate mode.

### Customizing for Your Project Type

#### For Java Projects

```bash
# Add Java-specific content to techContext.md
cat >> memory-bank/techContext.md << 'EOF'

## Java-Specific Configuration
**Java Version**: [e.g., JDK 17]
**Build Tool**: [e.g., Gradle 8.x]
**Testing Framework**: JUnit 5
**Test Coverage**: JaCoCo
**Code Style**: [e.g., Google Java Style Guide]
EOF
```

#### For Web Apps

Enhance `productContext.md` with UX focus and track user-facing changes.

#### For Games

Add gameplay mechanics to `systemPatterns.md` and include game design in creative phases.

#### For Mobile Apps

Add platform-specific sections and device testing checklists.

---

## Best Practices

### General Principles

1. **Always Start with VAN**
   - Never skip analysis phase
   - Proper complexity assessment saves time
   - Sets up correct workflow

2. **Keep tasks.md Current**
   - Update after every significant progress
   - Use it as your dashboard
   - Should always reflect current state

3. **Don't Skip Modes**
   - Each mode has a purpose
   - Following workflow prevents mistakes
   - Especially important for Level 3-4 tasks

4. **Document Decisions**
   - Use creative/ folder for design decisions
   - Capture "why" not just "what"
   - Future you will thank present you

5. **Reflect Honestly**
   - Reflection improves future estimates
   - Capture both successes and failures
   - Learnings compound over time

### When to Update Each File

#### During VAN
- ✅ Update: `tasks.md`, `activeContext.md`
- ✅ Review: `projectbrief.md`, `techContext.md`

#### During PLAN
- ✅ Update: `tasks.md`, `activeContext.md`
- ✅ Possibly update: `techContext.md`, `systemPatterns.md`

#### During CREATIVE
- ✅ Update: `tasks.md`, `activeContext.md`
- ✅ Create: `creative/creative-[feature].md`

#### During IMPLEMENT
- ✅ Update constantly: `tasks.md`
- ✅ Update regularly: `activeContext.md`, `progress.md`

#### During REFLECT
- ✅ Create: `reflection/reflection-[task].md`
- ✅ Update: `tasks.md`, `progress.md`
- ✅ Possibly update: `systemPatterns.md`, `style-guide.md`

#### During ARCHIVE
- ✅ Create: `archive/archive-[task].md`
- ✅ Update: `tasks.md` (mark complete), `progress.md`, `activeContext.md` (reset)

### Common Workflows

#### Starting Work Daily
```
1. Read tasks.md to see where you left off
2. Check activeContext.md for current focus
3. Continue in current mode or transition as planned
```

#### Switching Tasks
```
1. Always complete current task through ARCHIVE
2. Reset activeContext.md
3. Start new task with VAN mode
```

#### Handling Interruptions
```
1. Update tasks.md with current state
2. Note where you stopped
3. When returning, read tasks.md first
4. Continue from noted point
```

---

## Summary

The Memory Bank system provides:

✅ **Persistent context** across sessions  
✅ **Structured workflows** for any complexity  
✅ **Single source of truth** (tasks.md)  
✅ **Progressive documentation** that grows with your project  
✅ **Mode-based development** that enforces best practices  

**Getting Started**:
1. Clone the repository and copy files to your project
2. Create memory-bank directory and initialize files
3. Configure custom modes in Cursor (CRITICAL STEP)
4. Type "VAN" and describe your first task
5. Follow the mode-based workflow

**Core Philosophy**:
- Start with VAN for proper analysis
- Plan before implementing (except Level 1)
- Design before coding (when needed)
- Reflect after completing
- Archive to close the loop

The system scales from quick fixes to complex features while maintaining context and enforcing disciplined development practices.

---

**Version**: 0.7-beta  
**Source**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)  
**Last Updated**: 2025-10-16  
**Additional Resources**:
- [Memory Bank Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md)
- [Release Notes](https://github.com/vanzan01/cursor-memory-bank/blob/main/RELEASE_NOTES.md)
- [Memory Bank Upgrade Guide](https://github.com/vanzan01/cursor-memory-bank/blob/main/memory_bank_upgrade_guide.md)
- [CREATIVE Mode and Claude's "Think" Tool](https://github.com/vanzan01/cursor-memory-bank/blob/main/creative_mode_think_tool.md)

