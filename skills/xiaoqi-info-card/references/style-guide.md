# Technical Sketch Card Style Guide

## Scope

- Use this style for mechanisms, architecture, pipelines, dependencies, comparisons, and data relations.
- Do not invent a technical structure for a general opinion.
- Keep one card focused on one relationship model.

## Core Look

- Warm cream or off-white background, not pure white.
- Black handdrawn marker lines, slightly imperfect but clean.
- Big handwritten title at the top; underline or highlight the key phrase.
- Pastel highlights: pale blue, mint green, peach, soft lavender, light yellow.
- Thin black outlines, rounded rectangles, dashed grouping boxes.
- Small doodle icons: brain, laptop, document, calculator, globe, trophy, chart, warning sign, clock, checkmark, X mark.
- Use light fill colors inside boxes to separate concepts.

## Common Layouts

- `Before / After`: left is bulky, slow, manual, or confused; right is compressed, automated, cleaner, or faster.
- `Three Steps`: three columns with numbered circles and arrows between them.
- `Agent Loop`: agent on left, environment on right, arrows for action, reward, and new state.
- `Pipeline`: source boxes feed into a central model/system, then produce scores, updates, or output.
- `Architecture`: central box with surrounding modules such as policy, critic, reward model, reference model.
- `Gap`: verifiable tasks on one side, no-gold-answer tasks on the other.

## Text Style

- Prefer short, readable labels over paragraphs.
- Use mixed English technical phrasing when useful: `Policy`, `Reward Model`, `Critic`, `Verifier`, `Trajectory`, `Updated weights`.
- Put the takeaway in one handwritten sentence along the bottom.
- For numbers, make the key number visually large: `32x`, `0.82`, `Reward: 1`, `4x model size`.

## Avoid

- Dense academic text blocks.
- Too many colors.
- Real brand logos.
- Tiny illegible labels.
- Photorealistic people or objects.
- Glossy UI/card design.
- Random decorative shapes unrelated to the explanation.
- Invented arrows, formulas, metrics, module names, or causal claims.

## Visual QA

Check the actual rendered image, not only the prompt:

- **Technical fidelity**: every node, direction, number, and comparison matches the source.
- **Relationship clarity**: arrows encode flow, dependency, feedback, or change; none are decorative.
- **Hierarchy**: title is first, the core mechanism second, and the takeaway third.
- **Legibility**: labels are large and exact; no garbled terms, formulas, or tiny prose.
- **Density**: use 3-5 main nodes and enough negative space to read the mechanism quickly.
- **Style**: retain cream paper, black marker lines, restrained pastel grouping, and no glossy UI.

## Repair Order

1. Correct wrong text, numbers, formulas, nodes, and arrow directions.
2. Remove surplus labels or decorative arrows.
3. Enlarge the mechanism and restore whitespace.
4. Regenerate only when local editing cannot restore fidelity.

Stop after two repair rounds per image and disclose any remaining defect.
