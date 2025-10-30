# Memory Bank System v0.7-beta - Complete Installation Guide

> **Official installation guide for cursor-memory-bank**  
> Repository: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)

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

### What is Memory Bank System?

Memory Bank is a modular, documentation-driven framework that uses Cursor custom modes to provide persistent memory and guide AI through a structured development workflow. It features hierarchical rule loading, progressive documentation, and visual process maps to help you build software more efficiently.

> **Note**: This is version v0.7-beta with significant token optimization improvements while maintaining all functionality.

### Key Features

✨ **Hierarchical Rule Loading**: Load only essential rules with specialized lazy-loading  
✨ **Progressive Documentation**: Concise templates that scale with task complexity  
✨ **Unified Context Transfer**: Efficient context preservation between modes  
✨ **Mode-Specific Visual Maps**: Clear visual representations for each development phase  
✨ **Level-Specific Workflows**: Adapted processes based on complexity (Levels 1-4)  
✨ **Platform-Aware Commands**: Automatically adapts commands to your operating system  

### What You'll Get

```
your-project/
├── .cursor/
│   └── rules/
│       └── isolation_rules/         # Hierarchical rule system
│           ├── main.mdc             # Entry point
│           ├── Core/                # Core optimization rules
│           ├── Level1/              # Quick fixes (< 2 hours)
│           ├── Level2/              # Enhancements (< 1 day)
│           ├── Level3/              # Features (< 1 week)
│           ├── Level4/              # Complex systems (> 1 week)
│           ├── Phases/              # Creative phase guidelines
│           └── visual-maps/         # Process visualizations
├── custom_modes/                    # Mode instruction files
│   ├── van_instructions.md          # Initialization mode
│   ├── plan_instructions.md         # Task planning mode
│   ├── creative_instructions.md     # Design decisions mode
│   ├── implement_instructions.md    # Implementation mode
│   └── reflect_archive_instructions.md  # Review & documentation
└── memory-bank/                     # Your project context (created after first use)
    ├── tasks.md                     # Single source of truth
    ├── activeContext.md             # Current focus
    ├── progress.md                  # Implementation status
    ├── creative-*.md                # Design decision documents
    └── reflect-*.md                 # Review documents
```

---

## Prerequisites

Before starting, ensure you have:

✅ **Cursor Editor**: Version 0.48 or higher  
✅ **Custom Modes Enabled**: Settings → Features → Chat → Custom modes  
✅ **AI Model**: Claude 4 Sonnet or Claude 4 Opus (recommended for best results)  
✅ **Git**: For cloning the repository  
✅ **Terminal Access**: To run installation commands  

### Enabling Custom Modes in Cursor

1. Open Cursor Settings (Cmd+, on macOS or Ctrl+, on Windows/Linux)
2. Navigate to: **Features → Chat**
3. Enable: **"Custom modes"**
4. Restart Cursor if prompted

---

## Installation Steps

### Step 1: Clone the Repository

Navigate to your project directory and clone cursor-memory-bank:

```bash
# Navigate to your project directory
cd /path/to/your/project

# Clone the repository
git clone https://github.com/vanzan01/cursor-memory-bank.git

# Move the required directories to your project root
mv cursor-memory-bank/.cursor .
mv cursor-memory-bank/custom_modes .

# Optional: Keep documentation files
mkdir -p memory-bank-docs
mv cursor-memory-bank/*.md memory-bank-docs/

# Remove the cloned repository folder
rm -rf cursor-memory-bank
```

**Alternative - Direct Setup** (if you prefer not to keep git history):

```bash
cd /path/to/your/project

# Clone and copy only what's needed
git clone https://github.com/vanzan01/cursor-memory-bank.git temp-memory-bank
cp -r temp-memory-bank/.cursor .
cp -r temp-memory-bank/custom_modes .
rm -rf temp-memory-bank
```

### Step 2: Verify Installation

