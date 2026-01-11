#!/bin/bash
#
# Claude Boris v2.0.0 - The Ultimate Claude Code Workflow
# Complete Installation Script with Memory Bank & Gap Solutions
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/claude-boris/main/install.sh | bash
#   OR
#   ./install.sh [target-directory]
#
# Features installed:
#   - 14 specialist agents
#   - 18 slash commands
#   - Memory Bank system for persistent context
#   - Security scanning & audit logging
#   - CI/CD integration & issue tracking
#   - Mode system for behavioral control
#

set -e

VERSION="2.0.0"
REPO="YOUR_USERNAME/claude-boris"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${PURPLE}"
cat << 'BANNER'
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║   ██████╗  ██████╗ ██████╗ ██╗███████╗    ██╗   ██╗██████╗    ║
║   ██╔══██╗██╔═══██╗██╔══██╗██║██╔════╝    ██║   ██║╚════██╗   ║
║   ██████╔╝██║   ██║██████╔╝██║███████╗    ██║   ██║ █████╔╝   ║
║   ██╔══██╗██║   ██║██╔══██╗██║╚════██║    ╚██╗ ██╔╝██╔═══╝    ║
║   ██████╔╝╚██████╔╝██║  ██║██║███████║     ╚████╔╝ ███████╗   ║
║   ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝      ╚═══╝  ╚══════╝   ║
║                                                               ║
║          The Ultimate Claude Code Workflow v2.0.0             ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
BANNER
echo -e "${NC}"

TARGET_DIR="${1:-.}"
cd "$TARGET_DIR"
TARGET_DIR=$(pwd)

echo -e "${BLUE}Installing to: ${TARGET_DIR}${NC}"
echo ""

# Check for existing installation
if [ -d ".claude" ]; then
    echo -e "${YELLOW}Existing .claude directory found. Merging...${NC}"
fi

# Create structure
mkdir -p .claude/agents .claude/commands .claude/memory .claude/memory/archive .claude/audit .claude/skills

echo -e "${GREEN}Installing 14 agents...${NC}"

# ============================================================================
# AGENTS (abbreviated - full content in actual files)
# ============================================================================

cat > .claude/agents/boris.md << 'EOF'
---
name: boris
description: Master orchestrator that coordinates the entire Claude Code workflow. Plans, delegates to specialists, verifies, and ships.
tools: Read, Edit, Write, Bash, Grep, Glob, Task
---

# Boris - Master Orchestrator

Coordinate all aspects of development by delegating to specialist agents.

## Protocol
1. Understand - Parse intent
2. Plan - Create plan with steps
3. Get Approval - User confirms
4. Execute - Delegate to specialists
5. Verify - All checks must pass
6. Ship - Commit, PR, update docs

## Specialists
memory-bank, security-auditor, git-guardian, ci-integrator, issue-tracker,
code-architect, code-simplifier, test-writer, verify-app, pr-reviewer,
doc-generator, mode-controller, audit-logger, oncall-guide
EOF

cat > .claude/agents/memory-bank.md << 'EOF'
---
name: memory-bank
description: Persistent memory for cross-session context. Maintains project understanding, decisions, and patterns.
tools: Read, Write, Edit, Grep, Glob
---

# Memory Bank Agent

Files in .claude/memory/:
- projectContext.md - Permanent project info
- activeContext.md - Current session state
- progress.md - Task tracking
- decisionLog.md - Architecture decisions
- conventions.md - Learned patterns
- sessionHistory.md - Session summaries

Session Start: Load and synthesize context
Session End: Save session summary to all files
EOF

cat > .claude/agents/security-auditor.md << 'EOF'
---
name: security-auditor
description: Security scanning - SAST, dependency vulnerabilities, secrets detection, OWASP checks.
tools: Read, Bash, Grep, Glob
---

# Security Auditor

Scans: npm audit, secrets, SQL injection, XSS, OWASP Top 10
Output: Critical/High/Medium/Low with remediation
EOF

