---
description: Structured brainstorming for designing a novel personal clarity/momentum tool. Use when ready to move from research to concrete concept — generating ideas, challenging assumptions, and landing on an MVP shape. Triggers on "brainstorm the tool", "ideate", "generate concepts", "what should we build", "tool design session".
allowed-tools:
  - Read
  - Write
  - Glob
  - AskUserQuestion
user-invocable: true
---

# Tool Design Brainstorming Skill

Moves from research + context → novel tool concepts → one concrete MVP direction.

**This skill assumes the research phase is done.** It reads existing research and uses it as raw material for structured ideation — not a blank slate, not a free-form chat.

---

## Before Starting: Load Context

Read the research base:
- `docs/research/personal-empowerment/00-summary.md` — overall findings
- `docs/research/personal-empowerment/05-round3-momentum-flywheel.md` — flywheel + Arthur's context
- Any other files in that directory

Summarize the known constraints in 3 bullets before beginning ideation. This grounds the brainstorm.

---

## Phase 1: DIVERGE — Generate Without Judgment (15 min)

**Rule:** No evaluation during this phase. Every idea goes on the board. Wild > safe.

### Technique A: How Might We (HMW)

Reframe the core problem as opportunity questions. Generate at least 8 HMW questions from different angles:

- From the user's perspective: "HMW make Arthur's flywheel spin with zero willpower required?"
- From the failure mode: "HMW prevent the tool from becoming another Notion dashboard he maintains but doesn't use?"
- From constraint flipping: "HMW make the tool work *better* when Arthur has no energy, not worse?"
- From the physical world: "HMW make this tool exist partly outside a screen?"
- From time: "HMW make one 2-minute weekly interaction more valuable than 20 daily ones?"
- From identity: "HMW make Arthur feel like a builder even on days nothing gets built?"
- From the flywheel: "HMW detect which spoke is stalled before Arthur even notices?"
- From ambient: "HMW capture context passively instead of requiring active input?"

For each HMW: generate 2-3 raw concept ideas (no polish needed).

### Technique B: SCAMPER on Existing Tools

Take each known tool category and force mutations:

**Starting tools:** LifeOS / Notion, IFS Guide App, Bee AI (ambient wearable), Weekly letter to self, Physical journal

For each, apply:
- **S**ubstitute: what if we replaced the core mechanic with something else?
- **C**ombine: what if we merged two tools into one?
- **E**liminate: what if we removed the thing that makes it feel like work?
- **R**everse: what if the tool came to you instead of you going to it?

Goal: 10+ raw mutations. Don't filter yet.

### Technique C: Extreme Constraints

Force ideas by applying extreme constraints:

1. **Zero screen version**: The tool cannot use any screen. What is it?
2. **One sentence per week**: The tool's entire interface is one sentence delivered weekly. What's in it?
3. **No input required**: Arthur never has to enter anything. The tool only outputs. What does it output?
4. **5-year-old version**: A child could understand how to use it. What is it?
5. **Physical object version**: It's not software at all. What physical object could serve this function?

---

## Phase 2: CONVERGE — Cluster and Evaluate (10 min)

### Step 1: Cluster the raw ideas

Group all ideas from Phase 1 into 4-6 themes. Name each theme with a verb phrase (e.g., "Ambient capture + weekly synthesis", "Daily push detection", "Experiment tracking").

### Step 2: Score each cluster

For each cluster, score on three axes (1-3):
- **Fit with Arthur's profile** — does it match the flywheel, the non-implementation pattern, the builder identity?
- **Novelty** — how different is it from existing tools?
- **Buildability now** — can a version be built/used in the next 2 weeks?

### Step 3: Pick the top 2

Identify the 2 highest-scoring clusters. For each, write:
- The core concept in one sentence
- The key mechanic (what does the user actually DO or receive?)
- The main risk / unknown

### Step 4: Pressure test

For each of the 2 finalists, ask:
- "Will Arthur still use this in month 3, or will it die like Notion?"
- "What's the minimum version that delivers real value?"
- "Is this actually novel, or is it just [existing tool] with a different name?"

---

## Phase 3: LAND — Define the MVP (5 min)

Select one concept. Define:

### The MVP in one paragraph
What it is, how it works, what Arthur does (or doesn't do), and what value it delivers.

### The first version
What's the simplest possible implementation that tests the core hypothesis? (Claude skill? Script? Voice note ritual? Physical object?)

### The first experiment
Define it as a hypothesis:
> "If [Arthur does X with this tool] for [N days/weeks], then [specific outcome]."

### Output
Save to: `docs/research/personal-empowerment/06-tool-concept-mvp.md`

---

## Principles for This Brainstorm

1. **Novel > familiar** — if it sounds like something that already exists, push further
2. **Momentum > organization** — the tool builds forward motion, not structure
3. **Low friction > feature-rich** — the best version is the one Arthur actually uses
4. **Builder identity** — the tool should make him feel like a builder, not a manager of his own life
5. **Experiments not tasks** — everything is a hypothesis with a result, not an obligation
