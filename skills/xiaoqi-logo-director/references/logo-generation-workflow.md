# Logo Generation Workflow

Use this when executing the skill.

## Contents

- [1. Brief Extraction](#1-brief-extraction)
- [2. Motif Invention](#2-motif-invention)
- [3. Difference Matrix](#3-difference-matrix)
- [4. Prompt Construction](#4-prompt-construction)
- [5. Generate One At A Time](#5-generate-one-at-a-time)
- [6. Critique](#6-critique)
- [7. Repair Failed Concepts](#7-repair-failed-concepts)
- [8. Lock And Extend](#8-lock-and-extend)
- [9. Production And Clearance Boundary](#9-production-and-clearance-boundary)

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

Only enter this section when the user asks to generate or make the logo. Invoke the available image-generation tool for each direction as one single image:

```text
one single original logo mark on pure white background
```

Never ask for a 3-logo sheet unless the user explicitly asks. Sheets make comparison cramped and distort perceived quality.

After each generation, inspect the actual image with the available visual-viewing tool. Record its source path or asset identifier so a selected mark can be reused as the master instead of reconstructed from text.

## 6. Critique

After visually inspecting the generated artifact, apply every gate in `evaluation-gates.md`:

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
- treat the selected source image as the only master
- keep the exact silhouette, proportions, cuts, gaps, and negative space
- do not redraw it with a text-only generation prompt
- use reference-image editing, deterministic composition, or manual/vector tracing
- produce colorways and app-icon previews without changing the core geometry
- create and visually inspect `32px`, monochrome, dark-background reverse, and `16px/32px` favicon previews
- reject an adaptation if geometry drifts from the selected master

## 9. Production And Clearance Boundary

Generated images are raster concept art even when the prompt says `vector-like`. Do not claim that an SVG, production vector, or complete identity system exists until the mark has been deterministically traced and checked.

The collision gates are design screening only. They are not a trademark search, registration opinion, freedom-to-operate review, or legal clearance. For commercial launch, state that jurisdiction-specific trademark and similar-device searches remain separate work.
