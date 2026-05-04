---
name: deep-research
description: "Conduct deep iterative web research on any topic with multi-round investigation. Stores findings in docs/research/round-{n}/ with full citations and asks user about next steps between rounds. Use when user asks for 'research', 'investigate', 'deep dive', 'look into', 'research deeply', wants comprehensive information gathering, or mentions 'research round'."
---

# Deep Research

Iterative multi-round web research with user checkpoints and cumulative knowledge building.

## Workflow

```
Round N: Context → Plan → Search → Synthesize → Store → Checkpoint
                                                            │
                                         ┌──────────────────┤
                                         ▼                  ▼
                                   Next Round          Conclude
```

## Stage 1: Initial Setup

When user requests research:

1. **Parse the research topic/question**

2. **Ask clarifying questions if needed**:
   - Depth: Overview / Comprehensive / Exhaustive?
   - Sources to prioritize or avoid?
   - Time sensitivity? (Recent data only?)
   - Intended use of findings?

3. **Check for existing research**:
   - Use Glob: `docs/research/round-*/`
   - If exists, offer to continue or start fresh

4. **Create output directory**: `docs/research/round-{n}/`

5. **Initialize TodoWrite** with research phases

## Stage 2: Research Planning

For each round:

1. Break topic into **3-5 key questions**
2. For each question, generate **2-3 search queries**
3. Present plan (brief) before executing

## Stage 3: Research Execution

For each question:

1. **Execute searches** (WebSearch) - use varied query formulations
2. **Fetch key sources** (WebFetch) - prioritize authoritative sources
3. **Evaluate source credibility** - see [source-evaluation.md](references/source-evaluation.md)
4. **Extract findings with citations**
5. **Note confidence level** based on source quality/agreement

### Source Quick Check

- **Authority**: Who published? Credentials?
- **Currency**: When published?
- **Corroboration**: Do other sources agree?

Mark findings as:
- **Verified**: 2+ independent sources agree
- **Single-source**: Flag for user attention
- **Contested**: Sources disagree (note both views)

## Stage 4: Synthesis

After gathering findings:

1. **Identify consensus** - what sources agree on
2. **Note disagreements** - where sources differ
3. **Assess confidence** - High/Medium/Low
4. **Structure findings** - using templates

See [synthesis-patterns.md](references/synthesis-patterns.md) for patterns.

## Stage 5: Storage

Write to `docs/research/round-{n}/`:

```
00-summary.md      # Round overview + key findings
01-[topic-a].md    # Detailed findings by topic
02-[topic-b].md    # Additional topics
sources.md         # All sources with citations
```

### Summary Format

```markdown
# Round {N} Summary: [Topic]

## Key Findings
- [Finding 1] [1, 2]
- [Finding 2] [3]

## Confidence Assessment
- High: [topics]
- Medium: [topics]
- Needs verification: [topics]

## Next Directions
- [Follow-up option 1]
- [Follow-up option 2]
```

### Topic File Format

```markdown
# [Topic]

## Summary
[1-2 paragraph synthesis]

## Findings
[Details with inline citations]

## Confidence: [High/Medium/Low]
## Sources: [numbered list]
```

## Stage 6: User Checkpoint

**CRITICAL**: Never auto-continue. Always use AskUserQuestion:

```
Round {N} Complete - Stored in docs/research/round-{n}/

Key findings:
- [Finding 1]
- [Finding 2]

Gaps identified:
- [Gap 1]

Options:
1. Continue Round {N+1}: [suggested focus]
2. Adjust direction
3. Conclude research
```

## Multi-Round Synthesis

After 2+ rounds, if user requests, create `docs/research/final-synthesis.md`:

```markdown
# Research Synthesis: [Topic]

## Executive Summary
[2-3 paragraphs]

## Evolution of Understanding
[What each round contributed]

## Consolidated Findings
[Organized by theme]

## Remaining Questions
[What wasn't answered]

## All Sources
[Master citation list]
```

## References

- [Output Templates](references/output-templates.md)
- [Source Evaluation](references/source-evaluation.md)
- [Synthesis Patterns](references/synthesis-patterns.md)
