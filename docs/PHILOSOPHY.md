# The Boris Philosophy

This document explains the core principles behind Claude Boris, based on Boris Cherny's (creator of Claude Code) actual workflow.

## The Origin

On January 2, 2026, Boris Cherny shared a [13-tweet thread](https://x.com/bcherny/status/2007179832300581177) revealing how he personally uses Claude Code. The thread went viral because it showed a surprisingly practical, "vanilla" approach that anyone could adopt.

Claude Boris distills that thread into an actionable configuration.

## The Five Principles

### 1. Plan First, Execute Second

> "Most sessions start in Plan mode (shift+tab twice). If my goal is to write a Pull Request, I will use Plan mode, and go back and forth with Claude until I like its plan. From there, I switch into auto-accept edits mode and Claude can usually 1-shot it. A good plan is really important!"

**Why it works:** A clear plan prevents wasted effort. When Claude knows exactly what to do, it executes faster and with fewer errors.

**How Boris implements it:**
- `/boris` always creates a plan first
- Plans include steps, owners, and verification strategy
- User must approve before execution begins

### 2. Verification is Everything

> "Probably the most important thing to get great results out of Claude Code—give Claude a way to verify its work. If Claude has that feedback loop, it will 2-3x the quality of the final result."

**Why it works:** Feedback loops enable self-correction. Without verification, Claude might produce code that looks right but doesn't work.

**How Boris implements it:**
- Every task ends with verification checks
- Tests, types, lint, build must all pass
- `verify-app` agent does comprehensive testing
- No shipping without green checks

### 3. Living Documentation

> "Our team shares a single CLAUDE.md for the Claude Code repo. We check it into git, and the whole team contributes multiple times a week. Anytime we see Claude do something incorrectly we add it to the CLAUDE.md, so Claude knows not to do it next time."

**Why it works:** Mistakes become knowledge. Instead of repeating errors, Claude learns from them permanently.

**How Boris implements it:**
- CLAUDE.md is the project's memory
- `/update-claude-md` captures learnings
- Mistakes to Avoid section prevents repeat errors
- Team shares and updates continuously

### 4. Delegate to Specialists

> "I use a few subagents regularly: code-simplifier simplifies the code after Claude is done working, verify-app has detailed instructions for testing Claude Code end to end, and so on."

**Why it works:** Specialized agents do specialized tasks better. A code reviewer thinks differently than a code writer.

**How Boris implements it:**
- `boris` orchestrates, doesn't do everything
- Specialist agents for architecture, testing, review, docs
- Each agent has focused expertise and clear process
- Task tool enables delegation

### 5. Automate the Inner Loop

> "I use slash commands for every 'inner loop' workflow that I end up doing many times a day. This saves me from repeated prompting, and makes it so Claude can use these workflows, too."

**Why it works:** Repeated work is wasteful. Commands encode workflows once and reuse them forever.

**How Boris implements it:**
- `/commit-push-pr` for git workflow
- `/test-and-fix` for test iteration
- `/verify-all` for comprehensive checks
- Commands use inline bash for context

## The Counterintuitive Insights

### Slower Models Are Faster

> "I use Opus 4.5 with thinking for everything. It's the best coding model I've ever used, and even though it's bigger & slower than Sonnet, since you have to steer it less and it's better at tool use, it is almost always faster than using a smaller model in the end."

The time spent waiting for a smarter model is less than the time spent correcting a faster but dumber one.

### Permissions Should Be Pre-Allowed

> "I don't use --dangerously-skip-permissions. Instead, I use /permissions to pre-allow common bash commands that I know are safe in my environment."

Security and convenience aren't opposites. Pre-allow safe commands, deny dangerous ones.

### Parallel Sessions Beat Deep Sessions

> "I run 5 Claudes in parallel in my terminal. I number my tabs 1-5, and use system notifications to know when a Claude needs input."

Multiple shallow sessions can outperform one deep session. Start work, let it run, check back when notified.

## The Boris Workflow in Practice

```
User: /boris Add user authentication

Boris: Let me plan this out:

## Plan for: User Authentication

### Steps
1. [code-architect] Review auth requirements
2. [boris] Implement auth logic
3. [test-writer] Create auth tests
4. [verify-app] End-to-end testing
5. [code-simplifier] Clean up implementation
6. [doc-generator] Update API docs

Shall I proceed?

User: Yes

Boris: [Coordinates execution...]
       [Runs verification...]
       [All checks pass...]
       
Ready to commit. Running /commit-push-pr...

Done! PR #42 created: "feat(auth): add user authentication"
```

## Further Reading

- [Boris's Original Thread](https://x.com/bcherny/status/2007179832300581177)
- [Claude Code Documentation](https://code.claude.com/docs)
- [Commands Reference](COMMANDS.md)
- [Agents Reference](AGENTS.md)
