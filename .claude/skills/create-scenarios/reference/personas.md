# Persona Catalog

Established personas used across Skepsi features. Reuse these when relevant rather than inventing new ones.

## Student Personas (established)

These three student types are core to the Skepsi product model.

| Persona | ID | French Label | Color | Behavior |
|---------|----|-------------|-------|----------|
| **Rusher** | `rusher` | Fonceuse | Green #22C55E | Finds answers quickly but skips steps. Needs to justify reasoning. Confident, fast. |
| **Struggler** | `struggler` | Bloque | Amber #F59E0B | Needs scaffolding and step-by-step help. Progresses slowly but learns. |
| **Guesser** | `guesser` | Devineuse | Violet #8B5CF6 | Gets correct answers with wrong reasoning. Pattern-matches or gets lucky. Invisible problem. |

Used in: exercise-creation (preview), class-pulse (overview, student-journey), concept-heatmap (all)

## Teacher Personas (emerging)

These are less formalized but recur across teacher-facing features.

| Persona | Description | Seen in |
|---------|-------------|---------|
| **Mme Dupont** | Standard French teacher, 6eme. Tech-comfortable. The "typical" teacher. | class-pulse, exercise-creation |
| **New-to-digital teacher** | Has exercises as PDFs/photocopies. Needs the simplest path. | exercise-creation (import flows) |
| **Data-curious teacher** | Wants to understand patterns across exercises, not just one. | concept-heatmap (cumulative view) |
| **Pressed-for-time teacher** | Needs the 2-minute scan. Won't dig into details unless flagged. | class-pulse (overview only) |

## Class Personas (emerging)

Different class compositions that affect how dashboards look.

| Persona | Description | Seen in |
|---------|-------------|---------|
| **Typical class** | Majority solid, some struggling, a few guessers | class-pulse overview |
| **Struggling class** | Harder exercise, most students struggling | class-pulse overview |
| **Strong class** | Almost everyone solid, ready to move on | class-pulse overview |

## Market Personas

| Persona | Description | Seen in |
|---------|-------------|---------|
| **France teacher** | Uses Pronote/Ecole Directe, French curriculum, French-language UI | exercise-creation (import) |
| **Greece teacher** | Uses Classter/e-me, Greek curriculum, potentially Greek-language | exercise-creation (import) |

## Adding New Personas

When a feature needs a new persona:

1. Check if an existing persona covers the behavior
2. If not, define: name, description, and why they matter for this feature
3. Add to this file after user validation
4. Mark as "(new)" in scenario planning tables