cat > .claude/agents/git-guardian.md << 'EOF'
---
name: git-guardian
description: Safe git operations - auto-commit, undo, checkpoints, dirty file protection.
tools: Read, Write, Edit, Bash, Grep, Glob
---

# Git Guardian

Features: Auto-commit, dirty file protection, undo capability, checkpoints, attribution
EOF

cat > .claude/agents/ci-integrator.md << 'EOF'
---
name: ci-integrator
description: CI/CD feedback loops - push, monitor, parse failures, auto-fix, iterate.
tools: Read, Write, Edit, Bash, Grep, Glob
---

# CI Integrator

Loop: Push → Wait → Parse → Fix → Commit → Repeat (max 5x)
EOF

cat > .claude/agents/issue-tracker.md << 'EOF'
---
name: issue-tracker
description: GitHub/Linear/Jira integration - fetch issues, parse requirements, link commits.
tools: Read, Write, Edit, Bash, Grep, Glob
---

# Issue Tracker

Uses gh CLI for GitHub issues. Creates branches, links commits, updates status.
EOF

cat > .claude/agents/mode-controller.md << 'EOF'
---
name: mode-controller
description: Mode system - Architect/Code/Debug/Review/Audit with different tool restrictions.
tools: Read, Write, Edit, Bash, Grep, Glob, Task
---

# Mode Controller

Modes: architect (read-only), code (full), debug (investigate), review (read-only), audit (logged)
EOF

cat > .claude/agents/audit-logger.md << 'EOF'
---
name: audit-logger
description: Enterprise audit logging for SOC 2, ISO 27001, HIPAA compliance.
tools: Read, Write, Edit, Bash, Grep, Glob
---

# Audit Logger

Logs: sessions, file ops, commands, agents. Supports compliance reports.
EOF

cat > .claude/agents/code-architect.md << 'EOF'
---
name: code-architect
description: Design reviews and architectural decisions.
tools: Read, Grep, Glob, Bash
---
EOF

cat > .claude/agents/code-simplifier.md << 'EOF'
---
name: code-simplifier
description: Simplify code without changing functionality.
tools: Read, Edit, Grep, Glob, Bash
---
EOF

cat > .claude/agents/test-writer.md << 'EOF'
---
name: test-writer
description: Generate comprehensive tests.
tools: Read, Write, Edit, Grep, Glob, Bash
---
EOF

cat > .claude/agents/verify-app.md << 'EOF'
---
name: verify-app
description: End-to-end verification before shipping.
tools: Read, Bash, Grep, Glob
---
EOF

cat > .claude/agents/pr-reviewer.md << 'EOF'
---
name: pr-reviewer
description: Automated code review for PRs.
tools: Read, Bash, Grep, Glob
---
EOF

cat > .claude/agents/doc-generator.md << 'EOF'
---
name: doc-generator
description: Generate and update documentation.
tools: Read, Write, Edit, Grep, Glob, Bash
---
EOF

cat > .claude/agents/oncall-guide.md << 'EOF'
---
name: oncall-guide
description: Debug production issues.
tools: Read, Bash, Grep, Glob, Edit
---
EOF

echo -e "${GREEN}Installing 18 commands...${NC}"

# ============================================================================
# COMMANDS
# ============================================================================

cat > .claude/commands/boris.md << 'EOF'
---
description: Master orchestrator for any development task
---
# Task: $ARGUMENTS
!`git status --short 2>/dev/null`
Follow Boris protocol: Understand → Plan → Approve → Execute → Verify → Ship
EOF

cat > .claude/commands/session-start.md << 'EOF'
---
description: Load Memory Bank and orient to project
---
!`cat .claude/memory/projectContext.md 2>/dev/null | head -30 || echo "Run /memory-init"`
!`cat .claude/memory/activeContext.md 2>/dev/null | head -20`
!`cat .claude/memory/sessionHistory.md 2>/dev/null | head -30`
!`git status --short 2>/dev/null`
Synthesize context and ask what to work on.
EOF

