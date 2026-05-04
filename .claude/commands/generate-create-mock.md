---
description: Generate a project-specific /create-mock command for UI prototyping with all states
arguments:
  - name: project
    description: Path to the target project (optional, defaults to current directory)
---

# Generate Create-Mock Command

Generate a customized `/create-mock` command for UI prototyping. This meta-command analyzes your codebase's UI patterns, component library, and conventions to produce a tailored mock-creation workflow.

**CRITICAL**: This is a phased workflow. Do NOT skip phases.

---

## Phase 1: UI Stack Analysis

### Step 1.1: Identify UI Framework & Libraries

**Use Task tool with Explore agent** to analyze:

1. **UI Framework**:
   - React, Vue, Svelte, Solid?
   - Next.js, Remix, Nuxt, SvelteKit?
   - SSR, CSR, or hybrid?

2. **Component Library**:
   - Custom components location
   - Third-party UI lib? (shadcn/ui, Radix, MUI, Chakra, etc.)
   - Import patterns (`@/components`, `~/components`, etc.)

3. **Styling Approach**:
   - Tailwind CSS, CSS Modules, Styled Components, etc.
   - Design tokens or theme?
   - Dark mode support?

4. **State Management**:
   - React Query / TanStack Query?
   - SWR, Apollo, tRPC?
   - Zustand, Redux, Jotai?

Document findings:
```
## UI Stack Analysis

### Framework
- Primary: {Next.js/React/Vue/etc}
- Rendering: {SSR/CSR/hybrid}

### Components
- Library: {shadcn-ui/MUI/custom/etc}
- Location: {path}
- Import alias: {@ or ~ or relative}

### Styling
- System: {Tailwind/CSS Modules/etc}
- Theme: {yes/no}

### Data Fetching
- Library: {react-query/swr/etc}
- Patterns: {hooks location}
```

### Step 1.2: Analyze Existing Features

Search for existing UI patterns:

```
Look for:
- Feature folders with multiple component files
- *-skeleton.tsx, *-empty.tsx, *-error.tsx patterns
- Loading state implementations
- Empty state implementations
- Error boundary patterns
- Mock data files
```

If found, extract and document the patterns.

### Step 1.3: Identify Mock Data Patterns

Search for existing mock data:

```
Look for:
- mock-*.ts files
- __mocks__/ directories
- faker/chance usage
- Factory patterns
- Seed data files
```

### Step 1.4: Present Analysis (REQUIRED)

**Use AskUserQuestion** to confirm:

```
Based on my analysis:

**UI Stack**:
- Framework: {detected}
- Components: {library} at {path}
- Styling: {system}
- Data: {library}

**Patterns Found**:
- Skeleton components: {yes/no}
- Empty states: {yes/no}
- Mock data: {pattern or none}

**Questions**:
1. Is there a design system doc I should reference?
2. Do you use a specific mock data library (faker, etc.)?
3. Any specific states you always want covered?
4. Do you have console DevTools for state debugging?
```

**DO NOT proceed until user confirms.**

---

## Phase 2: Define Mock Strategy

### Step 2.1: Component States to Generate

**Standard states** (always generate):
- **Loading/Skeleton**: Placeholder while data fetches
- **Empty**: No data exists
- **Error**: API or data failure
- **Data/Success**: Normal populated state

**Optional states** (based on project):
- **Search Empty**: No search results
- **Filter Empty**: No filter matches
- **Partial**: Some data missing
- **Offline**: No network
- **Permission Denied**: Access restricted

### Step 2.2: Mock Hook Pattern

Based on detected data library, determine mock hook approach:

**If React Query/TanStack**:
```tsx
// Match the useQuery interface exactly
const { data, isLoading, isError, refetch } = useMock('feature', mockData, {
  delay: 800,
});
```

**If SWR**:
```tsx
const { data, error, isLoading, mutate } = useMockSWR('feature', mockData);
```

**If Custom/None**:
```tsx
const [state, setState] = useState({ isLoading: true, data: null, error: null });
// Simulated loading
```

### Step 2.3: DevTools Integration

Determine if console DevTools should be included:

```tsx
// Exposes: mock.featureName.setLoading(true), etc.
const { data, isLoading } = useMockDevTools('featureName', mockData, {
  customControls: (setState) => ({
    setAmount: (n) => setState(s => ({ ...s, data: { ...s.data, amount: n } })),
  }),
});
```

### Step 2.4: User Validation (REQUIRED)

