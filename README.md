# Superpowers for Cursor

Cursor adaptation of [obra/superpowers](https://github.com/obra/superpowers) - an agentic skills framework for AI-assisted development.

## Installation

Copy the `.cursor/` folder to your project:

```bash
cp -r /path/to/superpowers-cursor/.cursor /your/project/
```

Or clone and copy:

```bash
git clone https://github.com/obra/superpowers.git /tmp/superpowers
mkdir -p .cursor/skills .cursor/agents .cursor/commands .cursor/hooks
cp -r /tmp/superpowers/skills/* .cursor/skills/
cp -r /tmp/superpowers/agents/* .cursor/agents/
cp -r /tmp/superpowers/commands/* .cursor/commands/
# Then copy hooks.json and hooks/session-start.sh from this repo
```

## Structure

```
.cursor/
  hooks.json                   # Hook configuration (sessionStart)
  hooks/
    session-start.sh           # Injects using-superpowers at session start
  rules/superpowers.mdc        # Skills quick reference
  agents/                      # Subagent definitions
    code-reviewer.md
  commands/                    # Command definitions
    brainstorm.md
    write-plan.md
    execute-plan.md
  skills/                      # 14 skills
    brainstorming/
    writing-plans/
    executing-plans/
    test-driven-development/
    systematic-debugging/
    subagent-driven-development/
    using-git-worktrees/
    finishing-a-development-branch/
    verification-before-completion/
    requesting-code-review/
    receiving-code-review/
    dispatching-parallel-agents/
    using-superpowers/
    writing-skills/
```

## How It Works

The `sessionStart` hook automatically injects the `using-superpowers` skill at the start of every conversation, teaching the agent how to use skills.

## Workflow

1. **Brainstorm** - Refine ideas into designs before coding
2. **Write Plan** - Create detailed implementation plan with bite-sized tasks
3. **Execute** - Implement using TDD (test first, watch fail, implement, watch pass)
4. **Review** - Code review between tasks
5. **Finish** - Merge, PR, or discard

## Key Principles

- **TDD**: Write tests first, always
- **YAGNI**: Don't build what's not needed
- **Systematic debugging**: Find root cause before fixing
- **Verification**: Evidence before claims

## Credits

Based on [superpowers](https://github.com/obra/superpowers) by Jesse Vincent.
