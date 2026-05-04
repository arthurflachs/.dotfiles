# YAML State File Format

## File Location

```
founder/features-development/{feature-name}/states/{state-name}.yaml
```

## Base Structure

Every state file follows this structure:

```yaml
screen: {feature-name}        # Matches the parent directory name
state: {state-variant}         # Unique identifier for this state
description: "What this state represents in the user flow"

data:
  # Concrete data populating the screen
  # Use realistic French/Greek names, dates, numbers

elements:
  # UI elements visible in this state
  # Describe what the user sees, not implementation

interactions:
  # What the user can do from here
  - action: "what the user does"
    result: "what happens"
    next_state: "{file}.yaml#{variant-id}"  # Cross-reference
```

## Variants

When a single screen has multiple meaningful configurations, use variants:

```yaml
screen: feature-name
state: state-name
description: "General description"

variants:
  - id: variant-slug
    description: "What makes this variant different"

    data:
      # Variant-specific data

    elements:
      # Variant-specific UI elements

    interactions:
      # Variant-specific actions
```

## Data Conventions

### Realistic Content

- **French names**: Mme Dupont, Lucas M., Eleni K., Sofia P., Adam B.
- **Greek names**: Use when scenario is Greek market (Eleni, Nikos, Maria, Giorgos)
- **French grades**: 6eme, 5eme, 4eme, 3eme, 2nde, 1ere, Terminale
- **Greek grades**: Gymnasiou (A, B, C), Lykeiou (A, B, C)
- **Dates**: French format (Lundi 5 fevrier, 14h)
- **Subjects**: Currently math-focused but structure supports any subject

### Thinking Patterns (student scenarios)

| Pattern | French Label | Color | Meaning |
|---------|-------------|-------|---------|
| `solid` | Solide | Green | Correct answer AND sound reasoning |
| `uncertain` | Incertain | Amber | Correct answer but weak reasoning |
| `struggling` | Bloque | Amber | Needed scaffolding or wrong answers |
| `guessing` | Devine | Violet | Right answer, wrong reasoning |
| `incomplete` | Non termine | Gray | Started but didn't finish |
| `not_started` | Pas commence | Gray | Never opened |

### Persona Colors

| Persona | Color | Hex |
|---------|-------|-----|
| Rusher | Green | #22C55E |
| Struggler | Amber | #F59E0B |
| Guesser | Violet | #8B5CF6 |

## Elements Description Style

Describe elements as what the user sees, not as HTML/CSS:

```yaml
# Good
elements:
  header:
    title: "Tableau de bord - 6eme A"
    subtitle: "Fractions - Complement a 1"
  summary_cards:
    - label: "Solide"
      count: 14
      color: green

# Bad (too implementation-focused)
elements:
  div_header:
    h1: "Tableau de bord"
    className: "text-xl font-bold"
```

## Interactions Style

Each interaction describes a user action, its result, and where it leads:

```yaml
interactions:
  - action: "Click on a student name"
    result: "Opens the student's journey view"
    next_state: "student-journey.yaml#lucas-m"

  - action: "Click 'Filtrer par concept'"
    result: "Shows concept filter dropdown"
    next_state: "filtered.yaml#by-concept"

  - action: "Hover over a heatmap cell"
    result: "Shows tooltip with pattern details"
    # No next_state for in-place interactions
```

## Cross-References

Link between state files using `filename.yaml#variant-id`:

```yaml
action_target: "student-journey.yaml#lucas-m"
next_state: "overview.yaml#typical-class"
```

## Insights and Suggestions (teacher-facing)

When a scenario includes AI-generated insights for the teacher:

```yaml
attention_cards:
  - student: "Lucas M."
    pattern: guessing
    insight: "4/5 correct mais n'a jamais pu expliquer sa methode."
    suggestion: "Demandez-lui d'expliquer son raisonnement a voix haute demain."
    action: "Voir son parcours"
    action_target: "student-journey.yaml#lucas-m"
```

Insights should be:
- **Specific**: Reference actual behavior, not generic observations
- **Actionable**: The teacher should know what to do next
- **Humble**: "You might want to..." not "You must..."
- **In French**: For France market scenarios (or Greek for Greece market)