Check that the files are in place:

```bash
# Verify .cursor/rules/isolation_rules directory exists
ls -la .cursor/rules/isolation_rules/

# Expected structure:
# .cursor/rules/isolation_rules/
# ├── main.mdc
# ├── Core/
# ├── Level1/
# ├── Level2/
# ├── Level3/
# ├── Level4/
# ├── Phases/
# └── visual-maps/

# Verify custom_modes directory exists
ls -la custom_modes/

# Expected files:
# - van_instructions.md
# - plan_instructions.md
# - creative_instructions.md
# - implement_instructions.md
# - reflect_archive_instructions.md
```

### Step 3: Verify Rule Files

Quickly check that the main rule file is readable:

```bash
# Check main.mdc exists and is readable
cat .cursor/rules/isolation_rules/main.mdc | head -20
```

You should see the Memory Bank main rule content. If the file is empty or doesn't exist, the installation may have failed.

### Step 4: Initial Memory Bank Structure

The `memory-bank/` directory will be created automatically when you first use VAN mode. You don't need to create it manually. After first use, you'll have:

```
memory-bank/
├── tasks.md           # Created by VAN mode
├── activeContext.md   # Created by mode transitions
├── progress.md        # Created by IMPLEMENT mode
└── [other files created as needed]
```

---

## Configuring Custom Modes

**⚠️ CRITICAL STEP**: This is the most important and challenging part of the setup. You must manually create custom modes in Cursor and copy instruction content from the provided files.

### How to Add Custom Modes in Cursor

1. Open Cursor and click the **mode selector** in the chat panel (usually shows "Normal")
2. Select **"Add custom mode"** at the bottom
3. In the configuration screen:
   - Enter the mode name (you can include emoji icons by copy-pasting)
   - Select an icon from Cursor's predefined options
   - Add a shortcut (optional)
   - Check the required tools
   - Click on **Advanced options**
   - In the empty text box that appears at the bottom, paste the custom instruction content from the corresponding file

### Required Custom Modes

You need to create **5-6 custom modes**. The system uses 6 modes but REFLECT and ARCHIVE can be combined into one mode due to Cursor's limits.

---

### Mode 1: 🔍 VAN (Initialization)