cat > .claude/commands/session-end.md << 'EOF'
---
description: Save Memory Bank state for next session
---
!`git status --short 2>/dev/null`
!`git log --oneline --since="8 hours ago" 2>/dev/null | head -10`
Handle uncommitted work, update Memory Bank files, report what was saved.
EOF

cat > .claude/commands/verify-all.md << 'EOF'
---
description: Run tests, types, lint, build
---
!`npm test 2>&1 | tail -20 || echo "TESTS: CHECK"`
!`npm run typecheck 2>&1 || echo "TYPES: FAILED"`
!`npm run lint 2>&1 | tail -10 || echo "LINT: FAILED"`
!`npm run build 2>&1 | tail -10 || echo "BUILD: FAILED"`
EOF

cat > .claude/commands/commit-push-pr.md << 'EOF'
---
description: Full git workflow with PR
---
!`git status --short`
!`git diff --stat`
Stage, commit (conventional), push, create PR.
EOF

cat > .claude/commands/test-and-fix.md << 'EOF'
---
description: Fix failing tests iteratively
---
!`npm test 2>&1 || true`
Fix in order: Types > Tests > Lint. Iterate until passing.
EOF

cat > .claude/commands/quick-commit.md << 'EOF'
---
description: Fast local commit
---
!`git status --short`
Stage all, commit with conventional message.
EOF

cat > .claude/commands/undo.md << 'EOF'
---
description: Revert last Claude change
---
!`git log -3 --oneline`
If last commit by Claude, reset --soft HEAD^.
EOF

cat > .claude/commands/checkpoint.md << 'EOF'
---
description: Create named save point
---
Name: $ARGUMENTS
Create stash/tag checkpoint for /rollback.
EOF

cat > .claude/commands/rollback.md << 'EOF'
---
description: Restore checkpoint or N commits
---
Target: $ARGUMENTS
Restore from stash, tag, or commit count.
EOF

cat > .claude/commands/mode.md << 'EOF'
---
description: Switch modes (architect/code/debug/review/audit)
---
Mode: $ARGUMENTS
Switch mode and announce restrictions.
EOF

cat > .claude/commands/fix-issue.md << 'EOF'
---
description: End-to-end issue resolution
---
!`gh issue view $ARGUMENTS 2>/dev/null || echo "Provide issue number"`
Parse, branch, implement, verify, PR.
EOF

cat > .claude/commands/ci-loop.md << 'EOF'
---
description: Push, wait for CI, fix, iterate
---
!`git branch --show-current`
Push, watch CI, parse failures, auto-fix (max 5x).
EOF

cat > .claude/commands/security-scan.md << 'EOF'
---
description: Security vulnerability scan
---
!`npm audit 2>/dev/null | head -20`
Run security checks, report findings.
EOF

cat > .claude/commands/context.md << 'EOF'
---
description: Show context and Memory Bank status
---
!`ls -la .claude/memory/ 2>/dev/null`
Report context health.
EOF

cat > .claude/commands/memory-init.md << 'EOF'
---
description: Initialize Memory Bank
---
Create memory structure and populate from project.
EOF

cat > .claude/commands/update-claude-md.md << 'EOF'
---
description: Update CLAUDE.md with learnings
---
!`cat CLAUDE.md 2>/dev/null | head -30`
Add mistakes to avoid, new patterns learned.
EOF

cat > .claude/commands/first-principles.md << 'EOF'
---
description: Break down complex problems
---
Problem: $ARGUMENTS
Define, decompose, question assumptions, build solution.
EOF

cat > .claude/commands/review-changes.md << 'EOF'
---
description: Code review before commit
---
!`git diff`
Review for issues, suggest improvements.
EOF

echo -e "${GREEN}Creating Memory Bank...${NC}"

# ============================================================================
# MEMORY BANK
# ============================================================================

cat > .claude/memory/projectContext.md << 'EOF'
# Project Context
**Name**: [Project Name]
**Purpose**: [What this does]
## Tech Stack
| Layer | Technology |
|-------|------------|
| | |
EOF

cat > .claude/memory/activeContext.md << 'EOF'
# Active Context
**Working On**: [Current task]
**Branch**: [Git branch]
EOF

