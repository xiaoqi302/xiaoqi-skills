---
name: xiaoqi-info-card
description: Use when the user wants to turn a technical topic, AI/ML paper idea, engineering workflow, architecture concept, algorithm, product mechanism, or educational explanation into a handdrawn technical sketchnote card with warm cream background, black marker diagrams, pastel highlights, flow arrows, before/after panels, and optional aspect ratio.
---

# Xiaoqi Info Card

Create polished technical sketchnote cards in the style of AI/ML explainer diagrams: warm cream canvas, bold handdrawn title, black ink line art, pastel highlight blocks, rounded process boxes, arrows, equations, and a concise bottom takeaway.

For detailed visual rules, use [references/style-guide.md](references/style-guide.md).

## Workflow

1. Read the source content and extract:
   - one sharp technical title
   - one core mechanism or insight
   - 3-5 steps, phases, components, or comparisons
   - 3-8 drawable objects, icons, or diagrams
   - one bottom takeaway sentence
2. Determine aspect ratio:
   - Default: `16:9`
   - Use the user's requested ratio exactly if specified, such as `3:4`, `4:5`, `1:1`, `9:16`, `16:9`, or a custom ratio.
3. Choose the layout:
   - `before-after`: old approach vs new approach
   - `pipeline`: inputs -> model/tool -> output
   - `loop`: state/action/reward/update cycle
   - `three-phase`: step 1, step 2, step 3 panels
   - `architecture`: labeled boxes connected by arrows
   - `gap`: left side works, right side fails or is unresolved
4. Generate one prompt per image.
   - Default image count: 5
   - If the user specifies a number, use that number.
   - Keep terminology accurate, but keep on-image text sparse.

## Prompt Template

```text
Create a handdrawn technical sketchnote card about: "{TOPIC}".

Aspect ratio: {ASPECT_RATIO}.
Target audience: {AUDIENCE}.
Source content summary: {SOURCE_CONTENT}.

Style:
Warm cream/off-white background. Clean black marker line art. Bold handdrawn title at the top. Use soft pastel highlight swashes behind key title words: pale blue, mint green, peach, lavender. Use rounded boxes with thin black outlines, dashed boundary boxes, simple arrows, and small doodle icons. Keep a polished AI/ML explainer diagram look, like a technical concept drawn on a clean cream board.

On-image text, keep exact and readable:
Title: "{TITLE}"
Highlighted phrase: "{HIGHLIGHT_PHRASE}"
Section labels:
1. "{POINT_1}"
2. "{POINT_2}"
3. "{POINT_3}"
4. "{POINT_4}"
Bottom takeaway: "{BOTTOM_TAKEAWAY}"

Composition:
Use a {LAYOUT_TYPE} layout. Draw: {DRAWABLE_OBJECTS}. Use arrows to show causal flow or before/after change. Use pastel fills only to group concepts or emphasize important numbers. Keep all labels large and legible.

Text rules:
Use short English or mixed Chinese-English technical labels when appropriate. Avoid dense paragraphs, tiny handwriting, incorrect formulas, fake logos, watermarks, QR codes, photorealism, glossy poster style, 3D rendering, clutter, and random decorative elements.

Output: high-resolution polished handdrawn technical explainer sketchnote.
```

## Defaults

- `AUDIENCE`: `technical readers, AI/ML builders, product-minded engineers`
- `ASPECT_RATIO`: `16:9`
- `IMAGE_COUNT`: `5`
- Prefer English technical labels for AI/ML topics unless the user asks for Chinese.
- Use one strong title, 3-4 main zones, and one bottom takeaway.
- Include simple people only when they clarify the workflow.

## Quality Bar

- The card should teach the main idea in 5-10 seconds.
- The title and highlighted phrase must carry the hook.
- Arrows must explain the relationship, not decorate the canvas.
- Use pastel color sparingly for grouping and emphasis.
- Technical claims should stay conservative and match the source.