**Configuration:**
- **Name**: `🔍 VAN` (copy the emoji if you want)
- **Icon**: Choose any icon from Cursor's options
- **Shortcut**: Optional (e.g., `Cmd+1` or `Ctrl+1`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Fetch Rules
- **Advanced Options**: Click to expand, then paste **the entire content** from:
  ```
  custom_modes/van_instructions.md
  ```

**Purpose**: VAN mode initializes your project, analyzes structure, determines task complexity (Levels 1-4), and creates the initial `memory-bank/tasks.md` file.

---

### Mode 2: 📋 PLAN (Task Planning)

**Configuration:**
- **Name**: `📋 PLAN`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+2` or `Ctrl+2`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
- **Advanced Options**: Paste **the entire content** from:
  ```
  custom_modes/plan_instructions.md
  ```

**Purpose**: PLAN mode creates detailed implementation plans, breaks down complex tasks, and prepares structured approach for development.

---

### Mode 3: 🎨 CREATIVE (Design Decisions)

**Configuration:**
- **Name**: `🎨 CREATIVE`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+3` or `Ctrl+3`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
  - ✅ Edit File
  - ✅ Fetch Rules
- **Advanced Options**: Paste **the entire content** from:
  ```
  custom_modes/creative_instructions.md
  ```

**Purpose**: CREATIVE mode explores design alternatives, makes architectural decisions, and documents design choices. Works best with Claude 4 models.

---

### Mode 4: ⚒️ IMPLEMENT (Code Implementation)

**Configuration:**
- **Name**: `⚒️ IMPLEMENT`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+4` or `Ctrl+4`)
- **Tools to Enable**: **✅ ALL TOOLS** (Enable every available tool)
- **Advanced Options**: Paste **the entire content** from:
  ```
  custom_modes/implement_instructions.md
  ```

**Purpose**: IMPLEMENT mode executes the plan, writes code systematically, runs tests, and tracks progress.

---

### Mode 5: 🔍 REFLECT & ARCHIVE (Review & Documentation)

**Configuration:**
- **Name**: `🔍 REFLECT` or `REFLECT & ARCHIVE`
- **Icon**: Choose any icon
- **Shortcut**: Optional (e.g., `Cmd+5` or `Ctrl+5`)
- **Tools to Enable**:
  - ✅ Codebase Search
  - ✅ Read File
  - ✅ Terminal
  - ✅ List Directory
- **Advanced Options**: Paste **the entire content** from:
  ```
  custom_modes/reflect_archive_instructions.md
  ```

**Purpose**: Combined REFLECT and ARCHIVE mode reviews work, documents lessons learned, and creates comprehensive documentation. This combines two modes to optimize for Cursor's character limits.

---

### Important Notes on Mode Setup

1. **Complete Content**: Make sure you paste the **ENTIRE** content from each instruction file. Partial content will cause modes to malfunction.

2. **Advanced Options**: The instruction content MUST go in the "Advanced options" text box, NOT in any other field.

3. **Character Limits**: Cursor has character limits for custom mode instructions. The provided files are optimized to fit, but if you get an error:
   - Verify you're using the latest version from the repository
   - Try removing example sections if absolutely necessary
   - Keep core workflow instructions intact

4. **Tool Selection**: Pay attention to which tools each mode needs. VAN and CREATIVE need "Fetch Rules", while IMPLEMENT needs ALL tools.

5. **Testing Modes**: After creating each mode, test it by switching to it and typing the mode name (e.g., switch to VAN mode and type "VAN").

### Quick Reference: Mode Commands

Once configured, you can use these commands:

```
VAN         - Initialize project and determine complexity
PLAN        - Create detailed implementation plan
CREATIVE    - Explore design options for complex components
IMPLEMENT   - Systematically build planned components
REFLECT     - Review and document lessons learned
ARCHIVE     - Create comprehensive documentation
QA          - Validate technical implementation (can be called from any mode)
```

---

## Understanding the System

### System Architecture Overview

The Memory Bank system consists of three key layers:

1. **Rule System** (`.cursor/rules/isolation_rules/`)
   - **Hierarchical Isolation Rules**: Organized by complexity level
   - **Lazy Loading**: Only loads rules needed for current task complexity
   - **Token Optimization**: Reduces token usage by 60-80%
   - **Platform Awareness**: Adapts commands to your OS (macOS/Linux/Windows)
   - **Visual Process Maps**: Clear workflow visualizations

2. **Mode Instructions** (`custom_modes/`)
   - Detailed instructions for each development phase
   - Loaded into Cursor's custom modes
   - Guides AI behavior through the development workflow
   - Mode-specific tool access and responsibilities

3. **Memory Bank Context** (`memory-bank/`)
   - Your project-specific development information
   - Single source of truth (tasks.md)
   - Progressive documentation that scales with complexity
   - Created automatically during first use

### Hierarchical Rule Architecture

The isolation rules system is the core innovation of Memory Bank v0.7-beta:

```
.cursor/rules/isolation_rules/
├── main.mdc                    # Entry point, loaded first
├── Core/                       # Core optimization rules (always loaded)
│   ├── core_memory_rules.mdc   # Memory management
│   └── core_workflow.mdc       # Workflow rules
├── Level1/                     # Quick fixes (< 2 hours)
│   └── level1_rules.mdc
├── Level2/                     # Enhancements (< 1 day)
│   └── level2_rules.mdc
├── Level3/                     # Features (< 1 week)
│   └── level3_rules.mdc
├── Level4/                     # Complex systems (> 1 week)
│   └── level4_rules.mdc
├── Phases/                     # Creative phase guidelines
│   └── creative_phase.mdc
└── visual-maps/                # Process visualizations
    ├── level1_map.mdc
    ├── level2_map.mdc
    ├── level3_map.mdc
    └── level4_map.mdc
```

**Key Benefits:**
- Rules are loaded only when needed for specific complexity level
- Dramatically reduces token consumption
- Maintains full functionality
- Scales from simple fixes to complex systems

### Mode Workflow

```
┌──────────────┐
│     VAN      │  Analyze project structure
│  🔍 Entry    │  Determine task complexity
└──────┬───────┘  Create initial tasks.md
       │
       ├─ Level 1 (Simple) ──────────────┐
       │                                  │
       ├─ Level 2-3 ───┐                 │
       │                ▼                 │
       │          ┌───────────┐          │
       │          │   PLAN    │          │
       │          │ 📋 Struct │          │
       │          └─────┬─────┘          │
       │                │                 │
       │  Level 3-4 ────┼─────┐          │
       │                │     ▼          │
       │                │  ┌──────────┐  │
       │                │  │ CREATIVE │  │
       │                │  │ 🎨 Design│  │
       │                │  └────┬─────┘  │
       │                │       │        │
       └────────────────┴───────┴────────┘
                        │
                        ▼
                 ┌─────────────┐
                 │  IMPLEMENT  │  Write code
                 │ ⚒️  Build   │  Run tests
                 └──────┬──────┘  Track progress
                        │
                        ▼
                 ┌─────────────┐
                 │   REFLECT   │  Review work
                 │ 🔍 Review   │  Document learnings
                 └──────┬──────┘  Capture insights
                        │
                        ├─ Simple tasks: Done
                        │
                        ├─ Complex tasks ▼
                        │      ┌─────────────┐
                        └─────→│   ARCHIVE   │
                               │ 📚 Document │
                               └─────────────┘
```

### Task Complexity Levels

| Level | Description | Time Estimate | Workflow | Creative Phase |
|-------|-------------|---------------|----------|----------------|
| **Level 1** | Quick Fix | < 2 hours | VAN → IMPLEMENT → REFLECT | Optional |
| **Level 2** | Enhancement | < 1 day | VAN → PLAN → IMPLEMENT → REFLECT | Optional |
| **Level 3** | Feature | < 1 week | VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT → ARCHIVE | Recommended |
| **Level 4** | Complex System | > 1 week | VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT → ARCHIVE | Required |

### Core Memory Bank Files

| File | Purpose | Created By | Update Frequency |
|------|---------|-----------|------------------|
| `tasks.md` | **Single source of truth** | VAN mode | Constantly during development |
| `activeContext.md` | Current focus and mode | Mode transitions | Every mode switch |
| `progress.md` | Implementation status | IMPLEMENT mode | During implementation |
| `creative-*.md` | Design decisions | CREATIVE mode | When design choices made |
| `reflect-*.md` | Review and learnings | REFLECT mode | After task completion |

---

## Getting Started

### Verification Checklist

Before your first use, verify the installation:

```bash
# ✅ Check .cursor/rules/isolation_rules directory exists
ls -la .cursor/rules/isolation_rules/

# ✅ Verify main.mdc exists
cat .cursor/rules/isolation_rules/main.mdc | head -20

# ✅ Check custom_modes directory exists
ls -la custom_modes/

# ✅ Verify all mode instruction files exist
ls custom_modes/
# Should show: van_instructions.md, plan_instructions.md, creative_instructions.md,
#              implement_instructions.md, reflect_archive_instructions.md

# ✅ Verify custom modes are configured in Cursor
# Open Cursor, click mode selector, verify your modes appear
```

### First Usage: The VAN Command

1. **Switch to VAN Mode**
   - Open Cursor chat panel
   - Click mode selector dropdown
   - Select "🔍 VAN"

2. **Type: VAN**
   - Just type the word "VAN" and press Enter
   - VAN mode will:
     - Analyze your project structure
     - Fetch and load appropriate isolation rules
     - Determine task complexity
     - Create `memory-bank/tasks.md` (if it doesn't exist)
     - Ask about your development task

3. **Describe Your Task**
   - VAN will ask what you want to build/implement
   - Provide a clear description of your task
   - VAN will assess complexity (Level 1-4)
   - VAN will recommend the appropriate workflow

4. **Follow the Workflow**
   - VAN will tell you which mode to switch to next
   - Switch modes as directed (usually PLAN or IMPLEMENT)
   - Continue through the development workflow

### Example First Session

```
You: [Switch to VAN mode] → Type: VAN

AI: ## VAN MODE ACTIVATED ✅
    Project: Java/Maven/Spring Boot
    Memory Bank Status: Initialized → Created tasks.md
    What would you like to build?
    
You: Add user authentication with JWT tokens

AI: ## TASK ANALYSIS ✅
    Task: JWT Authentication System
    Complexity: Level 3 (Feature) | Est: 4-5 days
    Workflow: VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT → ARCHIVE
    Next: Switch to PLAN mode

You: [Switch to PLAN] → Type: PLAN

AI: ## IMPLEMENTATION PLAN ✅
    Phase 1: Core JWT Service
    Phase 2: Authentication Controller  
    Phase 3: Security Configuration
    Phase 4: Testing & Documentation
    Next: Switch to CREATIVE mode for design decisions
```

---

## Troubleshooting

| Problem | Quick Fix |
|---------|-----------|
| **Modes not responding correctly** | Verify complete content pasted in "Advanced Options"; restart Cursor; check tools enabled |
| **Rules not loading** | Verify `.cursor/rules/isolation_rules/` exists; ensure "Fetch Rules" tool enabled in VAN/CREATIVE |
| **Custom modes not appearing** | Enable in Settings → Features → Chat → Custom modes; restart Cursor; check version 0.48+ |
| **Character limit exceeded** | Use latest v0.7-beta files (optimized); remove example sections if needed; REFLECT+ARCHIVE already combined |
| **Files not created** | VAN creates automatically; manually run `mkdir -p memory-bank` and retry if needed |
| **Lost context** | Always read `memory-bank/tasks.md` first; use VAN mode to re-establish context |
| **Platform commands fail** | Rules auto-detect OS; explicitly mention your OS if issues persist; Windows users use PowerShell/Git Bash |
| **Token limits/slow loading** | VAN loads only rules for your level; verify `main.mdc` references correct; re-clone if v0.7-beta issues |

**Need more help?** Check [GitHub Issues](https://github.com/vanzan01/cursor-memory-bank/issues) or [Memory Bank Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md)

---

## Advanced Features

### Hierarchical Isolation Rules System

The core innovation of Memory Bank v0.7-beta is its **hierarchical isolation rules** with lazy loading:

**How It Works:**
```
User Types "VAN" 
    ↓
VAN Mode Loads: main.mdc + Core/ rules
    ↓
VAN Determines Task Complexity (Level 1-4)
    ↓
Only Level-Specific Rules Are Loaded
    ↓
Token Usage Reduced by 60-80%
```

**Rule Loading Strategy:**
- **Always Loaded**: `main.mdc`, `Core/core_memory_rules.mdc`, `Core/core_workflow.mdc`
- **Level 1 Tasks**: Load `Level1/level1_rules.mdc` + visual map
- **Level 2 Tasks**: Load `Level2/level2_rules.mdc` + visual map
- **Level 3 Tasks**: Load `Level3/level3_rules.mdc` + visual map + `Phases/creative_phase.mdc`
- **Level 4 Tasks**: Load `Level4/level4_rules.mdc` + visual map + `Phases/creative_phase.mdc`

This prevents loading Level 4 rules when working on simple Level 1 fixes.

**Learn More**: See [MEMORY_BANK_OPTIMIZATIONS.md](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md) for detailed architecture and token savings analysis.

### Progressive Documentation & Visual Maps

Documentation scales with complexity: Level 1 (minimal), Level 2 (structured), Level 3-4 (comprehensive with creative-*.md and archive). Visual process maps in `.cursor/rules/isolation_rules/visual-maps/` provide step-by-step guides loaded contextually per level.

### Platform-Aware Commands

Auto-detects OS (macOS/Linux/Windows) and adapts file operations and paths. VAN mode handles this automatically.

### CREATIVE Mode & QA Validation

**CREATIVE Mode** (Level 3-4): Explores design alternatives, documents architectural decisions, creates reusable patterns in creative-*.md files. Works best with Claude 4 models for extended reasoning. [Details](https://github.com/vanzan01/cursor-memory-bank/blob/main/creative_mode_think_tool.md)

**QA Validation**: Type "QA" in any mode for code quality, test, security, and performance checks.

### Customizing & Team Usage

**Project Rules**: Add `.cursor/rules/project-standards.mdc` with your coding standards. VAN loads these automatically.

**Custom Tracking**: Create additional files in `memory-bank/` (e.g., `security-considerations.md`).

**Version Control**: Commit `tasks.md`, `creative-*.md`, `reflect-*.md` to git; ignore `activeContext.md`, `progress.md`.

**Team Collaboration**: All team members use same modes; shared tasks.md provides context; creative/reflect docs capture decisions and learnings.

---

## Best Practices

### Core Principles

1. **Always Start with VAN**
   - VAN mode analyzes your project and determines complexity
   - Proper complexity assessment prevents wasted effort
   - Creates initial tasks.md with clear roadmap
   - Loads only the rules you need for your specific task level

2. **Keep tasks.md as Single Source of Truth**
   - Update after every significant progress
   - Use it as your development dashboard
   - Should always reflect current project state
   - Other modes reference this file for context

3. **Follow Recommended Workflows**
   - Don't skip modes for higher complexity levels
   - **Level 1**: VAN → IMPLEMENT → REFLECT
   - **Level 2**: VAN → PLAN → IMPLEMENT → REFLECT
   - **Level 3-4**: VAN → PLAN → CREATIVE → IMPLEMENT → REFLECT → ARCHIVE
   - Each mode builds on previous mode's output

4. **Use CREATIVE Mode for Complex Decisions**
   - Level 3-4 tasks benefit greatly from CREATIVE mode
   - Explore multiple design alternatives before implementing
   - Document architectural decisions in creative-*.md files
   - These documents become valuable team resources

5. **Track Progress in IMPLEMENT Mode**
   - Update progress.md regularly during implementation
   - Break large tasks into smaller checkpoints
   - Celebrate incremental progress
   - Easy to resume if interrupted

6. **Reflect and Learn**
   - Always complete REFLECT mode, even for simple tasks
   - Document what worked and what didn't
   - Build knowledge base of patterns and anti-patterns
   - Level 3-4 tasks should also use ARCHIVE mode

### File Update Reference

| Mode | Updates |
|------|---------|
| **VAN** | Create/update `tasks.md`; set `activeContext.md`; load rules for complexity level |
| **PLAN** | Update `tasks.md` with detailed plan; update `activeContext.md`; break down subtasks |
| **CREATIVE** | Create `creative-[topic]-[date].md`; update `tasks.md` & `activeContext.md` with design choices |
| **IMPLEMENT** | Update `progress.md` constantly; mark subtasks in `tasks.md`; create code files |
| **REFLECT** | Create `reflect-[topic]-[date].md`; update `tasks.md` complete status; reset `activeContext.md` |
| **ARCHIVE** | Create comprehensive docs; consolidate learnings; document patterns (Level 3-4) |

### Common Workflows

| Workflow | Steps |
|----------|-------|
| **Starting Your Day** | Read `tasks.md` → Check `activeContext.md` → Review `progress.md` → Continue |
| **Switching Tasks** | Complete REFLECT → Mark in `tasks.md` → Start new with VAN |
| **Handling Interruptions** | Update `progress.md` before stopping → Resume by reading `tasks.md` + `progress.md` |
| **Design Changes** | Use CREATIVE mode → Document in `creative-*.md` → Update `tasks.md` → Continue IMPLEMENT |
| **Team Collaboration** | Commit `tasks.md`, `creative-*.md`, `reflect-*.md` to git; team uses shared context |

**Version Control**: Exclude `activeContext.md`, `progress.md`; include `tasks.md`, `creative-*.md`, `reflect-*.md`

**Performance Tips**: Let VAN load rules for your level; stay in appropriate mode; update progressively; use QA anytime

---

## Summary

The Memory Bank system provides:

✅ **Persistent context** across development sessions  
✅ **Hierarchical isolation rules** with intelligent lazy loading  
✅ **Single source of truth** (tasks.md) for all project state  
✅ **Progressive documentation** that scales with task complexity  
✅ **Mode-based development** for structured workflow (VAN, PLAN, CREATIVE, IMPLEMENT, REFLECT, ARCHIVE)  
✅ **Visual process maps** for clear workflow visualization  
✅ **Token optimization** reducing usage by 60-80%  
✅ **Platform-aware commands** adapting to your operating system  

**Getting Started**:
1. Clone the repository and copy `.cursor` and `custom_modes` to your project
2. Verify isolation rules are in place (`.cursor/rules/isolation_rules/`)
3. Configure 5-6 custom modes in Cursor (VAN, PLAN, CREATIVE, IMPLEMENT, REFLECT & ARCHIVE) - **CRITICAL STEP**
4. Type "VAN" in VAN mode to initialize your first task
5. Follow the mode-based workflow recommended by VAN

**Core Philosophy**:
- **Analyze complexity first** (VAN determines Level 1-4)
- **Plan systematically** (PLAN breaks down tasks)
- **Design thoughtfully** (CREATIVE explores alternatives for Level 3-4)
- **Implement progressively** (IMPLEMENT tracks progress)
- **Reflect and learn** (REFLECT captures insights)
- **Archive knowledge** (ARCHIVE documents patterns for Level 3-4)

The system scales from simple quick fixes (Level 1, < 2 hours) to complex systems (Level 4, > 1 week) while maintaining context, enforcing disciplined development practices, and minimizing token usage.

---

**Version**: v0.7-beta  
**Repository**: [vanzan01/cursor-memory-bank](https://github.com/vanzan01/cursor-memory-bank)  
**Creator**: [@vanzan01](https://github.com/vanzan01)  
**Community**: 2,800+ stars ⭐, 400+ forks, active contributors  
**Last Updated**: 2025-05-07  

---

## Additional Resources

**Documentation**: [Optimizations](https://github.com/vanzan01/cursor-memory-bank/blob/main/MEMORY_BANK_OPTIMIZATIONS.md) | [Release Notes](https://github.com/vanzan01/cursor-memory-bank/blob/main/RELEASE_NOTES.md) | [Upgrade Guide](https://github.com/vanzan01/cursor-memory-bank/blob/main/memory_bank_upgrade_guide.md) | [CREATIVE Mode](https://github.com/vanzan01/cursor-memory-bank/blob/main/creative_mode_think_tool.md)

**Community**: [GitHub](https://github.com/vanzan01/cursor-memory-bank) • 2,800+ ⭐ • 400+ forks • [Issues](https://github.com/vanzan01/cursor-memory-bank/issues)

**Version**: v0.7-beta (May 2025) - Hierarchical isolation rules, 60-80% token reduction, combined REFLECT & ARCHIVE

