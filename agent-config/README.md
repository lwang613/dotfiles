---
tags: [meta, ai, config]
area: Meta
type: reference
topics: ["Research Practice & Ethics"]
created: 2026-08-27
---
# Agent config — install and upkeep

*[[Learning Map|◀ Learning Map]] · derived from [[Coding with AI — Agents, Limits, and My Rules]] §6–§8 and [[MS L07 — Agentic Coding]]*

Two **global** instruction files. Versioned here for the same reason dotfiles are ([[MS L02 — Command-line Environment]] §9): configuration is code.

## Install

```bash
V=~/MD_PhD/phd_notes/_agent-config

mkdir -p ~/.claude ~/.copilot
ln -sf "$V/CLAUDE.md"                ~/.claude/CLAUDE.md
ln -sf "$V/copilot-instructions.md"  ~/.copilot/copilot-instructions.md
```

Symlink rather than copy, so editing the file here updates both tools. **Check for an existing file
at either path first** — `ln -sf` will replace it without asking.

Verify: `/env` in Copilot CLI, `/memory` in Claude Code.

## What goes where

| Scope | File | Contents |
|---|---|---|
| **Global** | these two | security boundaries · toolchain defaults · style |
| **Project** | `<repo>/AGENTS.md`, with `CLAUDE.md` containing only `@AGENTS.md` | assembly · directory layout · build and test commands · cluster headers |
| **Subdirectory** | `<repo>/scripts/AGENTS.md` | conventions for one subtree |
| **On demand** | `~/.copilot/skills/<name>/SKILL.md`, `~/.claude/skills/…` | procedures — loaded only when the description matches |

Nothing arbitrates a conflict between instruction files: Claude Code concatenates them and "may pick
one arbitrarily"; Copilot CLI defines no precedence at all. **Keep them non-contradictory.**

## Upkeep

- **§1–§5 are byte-identical across both files.** Change one, change both. Diff before committing:
  ```bash
  diff <(sed -n '/^## 1\./,/^## 6\./p' CLAUDE.md) \
       <(sed -n '/^## 1\./,/^## 6\./p' copilot-instructions.md)
  ```
- **`PHASE:` gates the strictest rule.** Phases 1–2 tell the agent to refuse to write code; Phase 3+
  opens the reviewer role. Update it at each phase gate in [[Curriculum Plan — Bioinformatics and Evolutionary Genetics|the training plan]] — it is the one line that changes behaviour most.
- **These files are always loaded in full**, so every line costs context in every session. Procedures
  belong in a skill; only invariants belong here.
- **Loosen the policy with evidence, in writing, not by drift** — the calibration argument in
  [[Coding with AI — Agents, Limits, and My Rules]] §8.

## Links
- [[Coding with AI — Agents, Limits, and My Rules]] — where every rule here comes from
- [[MS L07 — Agentic Coding]] · [[MS L06 — Packaging and Shipping Code]] · [[MS L09 — Code Quality]]
- [[Reproducible Project Structure — Raw Data, Scripts, and Versioned Outputs]] · [[6 — Scientific Computing Ethics and Data Stewardship]]
- [[Topic · Research Practice & Ethics]] · [[Learning Map]]
