# Agents Reference

All specialist agents in Claude Boris.

## The Orchestrator

### Boris

**File:** `.claude/agents/boris.md`

The master orchestrator that coordinates everything. Invoked via `/boris` command.

**Specialties:**
- Planning and task breakdown
- Delegating to specialists
- Coordinating verification
- Managing workflows

**When to use:** Any complex, multi-step task.

---

## Specialist Agents

### Code Architect

**File:** `.claude/agents/code-architect.md`

Senior architect for design and system decisions.

**Specialties:**
- Design reviews
- Architecture decisions
- System design
- Technical planning

**When to use:**
- Before major implementations
- When evaluating approaches
- For architectural questions
- During technical planning

---

### Code Simplifier

**File:** `.claude/agents/code-simplifier.md`

Cleans up and simplifies code after implementation.

**Specialties:**
- Reducing complexity
- Improving readability
- Removing duplication
- Modernizing patterns

**When to use:**
- After completing a feature
- Before code review
- When code feels messy
- During refactoring

**Critical rule:** Never changes functionality—only improves code quality.

---

### Test Writer

**File:** `.claude/agents/test-writer.md`

Generates comprehensive tests.

**Specialties:**
- Unit tests
- Integration tests
- Component tests
- Test patterns (AAA)

**When to use:**
- New features need tests
- Coverage is low
- Critical paths need testing
- TDD workflow

---

### Verify App

**File:** `.claude/agents/verify-app.md`

End-to-end application verification.

**Specialties:**
- Build verification
- Test suite execution
- Security checks
- Environment validation

**When to use:**
- Before shipping features
- Before merging PRs
- After major changes
- Pre-deployment checks

---

### PR Reviewer

**File:** `.claude/agents/pr-reviewer.md`

Automated code review.

**Specialties:**
- Security review
- Correctness checks
- Quality assessment
- Improvement suggestions

**When to use:**
- Before merging any PR
- Self-review before requesting human review
- Automated review in CI

---

### Doc Generator

**File:** `.claude/agents/doc-generator.md`

Creates and updates documentation.

**Specialties:**
- README updates
- API documentation
- Component docs
- CLAUDE.md updates

**When to use:**
- After significant changes
- When adding new features
- When docs are outdated
- To document learnings

---

### Oncall Guide

**File:** `.claude/agents/oncall-guide.md`

Debugs production issues.

**Specialties:**
- Incident response
- Rapid diagnosis
- Quick fixes
- Post-mortems

**When to use:**
- Something is broken in production
- Investigating errors
- Performance issues
- System outages

---

## How Agents Work

### Invoking Agents

Boris automatically invokes agents via the Task tool:

```
Boris: I'll have code-architect review the design first.
[Invokes code-architect agent]

Architect: Here's my analysis...

Boris: Now let's implement. [Does work]

Boris: Let me have code-simplifier clean this up.
[Invokes code-simplifier agent]
```

### Direct Invocation

You can also ask Claude to use an agent directly:

```
User: Use the code-architect agent to review my API design

User: Have the test-writer create tests for the auth module

User: Run the verify-app agent before I merge
```

---

## Creating Custom Agents

Add files to `.claude/agents/`:

```markdown
---
name: my-agent
description: What this agent specializes in
tools: Read, Edit, Bash, etc.
---

# Agent Name

You are a [role] who specializes in [domain].

## Responsibilities
- Thing 1
- Thing 2

## Process
1. Step 1
2. Step 2

## Output Format
How results should look
```

**Tips:**
- Give clear role identity
- Define specific process
- Specify output format
- List what tools are needed