**Use AskUserQuestion**:

```
Here's the planned mock strategy:

**States to Generate**:
{list of states}

**Mock Hook Pattern**:
{code example}

**DevTools**: {yes/no}

**Output Structure**:
{features-path}/{feature-name}/
├── {feature-name}-list.tsx
├── {feature-name}-skeleton.tsx
├── {feature-name}-empty.tsx
├── {feature-name}-error.tsx
├── types.ts
└── mock-data.ts

Questions:
1. Add/remove any states?
2. Approve the mock hook pattern?
3. Include DevTools integration?
4. Any naming convention changes?
```

**DO NOT proceed until approved.**

---

## Phase 3: Detect Design Patterns

### Step 3.1: Read Design Documentation

Search for and read:
- `docs/design/` or `design/` folder
- Component documentation
- Storybook stories
- Pattern libraries

### Step 3.2: Extract Common Patterns

Document reusable patterns:

**Layout Patterns**:
- List view (for collections)
- Card grid (for visual items)
- Form (for input)
- Detail page (for single entity)
- Dashboard section (for metrics)

**Component Patterns**:
- How are cards structured?
- How are lists built?
- What's the empty state pattern?
- How are errors displayed?

### Step 3.3: Import Mapping

Create import reference table:

| Component Type | Import Path |
|---------------|-------------|
| Button | `{ui-import}/button` |
| Card | `{ui-import}/card` |
| Skeleton | `{ui-import}/skeleton` |
| Badge | `{ui-import}/badge` |
| Icons | `{icon-import}` |

---

## Phase 4: Generate Command

### Step 4.1: Create Files

Create `.claude/commands/create-mock.md` with:

**Core Structure**:
```markdown
---
description: Create a UI mock for a feature with all states
arguments:
  - name: spec
    description: Path to spec file (optional)
  - name: name
    description: Feature name in {naming-convention}
---

# Create UI Mock

{Project-specific workflow}

## Pre-Phase: Spec Resolution
{Spec location/creation logic}

## Phase 1: UX Flow & Edge Cases
{Requirements understanding}
{Integration point identification}

## Phase 2: UI Design
{Layout pattern selection}
{Component selection}
{Visual descriptions}

## Phase 3: Implementation
{Code generation with project patterns}
```

### Step 4.2: Include Code Templates

Generate component templates using detected patterns:

**Skeleton Template**:
```tsx
import { Skeleton } from '{ui-import}/skeleton';

export function {Feature}Skeleton() {
  return (
    <div className="{container-class}">
      {/* Template based on detected patterns */}
    </div>
  );
}
```

**Empty State Template**:
```tsx
import { Button } from '{ui-import}/button';
import { {Icon} } from '{icon-import}';

export function {Feature}Empty({ onAdd }) {
  return (
    <div className="{empty-container-class}">
      {/* Template based on detected patterns */}
    </div>
  );
}
```

### Step 4.3: Include Mock Data Template

```tsx
import { faker } from '@faker-js/faker'; // or detected library

export interface {Feature}Item {
  id: string;
  // fields based on typical feature shape
}

export function generate{Feature}(): {Feature}Item {
  return {
    id: faker.string.uuid(),
    // generated fields
  };
}

export function generate{Feature}s(count = 10): {Feature}Item[] {
  return Array.from({ length: count }, generate{Feature});
}
```

### Step 4.4: Include Mock Hook

Based on detected data library:

```tsx
// For React Query style
export function use{Feature}Mock(initialData: {Feature}Item[], options?: MockOptions) {
  const [state, setState] = useState({
    data: initialData,
    isLoading: false,
    isError: false,
    error: null,
  });

  // DevTools integration if enabled

  return {
    ...state,
    refetch: () => { /* simulate refetch */ },
  };
}
```

### Step 4.5: Document Integration Patterns

Include project-specific integration guidance:

```markdown
### Integration into App

**If adding to {typical-location}:**
- Import pattern: {example}
- Route setup: {if applicable}
- Navigation: {if applicable}

**Common locations**:
{list of typical integration points for this project}
```

---

## Phase 5: Create Supporting Files

### Step 5.1: Mock Hook Utility (if not exists)

If no mock utility exists, create one:

`{hooks-path}/use-mock.ts`:
```tsx
// Reusable mock hook matching {detected-data-library} interface
```

### Step 5.2: Design Documentation

If no design docs exist, optionally create:

`.claude/templates/mock-patterns.md`:
```markdown
# UI Mock Patterns

## Standard States
{documented state patterns}

## Component Usage
{component import reference}

## Code Examples
{example implementations}
```

---

## Phase 6: Verify & Finalize

### Step 6.1: Validate Files

Check all files created:
- `.claude/commands/create-mock.md`
- Any supporting templates
- Mock hook utility (if created)

### Step 6.2: Present Summary

```
## Command Generated Successfully

**Files Created**:
- {project}/.claude/commands/create-mock.md
- {any additional files}

**Usage**:
/create-mock spec=path/to/spec.md
/create-mock name=feature-name

**Generated States**:
- Skeleton (loading)
- Empty
- Error
- Data

**Mock Pattern**: {pattern description}
**DevTools**: {enabled/disabled}

**Output Structure**:
{features-path}/{feature-name}/
├── {feature-name}-*.tsx
├── types.ts
└── mock-data.ts

**Next Steps**:
1. Review the generated command
2. Test with a simple feature
3. Add to CLAUDE.md for team awareness
```

---

## Generated Command Template

Base template to be customized:

```markdown
---
description: Create a UI mock with loading, error, empty, and data states
arguments:
  - name: spec
    description: Path to spec file describing the feature (optional)
  - name: name
    description: Feature name in {naming-convention} (optional, derived from spec)
---

# Create UI Mock

Create production-quality UI mocks following a phased approach.

**CRITICAL**: Do NOT skip phases. Each requires user approval.

---

## Pre-Phase: Input Resolution

### If `spec` provided:
- Read spec file
- Extract feature name and requirements
- Continue to Phase 1

### If `name` only:
- Use provided name
- Continue to Phase 1 (will gather requirements)

### If neither:
- Use AskUserQuestion to gather basic info
- Continue to Phase 1

---

## Phase 1: UX Flow & Edge Cases

### Step 1.1: Understand Requirements
{From spec or via questions}

### Step 1.2: Identify Integration Points
Where does this feature live in the app?
- Entry point
- Navigation changes
- Related pages

### Step 1.3: Map User Flows
Document primary user flows.

### Step 1.4: Identify Edge Cases
| Case | Scenario | Expected Behavior |
|------|----------|-------------------|
| Empty | No data | Show empty state |
| Loading | Fetching | Show skeleton |
| Error | API failed | Show error |
| ... | ... | ... |

### Step 1.5: User Validation (REQUIRED)
Present flows and edge cases for approval.

---

## Phase 2: UI Design

### Step 2.1: Choose Layout Pattern
From {design-docs-reference}:
- List view, Card grid, Form, Detail page, etc.

### Step 2.2: Component Selection
Components to use from {component-library}:
- List components needed

### Step 2.3: Visual Description
Describe each state IN WORDS before coding.

### Step 2.4: User Validation (REQUIRED)
Present design choices for approval.

---

## Phase 3: Implementation

### Step 3.1: Read Design System Docs
{References to project design docs}

### Step 3.2: Create Feature Structure
```
{features-path}/{feature-name}/
├── {file-structure}
```

### Step 3.3: Implementation Order
1. Types
2. Mock data
3. Skeleton
4. Empty state
5. List item (if list)
6. Main component

### Step 3.4: Integrate into App
Based on Phase 1 integration plan.

### Step 3.5: Final Verification
- [ ] All edge cases handled
- [ ] UI matches descriptions
- [ ] All states work
- [ ] Feature integrated into app
- [ ] Responsive behavior works

---

## Code Templates

### Mock Hook Usage
{project-specific mock hook example}

### State Handling Pattern
```tsx
if (isLoading) return <FeatureSkeleton />;
if (isError) return <FeatureError onRetry={refetch} />;
if (!data?.length) return <FeatureEmpty onAdd={handleAdd} />;
return <FeatureList items={data} />;
```

### Migration to Backend
{project-specific migration example}
```

---

## Customization Reference

The generator customizes these elements:

1. **{features-path}**: Where feature folders live
2. **{naming-convention}**: kebab-case, PascalCase, etc.
3. **{ui-import}**: Component library import path
4. **{icon-import}**: Icon library import path
5. **{hooks-path}**: Where hooks are stored
6. **{design-docs-reference}**: Path to design documentation
7. **{component-library}**: Name of UI component library
8. **{file-structure}**: Expected files per feature
9. **{mock-pattern}**: How mock data/hooks are structured
10. **{devtools}**: Whether to include DevTools integration
