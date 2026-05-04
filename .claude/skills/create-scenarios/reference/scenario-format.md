# Flow Scenario Format

Flow scenarios describe a specific persona's journey across multiple screens with concrete, consistent data.

## File Location

```
founder/features-development/{feature-name}/scenarios/{persona-action}.yaml
```

Naming convention: `{persona-slug}-{action-slug}.yaml`
Examples: `dupont-creates-fractions-exercise.yaml`, `new-teacher-imports-pdf.yaml`

## Structure

```yaml
scenario: "Short name"
description: "What this scenario demonstrates in one sentence"

persona:
  name: "Mme Dupont"
  type: "experienced-teacher"         # References persona catalog
  context: "Preparing homework for her 6eme A class after the fractions unit"

steps:
  - screen: form-empty                # References states/form-empty.yaml
    sees:
      # What the persona sees when arriving at this screen
      # Use the actual text, labels, and values visible
      - "Empty exercise creation form"
      - "Class selector showing '6eme A — 25 eleves'"
      - "Placeholder: 'Collez ou tapez votre exercice...'"
    action:
      does: "Types the exercise content in the text area"
      input: |
        Completer les egalites suivantes:
        a) 1/3 + ... = 1
        b) 2/5 + ... = 1
        c) 7/10 + ... = 1
      selects:
        subject: "Mathematiques"
        grade: "6eme"
        topic: "Fractions"
    result: "Skepsi analyzes the exercise. A loading indicator appears for 2 seconds, then the auto-breakdown shows below the form."
    next: form-filled

  - screen: form-filled               # References states/form-filled.yaml
    sees:
      - "Her exercise text in the form"
      - "Auto-breakdown card: 'Skepsi a detecte 3 concepts'"
      - "Concepts: Addition de fractions, Complement a 1, Denominateurs communs"
      - "Difficulty estimate: Facile"
      - "Button: 'Previsualiser' and 'Assigner'"
    action:
      does: "Clicks 'Previsualiser'"
    result: "Preview modal opens showing three tabs: Fonceuse, Bloque, Devineuse"
    next: preview

  - screen: preview                    # References states/preview.yaml
    sees:
      - "Three tabs showing how each student type will experience the exercise"
      - "Fonceuse tab active: student answers quickly, Skepsi asks 'Comment tu sais?'"
      - "The exercise text matches what she typed"
    action:
      does: "Reads the Fonceuse preview, clicks Bloque tab, reads it, then clicks 'Assigner'"
    result: "Assignment dialog opens with class pre-selected"
    next: assigned

  - screen: assigned                   # References states/assigned.yaml
    sees:
      - "Confirmation: 'Exercice assigne a 6eme A'"
      - "Due date: Mercredi 7 fevrier, 18h"
      - "25 eleves recevront l'exercice"
    action:
      does: "Clicks 'Voir le tableau de bord'"
    result: "Navigates to class-pulse (cross-feature transition)"
    next: null

outcome: "Mme Dupont created a fractions exercise by typing it directly, previewed how different student types would experience it, and assigned it to her class."

data_consistency:
  # Track key data across steps to ensure consistency
  exercise_text: "Completer les egalites suivantes: a) 1/3 + ... = 1 ..."
  class: "6eme A"
  student_count: 25
  concepts_detected: ["Addition de fractions", "Complement a 1", "Denominateurs communs"]
  due_date: "Mercredi 7 fevrier, 18h"
```

## Key Principles

### 1. Concrete data, not descriptions

```yaml
# Good — specific text the user types or sees
input: |
  Completer les egalites suivantes:
  a) 1/3 + ... = 1

# Bad — describes what happens without specifics
input: "Types a fractions exercise"
```

### 2. Consistent across steps

Data introduced in step 1 must stay consistent in later steps. The `data_consistency` section at the bottom tracks this. If Mme Dupont types "1/3 + ... = 1" in step 1, the preview in step 3 must show that same text.

### 3. Steps reference state files

Every step's `screen` field must correspond to a state file in `states/`. This is how flow scenarios and state files stay connected. If a step needs a screen that doesn't exist yet, flag it.

### 4. Actions are specific

```yaml
# Good — exactly what the user does
does: "Clicks 'Previsualiser'"
does: "Types '1/3 + ... = 1' in the exercise text area"
does: "Selects 'Mathematiques' from the subject dropdown"

# Bad — vague
does: "Fills in the form"
does: "Navigates to preview"
```

### 5. Results describe visible change

```yaml
# Good — what actually changes on screen
result: "Auto-breakdown card appears: 'Skepsi a detecte 3 concepts: Addition de fractions, Complement a 1, Denominateurs communs'"

# Bad — describes internal state
result: "The system processes the exercise"
```

## Cross-Feature Transitions

When a scenario leaves the current feature, note it explicitly:

```yaml
  - screen: assigned
    # ...
    action:
      does: "Clicks 'Voir le tableau de bord'"
    result: "Navigates to class-pulse (cross-feature transition)"
    next: null  # null = leaves this feature
    cross_feature: "class-pulse/states/overview.yaml"
```

## Friction Scenarios

For scenarios that include errors or edge cases, include `friction` on relevant steps:

```yaml
  - screen: form-filled
    sees:
      - "Error message: 'Impossible de detecter des concepts mathematiques dans ce texte'"
    friction:
      type: "detection-failure"
      cause: "Exercise text is ambiguous or non-mathematical"
      recovery: "Teacher edits text to be more explicit, or manually tags concepts"
    action:
      does: "Edits the exercise text to add clearer mathematical notation"
    result: "Auto-breakdown re-runs and succeeds"
    next: form-filled
```
