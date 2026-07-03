---
name: xiaoqi-info-card
description: Create warm cream technical sketchnote cards for AI/ML papers, engineering workflows, architecture concepts, algorithms, product mechanisms, or educational explanations. Use when the user asks for a polished technical info card, handdrawn AI explainer, paper mechanism card, architecture card, before/after panel, pipeline card, or multiple visual prompt options. Default 16:9, English or mixed technical labels unless Chinese is requested. Do not use for pure Chinese whiteboard cards, Xiaobai fable article illustrations, or WeChat article rewriting.
user_invocable: true
argument-hint: "technical topic/source text, optional audience, ratio, image count, Chinese/English"
---

# Xiaoqi Info Card

Create polished technical sketchnote cards in the style of AI/ML explainer diagrams: warm cream canvas, bold handdrawn title, black ink line art, pastel highlight blocks, rounded process boxes, arrows, equations, and a concise bottom takeaway.

For detailed visual rules, use [references/style-guide.md](references/style-guide.md). For the reusable prompt shape, use [references/prompt-template.md](references/prompt-template.md).

## Route Boundary

Use this skill for technical concept cards where the output should feel like a polished AI/ML explainer. Use `xiaoqi-tech-note` for looser whiteboard diagrams and prompt writing, `xiaoqi-white` for minimalist Chinese whiteboard cards, and `xiaoqi-fable` for Xiaobai article illustrations.

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