cat > .claude/memory/progress.md << 'EOF'
# Progress Tracker
## In Progress
| Task | Progress |
|------|----------|
| Setup | 100% |
EOF

cat > .claude/memory/decisionLog.md << 'EOF'
# Decision Log
<!-- Add architectural decisions here -->
EOF

cat > .claude/memory/conventions.md << 'EOF'
# Conventions
<!-- Add learned patterns here -->
EOF

cat > .claude/memory/sessionHistory.md << 'EOF'
# Session History
## $(date +%Y-%m-%d) - Initial Setup
- Installed Claude Boris v2.0.0
EOF

echo -e "${GREEN}Configuring settings...${NC}"

# ============================================================================
# SETTINGS
# ============================================================================

cat > .claude/settings.json << 'EOF'
{
  "permissions": {
    "allow": [
      "Bash(git *)", "Bash(gh *)", "Bash(npm *)", "Bash(npx *)",
      "Bash(node *)", "Bash(cat *)", "Bash(ls *)", "Bash(grep *)",
      "Bash(find *)", "Bash(curl *)", "Bash(mkdir *)", "Bash(jq *)",
      "Read(*)", "Edit(*)", "Write(*)", "Glob(*)", "Grep(*)", "Task(*)"
    ],
    "deny": [
      "Bash(rm -rf /)", "Bash(sudo rm *)", "Bash(chmod 777 *)",
      "Bash(git push --force origin main)", "Read(.env)", "Read(**/*.key)"
    ]
  },
  "hooks": {
    "PostToolUse": [{
      "matcher": {"tool": ["Edit", "Write"]},
      "hooks": [{"type": "command", "command": "npx prettier --write \"$CLAUDE_FILE_PATH\" 2>/dev/null || true"}]
    }],
    "PreToolUse": [{
      "matcher": {"tool": ["Bash"]},
      "hooks": [{"type": "command", "command": "mkdir -p .claude/audit && echo \"$(date -u +%FT%TZ) $CLAUDE_TOOL_INPUT\" >> .claude/audit/commands.log 2>/dev/null || true"}]
    }]
  },
  "env": {"CLAUDE_BORIS_VERSION": "2.0.0"}
}
EOF

# ============================================================================
# CLAUDE.md
# ============================================================================

if [ ! -f "CLAUDE.md" ]; then
    echo -e "${GREEN}Creating CLAUDE.md...${NC}"
    cat > CLAUDE.md << 'EOF'
# CLAUDE.md

## Quick Reference
```bash
/boris <task>        # Full workflow
/session-start       # Load context
/session-end         # Save context
/verify-all          # Run checks
/commit-push-pr      # Git workflow
/undo                # Revert change
/checkpoint [name]   # Save point
/fix-issue <num>     # Fix issue
```

## Project
**What**: [Description]
**Stack**: [Technologies]

## Commands
| Command | Description |
|---------|-------------|
| npm run dev | Start server |
| npm test | Run tests |

---
## Mistakes to Avoid
<!-- Add entries here -->

## Learned Patterns
<!-- Document patterns -->
EOF
fi

# Gitignore update
if [ -f ".gitignore" ] && ! grep -q ".claude/audit" .gitignore 2>/dev/null; then
    echo -e "\n# Claude Boris\n.claude/audit/\n.claude/settings.local.json" >> .gitignore
fi

echo ""
echo -e "${GREEN}════════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}   Claude Boris v${VERSION} installed!${NC}"
echo -e "${GREEN}════════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}Installed:${NC}"
echo "  • 14 specialist agents"
echo "  • 18 slash commands"
echo "  • Memory Bank system"
echo "  • Audit logging"
echo ""
echo -e "${BLUE}Get started:${NC}"
echo "  1. ${YELLOW}claude${NC}"
echo "  2. ${YELLOW}/memory-init${NC}"
echo "  3. ${YELLOW}/boris <your task>${NC}"
echo ""
echo -e "${PURPLE}Stop configuring. Start shipping.${NC}"
