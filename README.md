<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-Boris_v2.0-blueviolet?style=for-the-badge&logo=anthropic" alt="Boris Mode">
</p>

<h1 align="center">Claude Boris v2.0</h1>

<p align="center">
  <strong>The Ultimate Claude Code Workflow</strong><br>
  Memory Bank | 14 Agents | 18 Commands | 10 Critical Gap Solutions
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a> •
  <a href="#whats-new-in-v2">What's New</a> •
  <a href="#features">Features</a> •
  <a href="#memory-bank">Memory Bank</a> •
  <a href="#commands">Commands</a>
</p>

---

## What is this?

**Claude Boris** is a complete Claude Code configuration that mirrors [Boris Cherny's workflow](https://x.com/bcherny/status/2007179832300581177) - the creator of Claude Code. Version 2.0 adds solutions for the **10 most critical productivity gaps** identified in the Claude Code ecosystem.

```
> /boris Add user authentication with OAuth

Boris: I'll handle this end-to-end. Here's my plan:

1. 📋 Planning - Understanding requirements (code-architect)
2. 🏗️ Implementation - Building the feature
3. 🔒 Security scan - Checking for vulnerabilities (security-auditor)
4. ✅ Verification - Tests, types, lint, build (verify-app)
5. 📝 Documentation - Updating docs (doc-generator)
6. 🚀 Ship it - Commit, push, PR (git-guardian)

Memory Bank will preserve context for next session.

Shall I proceed?
```

## Quick Start

### One-Line Install
```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/claude-boris/main/install.sh | bash
```

### Manual Install
```bash
git clone https://github.com/YOUR_USERNAME/claude-boris.git
cd claude-boris
./install.sh /path/to/your/project
```

### Then
```bash
claude              # Start Claude Code
/memory-init        # Initialize Memory Bank
/boris <your task>  # Let Boris handle it
```

---

## What's New in v2.0

### Memory Bank System
**Persistent context across sessions** - Never re-explain your project again.

```
.claude/memory/
├── projectContext.md    # What this project is
├── activeContext.md     # Current session state
├── progress.md          # Task tracking
├── decisionLog.md       # Architecture decisions
├── conventions.md       # Learned patterns
└── sessionHistory.md    # Session summaries
```

### 6 New Agents for Critical Gaps
| Agent | Gap Solved |
|-------|-----------|
| `memory-bank` | Context loss between sessions |
| `security-auditor` | Security blind spots |
| `git-guardian` | Unsafe git operations |
| `ci-integrator` | Manual CI checking |
| `issue-tracker` | Issue tracker disconnect |
| `mode-controller` | Mode confusion |
| `audit-logger` | Compliance requirements |

### 10 New Commands
| Command | Purpose |
|---------|---------|
| `/session-start` | Load Memory Bank context |
| `/session-end` | Save context for next session |
| `/undo` | Revert last Claude change |
| `/checkpoint` | Create named save point |
| `/rollback` | Restore checkpoint |
| `/mode` | Switch modes (architect/code/debug/review) |
| `/fix-issue` | End-to-end issue resolution |
| `/ci-loop` | Push, wait for CI, fix, iterate |
| `/security-scan` | Vulnerability scanning |
| `/context` | Check context usage |

---

## Features

### 🎯 Boris Orchestrator
One agent to rule them all. Boris coordinates 14 specialist agents.

```bash
/boris <describe what you want>
```

### 📚 Memory Bank
Persistent context that survives session ends.

```bash
/session-start     # Load memory at session start
/session-end       # Save memory at session end
```

### 🔒 Security Scanning
SAST, dependency vulnerabilities, OWASP checks.

```bash
/security-scan     # Run security audit
```

### ↩️ Undo & Checkpoints
Never fear breaking things.

```bash
/checkpoint pre-refactor   # Save state
/rollback pre-refactor     # Restore state
/undo                      # Revert last Claude change
```

### 🔄 CI Integration
Automated feedback loop.

```bash
/ci-loop           # Push, wait, parse, fix, repeat
```

### 🎛️ Mode System
Behavioral guardrails.

```bash
/mode architect    # Read-only, planning only
/mode code         # Full access
/mode debug        # Investigation mode
/mode review       # Read-only review
```

---

## All Commands

| Command | Description |
|---------|-------------|
| `/boris <task>` | Full orchestrated workflow |
| `/session-start` | Load Memory Bank context |
| `/session-end` | Save context for next session |
| `/verify-all` | Run tests, types, lint, build |
| `/test-and-fix` | Fix tests iteratively |
| `/security-scan` | Vulnerability scanning |
| `/commit-push-pr` | Full git workflow with PR |
| `/quick-commit` | Fast local commit |
| `/undo` | Revert last Claude change |
| `/checkpoint [name]` | Create save point |
| `/rollback [target]` | Restore checkpoint |
| `/mode [mode]` | Switch operational modes |
| `/fix-issue <num>` | End-to-end issue resolution |
| `/ci-loop` | Push, wait for CI, fix |
| `/context` | Show context usage |
| `/memory-init` | Initialize Memory Bank |
| `/update-claude-md` | Learn from mistakes |
| `/first-principles` | Break down problems |

---

## All Agents

| Agent | Purpose |
|-------|---------|
| `boris` | Master orchestrator |
| `memory-bank` | Session persistence |
| `security-auditor` | Security scanning |
| `git-guardian` | Safe git operations |
| `ci-integrator` | CI feedback loops |
| `issue-tracker` | GitHub/Linear integration |
| `mode-controller` | Behavioral modes |
| `audit-logger` | Compliance logging |
| `code-architect` | Design decisions |
| `code-simplifier` | Simplify code |
| `test-writer` | Generate tests |
| `verify-app` | End-to-end verification |
| `pr-reviewer` | Code review |
| `doc-generator` | Documentation |

---

## How It Works

```
┌─────────────────────────────────────────────────────────────┐
│                    /boris "Add OAuth"                        │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    BORIS ORCHESTRATOR                        │
│  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐           │
│  │ memory  │ │ security│ │  git    │ │  ci     │           │
│  │ bank    │ │ auditor │ │guardian │ │integrator│           │
│  └─────────┘ └─────────┘ └─────────┘ └─────────┘           │
└─────────────────────────────────────────────────────────────┘
                              │
            ┌─────────────────┼─────────────────┐
            ▼                 ▼                 ▼
    ┌──────────────┐  ┌──────────────┐  ┌──────────────┐
    │code-architect│  │ test-writer  │  │ verify-app   │
    └──────────────┘  └──────────────┘  └──────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    VERIFICATION LOOP                         │
│            Tests ✅ Types ✅ Lint ✅ Build ✅               │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    /commit-push-pr                           │
│              + Memory Bank saves context                     │
└─────────────────────────────────────────────────────────────┘
```

---

## The 10 Gaps Solved

| # | Gap | Solution |
|---|-----|----------|
| 1 | Context loss between sessions | Memory Bank system |
| 2 | Mode confusion | Mode controller with restrictions |
| 3 | Unsafe git operations | Git Guardian with undo/checkpoints |
| 4 | Manual CI checking | CI Integrator with auto-fix loop |
| 5 | Issue tracker disconnect | Native GitHub integration |
| 6 | Security blind spots | Security Auditor (SAST/OWASP) |
| 7 | No rollback capability | Checkpoint/rollback system |
| 8 | Manual test iteration | Test-and-fix loop |
| 9 | Compliance requirements | Audit Logger (SOC 2/ISO 27001) |
| 10 | Context window limits | Memory Bank + proactive compaction |

---

## Philosophy

Based on Boris Cherny's practices:

1. **Plan First** - Use Plan mode, iterate before executing
2. **Verification Loop** - Tests, types, lint, build (2-3x quality)
3. **Living Documentation** - Update CLAUDE.md from mistakes
4. **Delegate to Specialists** - Focused agents for focused tasks
5. **Automate Inner Loops** - Commands encode workflows

---

## Configuration

### Permissions
Pre-configured safe defaults in `.claude/settings.json`:
- **Allowed**: git, gh, npm, file operations
- **Denied**: destructive commands, secrets, force push

### Hooks
- **PostToolUse**: Auto-format with Prettier
- **PreToolUse**: Audit logging

### Customize
Create `.claude/settings.local.json` for personal overrides.

---

## Requirements

- Claude Code CLI
- Node.js (for npm commands)
- Git
- GitHub CLI `gh` (for issue/PR integration)

---

## Credits

- **[@llcoolblaze](https://x.com/llcoolblaze)** - Creator of Claude Boris, Co-Founder of [@wrthapp](https://x.com/wrthapp)
- **Boris Cherny** - Creator of Claude Code, whose workflow inspired this project
- **Anthropic** - For building Claude Code
- **The Community** - For sharing configurations and best practices

---

## License

MIT

---

<p align="center">
  <strong>Stop configuring. Start shipping.</strong>
</p>

<p align="center">
  Made with Claude Code by <a href="https://x.com/llcoolblaze">@llcoolblaze</a> | Co-Founder of <a href="https://x.com/wrthapp">@wrthapp</a>
</p>

<p align="center">
  <a href="https://github.com/llcoolblaze/claude-boris">⭐ Star</a> •
  <a href="https://github.com/llcoolblaze/claude-boris/fork">🍴 Fork</a> •
  <a href="https://twitter.com/intent/tweet?text=Claude%20Boris%20v2.0%20-%20The%20Ultimate%20Claude%20Code%20Workflow%20by%20@llcoolblaze&url=https://github.com/llcoolblaze/claude-boris">🐦 Tweet</a>
</p>
