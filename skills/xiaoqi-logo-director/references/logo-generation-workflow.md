# Logo Generation Workflow

Use this when executing the skill.

## 1. Brief Extraction

From a URL or description, extract:

```text
Product:
Audience:
Promise:
Tone:
Avoid:
```

If browsing a URL, inspect the current site for nouns, product screenshots, interface metaphors, audience, and pricing/positioning. Do not copy the site's current logo unless the user asks for a redesign.

## 2. Motif Invention

Invent 3 motifs before writing prompts.

Good motif:
- describes a mechanism
- can become a symbol
- fits the product specifically

Examples:
- “Context packets snap into a stable execution lane.”
- “A model compresses messy choices into one crisp action.”
- “An assistant keeps multiple tasks aligned around a shared memory.”
- “Creative fragments become reusable interface blocks.”

Bad motif:
- “AI”
- “future”
- “premium”
- “like OpenAI”
- “blue gradient”

## 3. Difference Matrix

Before generating images, write:

```text
A: Motif / Shape family / Color family / Hook
B: Motif / Shape family / Color family / Hook
C: Motif / Shape family / Color family / Hook
```

Use different shape families and color families.

## 4. Prompt Construction

Each image prompt should contain:

1. product context
2. motif
3. shape family
4. shape grammar
5. color family
6. hard exclusions
7. output quality constraints

Prefer shape grammar over adjectives.

Weak:

```text
Make a premium futuristic AI logo.
```

Strong:

```text
one monolithic rounded-square silhouette with one offset slot and one missing token;
flat clear blue and green; no folder tab, no app grid, no star, no knot
```

## 5. Generate One At A Time

Generate each logo as one single image:

```text
one single original logo mark on pure white background
```

Never ask for a 3-logo sheet unless the user explicitly asks. Sheets make comparison cramped and distort perceived quality.

## 6. Critique

After generation:

```text
保留：
淘汰：
问题：
下一步：
```

Be strict. A polished but generic logo is not a success.

## 7. Repair Failed Concepts

If a concept is clean but generic, do not repeat the same prompt with stronger adjectives. Apply a specific mutation.

| Failure | Do This |
|---|---|
| Looks like app launcher / component grid | reduce token count to 3-4, create one outer silhouette, add one non-grid offset |
| Looks like flowchart / process diagram | remove parallel rails, convert to one compact emblem or one monolithic cutout |
| Looks like folder / browser tab | remove rectangular tab semantics, rotate or asymmetrically crop the contour |
| Looks like letter | break the expected reading direction, add one non-letter notch |
| Looks like wave / liquid | replace curves with stepped contour, hard slot, or token rhythm |
| Looks like existing AI brand | change shape family, not just color |

Second-pass prompts must say:

```text
This is a logo mark, not a UI diagram, not an icon set, not a workflow chart.
Use one compact brand symbol with one memorable silhouette.
```

## 8. Lock And Extend

After the user picks a mother mark:
- keep the structure
- do not generate new concepts
- produce colorways and app-icon adaptations
- test black/white and 32px survival
