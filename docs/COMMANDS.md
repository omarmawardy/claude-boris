# Slash Commands Reference

All available slash commands in Claude Boris.

## Core Commands

### `/boris`

The master orchestrator. Use for any complex task.

```
/boris <describe what you want to accomplish>
```

**Examples:**

```
/boris Add user authentication with OAuth
/boris Refactor the payment module for better testability
/boris Fix the bug where users can't upload images
```

**What it does:**

1. Creates a detailed plan
2. Gets your approval
3. Delegates to specialist agents
4. Coordinates verification
5. Ships the result

---

### `/commit-push-pr`

Complete git workflow in one command.

```
/commit-push-pr
```

**What it does:**

1. Stages all changes
2. Creates conventional commit message
3. Pushes to remote
4. Opens a pull request with description

---

### `/test-and-fix`

Run tests and fix failures iteratively.

```
/test-and-fix
```

**What it does:**

1. Runs test suite
2. Analyzes failures
3. Fixes issues
4. Re-runs tests
5. Iterates until passing

---

### `/verify-all`

Complete verification suite.

```
/verify-all
```

**What it does:**

1. Runs tests
2. Checks TypeScript
3. Runs linter
4. Verifies build
5. Reports comprehensive status

---

### `/review-changes`

Review uncommitted changes before committing.

```
/review-changes
```

**What it does:**

1. Shows current diff
2. Checks for bugs
3. Checks security concerns
4. Suggests improvements
5. Gives commit recommendation

---

## Utility Commands

### `/quick-commit`

Fast commit without PR.

```
/quick-commit
```

Stages and commits with good message. Does not push or create PR.

---

### `/first-principles`

Break down complex problems.

```
/first-principles <problem description>
```

Analyzes problems by:

1. Identifying assumptions
2. Finding fundamental truths
3. Rebuilding solution from scratch

---

### `/update-claude-md`

Learn from recent work.

```
/update-claude-md
```

Reviews session for:

- Mistakes to document
- Patterns to remember
- Commands to update

---

### `/fix-issue`

Fix a GitHub issue end-to-end.

```
/fix-issue <issue number>
/fix-issue 42
```

**What it does:**

1. Fetches issue details
2. Analyzes the problem
3. Plans the fix
4. Implements solution
5. Creates PR referencing issue

---

### `/session-start`

Start a coding session.

```
/session-start
```

Loads context:

- Project status
- Git state
- CLAUDE.md reminders
- Open issues

---

### `/session-end`

End a coding session.

```
/session-end
```

Wraps up:

- Commits/stashes work
- Updates CLAUDE.md
- Pushes changes
- Provides summary

---

## Creating Custom Commands

Add files to `.claude/commands/`:

```markdown
---
description: What the command does
---

Your instructions here.

Use inline bash for context:
!`git status`
!`npm test`

Reference arguments with $ARGUMENTS
```

**Tips:**

- Keep descriptions under one line
- Use inline bash to pre-compute context
- Be specific about expected output
- Handle error cases
