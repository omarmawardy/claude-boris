# Contributing to Claude Boris

First off, thanks for wanting to contribute! 🎉

Claude Boris is a community-driven project, and we welcome contributions of all kinds.

## Ways to Contribute

### 🐛 Report Bugs
Found something broken? [Open an issue](../../issues/new?template=bug_report.md) with:
- What you expected to happen
- What actually happened
- Steps to reproduce

### 💡 Suggest Features
Have an idea? [Open a feature request](../../issues/new?template=feature_request.md) with:
- The problem you're trying to solve
- Your proposed solution
- Alternative approaches you considered

### 🔧 Submit Code
Ready to code? Here's how:

1. **Fork the repo** and create your branch from `main`
2. **Make your changes** following our guidelines below
3. **Test your changes** - make sure everything works
4. **Submit a PR** with a clear description

## Development Setup

```bash
# Clone your fork
git clone https://github.com/llcoolblaze/claude-boris.git
cd claude-boris

# Create a branch
git checkout -b feature/your-feature-name
```

## Contribution Guidelines

### Adding Slash Commands

Commands live in `.claude/commands/`. Each command needs:

1. **Frontmatter** with description:
```markdown
---
description: What this command does in one line
---
```

2. **Clear instructions** for Claude to follow
3. **Inline bash** (`!`command``) for context when helpful

### Adding Agents

Agents live in `.claude/agents/`. Each agent needs:

1. **Frontmatter** with name, description, and tools:
```markdown
---
name: agent-name
description: What this agent specializes in
tools: Read, Edit, Bash, etc.
---
```

2. **Clear role definition** - what is this agent's expertise?
3. **Process/workflow** - how should it approach tasks?
4. **Output format** - what should results look like?

### Modifying CLAUDE.md

The CLAUDE.md template should:
- Work for any project type
- Have clear section headers
- Include helpful examples
- Be easy to customize

### Code Style

- Use clear, descriptive names
- Keep files focused and single-purpose
- Add comments for non-obvious logic
- Follow existing patterns in the codebase

## Pull Request Process

1. **Update documentation** if you're changing behavior
2. **Test your changes** by using them in a real project
3. **Write a good PR description**:
   - What does this change?
   - Why is it needed?
   - How was it tested?

4. **Be responsive** to review feedback

## Good First Issues

Looking for a place to start? Check issues labeled [`good first issue`](../../labels/good%20first%20issue).

Some ideas:
- Add a new slash command for a common workflow
- Create an agent for a specific framework (Rails, Django, etc.)
- Improve documentation
- Add MCP server configurations

## Community

- **Be respectful** - We're all here to learn and build
- **Be patient** - Maintainers are volunteers
- **Be helpful** - Answer questions when you can

## Questions?

Not sure about something? [Open a discussion](../../discussions) or ask in an issue.

---

Thank you for making Claude Boris better! 🤖
