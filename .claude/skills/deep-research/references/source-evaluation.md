# Source Evaluation Guide

How to evaluate and verify sources during research.

## Source Tier System

| Tier | Source Type | Reliability | Examples |
|------|-------------|-------------|----------|
| 1 | Peer-reviewed journals, official documentation | Highest | Nature, IEEE, RFC docs |
| 2 | Industry reports, established institutions | High | McKinsey, Gartner, MIT |
| 3 | Reputable news, expert analysis | Medium-High | NYT, BBC, respected blogs |
| 4 | Technical forums, Q&A sites | Medium | Stack Overflow, HN |
| 5 | Wikipedia, general forums | Starting point | Use to find primary sources |

## Quick Evaluation Checklist

For each significant source:

```markdown
- [ ] Authority: Who published? What are their credentials?
- [ ] Currency: When was this published? Is it still relevant?
- [ ] Coverage: Does it address the question fully?
- [ ] Corroboration: Do other independent sources agree?
```

## Verification Standards

### For Facts/Statistics
- **Minimum**: 2 independent sources
- **Ideal**: 3+ sources including at least one Tier 1-2
- **Action if single source**: Mark as "needs verification"

### For Opinions/Analysis
- Note the source's perspective/potential bias
- Seek opposing viewpoints
- Present as "[Source] argues..." not as fact

### For Recent Events
- Prioritize last 24 months for fast-moving topics
- Note publication date explicitly
- Flag if only older sources available

## Red Flags to Check

Search for these terms alongside key claims:
- "contradicts"
- "fails to replicate"
- "retraction"
- "debunked"
- "controversy"
- "correction"

## Lateral Reading Process

When verifying AI-gathered information:

1. **Fractionate**: Break findings into specific, searchable claims
2. **Leave the source**: Search independently for confirmation
3. **Find who else says this**: Look for independent verification
4. **Assess the verifiers**: Are they credible?

Key question: "Who can confirm this information?"

## Output Marking

### Verified Claims
```markdown
**Finding**: [Claim text]
- Primary: [Source 1] (Tier X, [Year])
- Corroboration: [Source 2] (Tier Y, [Year])
- Confidence: High
```

### Single-Source Claims
```markdown
**Reported**: [Claim text]
- Source: [Single source] (Tier X, [Year])
- Verification: Unable to corroborate
- Note: Verify before citing in important contexts
```

### Contested Claims
```markdown
**Contested**: [Topic]
- View A: [Position] - [Sources 1, 2]
- View B: [Position] - [Sources 3, 4]
- Assessment: [Which has stronger evidence]
- Confidence: Medium (contested topic)
```

## Source Types to Prioritize

### For Technical Topics
1. Official documentation
2. Peer-reviewed papers
3. Conference proceedings
4. Reputable technical blogs

### For Industry/Business Topics
1. Industry analyst reports (Gartner, Forrester)
2. Company official sources
3. Business publications (HBR, MIT Sloan)
4. Reputable news analysis

### For Current Events
1. Wire services (AP, Reuters)
2. Major news outlets
3. Official statements
4. Expert commentary

## When to Flag for User

Always flag:
- Single-source critical claims
- Conflicting authoritative sources
- Claims that couldn't be verified
- Surprising or counterintuitive findings
- Information older than expected for topic
