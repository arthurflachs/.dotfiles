# Output Templates

Templates for research output files.

## 00-summary.md Template

```markdown
# Round {N} Summary: [Research Topic]

**Date**: [YYYY-MM-DD]
**Focus**: [What this round investigated]

## Research Questions
1. [Question 1]
2. [Question 2]
3. [Question 3]

## Key Findings

### [Theme 1]
- [Finding] [1, 2]
- [Finding] [3]

### [Theme 2]
- [Finding] [4, 5]

## Confidence Assessment

| Topic | Confidence | Reason |
|-------|------------|--------|
| [Topic 1] | High | Multiple authoritative sources agree |
| [Topic 2] | Medium | Limited sources, but credible |
| [Topic 3] | Low | Single source, needs verification |

## Source Summary
- Total sources: [N]
- Academic/Research: [N]
- Industry/Reports: [N]
- News/Media: [N]

## Gaps Identified
- [What couldn't be found]
- [What needs deeper investigation]

## Suggested Next Directions
1. [Direction 1]: [Brief rationale]
2. [Direction 2]: [Brief rationale]
3. [Direction 3]: [Brief rationale]

---
See sources.md for full citation list.
```

## Topic File Template (01-[topic].md)

```markdown
# [Topic Name]

## Summary
[1-2 paragraph high-level synthesis of findings on this topic]

## Detailed Findings

### [Subtopic 1]
[Detailed findings with inline citations like this [1] or this [2, 3]]

Key points:
- [Point 1] [1]
- [Point 2] [2]

### [Subtopic 2]
[Additional detailed findings]

### [Subtopic 3 if applicable]
[More findings]

## Conflicting Information
[If sources disagree, document here]

**View A**: [Position] - supported by [Source X]
**View B**: [Position] - supported by [Source Y]
**Assessment**: [Which is more credible and why]

## Confidence Level
**Overall**: [High/Medium/Low]

**Rationale**: [Why this confidence level - e.g., "Multiple peer-reviewed sources agree" or "Based primarily on industry reports, limited academic verification"]

## Source Agreement
[Consensus/Mixed/Contested]

---
## Sources

[1] [Author/Org]. ([Year]). "[Title]". [Publication/Site]. [URL]
[2] [Author/Org]. ([Year]). "[Title]". [Publication/Site]. [URL]
[3] [Author/Org]. ([Year]). "[Title]". [Publication/Site]. [URL]
```

## sources.md Template

```markdown
# Sources - Round {N}

## All Sources

### Academic & Research
1. [Author]. ([Year]). "[Title]". *[Journal]*. [URL]
2. ...

### Industry Reports
3. [Organization]. ([Year]). "[Title]". [URL]
4. ...

### News & Media
5. [Author]. ([Year]). "[Title]". *[Publication]*. [URL]
6. ...

### Documentation & Official Sources
7. [Organization]. ([Year]). "[Title]". [URL]
8. ...

## Source Quality Notes

| # | Source | Tier | Notes |
|---|--------|------|-------|
| 1 | [Name] | 1 | Peer-reviewed |
| 2 | [Name] | 2 | Industry leader |
| 3 | [Name] | 3 | Reputable news |

## Sources Not Used (and why)
- [Source]: [Reason - e.g., outdated, unreliable, paywall]
```

## final-synthesis.md Template

```markdown
# Research Synthesis: [Topic]

**Research Period**: [Start date] - [End date]
**Rounds Completed**: [N]

## Executive Summary
[2-3 paragraphs summarizing the complete research effort and key conclusions]

## Evolution of Understanding

### Round 1: [Focus]
- Key contribution: [What was learned]
- Led to: [How it shaped next round]

### Round 2: [Focus]
- Key contribution: [What was learned]
- Led to: [How it shaped next round]

### Round N: [Focus]
- Key contribution: [Final insights]

## Consolidated Findings

### [Major Theme 1]
[Synthesized findings across all rounds]

### [Major Theme 2]
[Synthesized findings across all rounds]

### [Major Theme 3]
[Synthesized findings across all rounds]

## Key Conclusions
1. [Conclusion 1]
2. [Conclusion 2]
3. [Conclusion 3]

## Remaining Questions
- [Question that couldn't be fully answered]
- [Area that needs future research]

## Confidence Summary

| Finding | Confidence | Source Strength |
|---------|------------|-----------------|
| [Finding 1] | High | 5+ sources agree |
| [Finding 2] | Medium | 2-3 sources |
| [Finding 3] | Low | Single source |

## Master Source List
[All sources from all rounds, deduplicated]

1. ...
2. ...
```
