---
name: xiaoqi-tech-note
description: Create or refine prompts and generated images for Xiaoqi-style warm hand-drawn technical diagrams, whiteboard sketches, AI/Agent/MCP/DevOps/SaaS workflows, product architecture explainers, token visuals, and research summaries. Use for technical diagrams, visual explanations, image prompts, cartoon workflows, Xiaoqi tech notes, or generated explainer images. Default 16:9 and English-only visible text unless Chinese or bilingual output is requested. Do not use for Xiaobai fable illustrations, Chinese whiteboard cards, or WeChat rewriting.
user_invocable: true
argument-hint: "technical concept/source text, optional ratio, language, prompt-only or generate"
---

# Xiaoqi Tech Note

## Goal

Create clear, warm, hand-drawn technical explainer diagrams that make engineering, AI, product, workflow, or research ideas understandable at a glance.

## Route Boundary

Use this skill for technical explanation diagrams and image prompts. Use `xiaoqi-info-card` for polished cream technical cards, `xiaoqi-white` for Chinese whiteboard cards, and `xiaoqi-fable` for Xiaobai article illustrations.

## Default Rules

- Default `16:9`; follow any user-specified ratio exactly.
- English-only visible text by default; use Chinese or bilingual text only when requested.
- Keep text large, sparse, and mobile-readable.
- Prefer 2-4 sections, 5-10 short labels, 3-6 arrows, warm off-white paper, black imperfect ink, simple icons, and soft pastel highlights.
- Avoid photorealism, 3D, glossy corporate UI, cyberpunk, anime, neon, heavy gradients, and clutter.

## Reference Files

Read only what the task needs:

- `references/style-guide.md`: visual identity, typography, palette, icons, characters, arrows, and negative prompt.
- `references/composition-templates.md`: reusable layouts such as comparison, feedback loop, four pathways, concept ladder, recursive flywheel, and multi-agent systems.
- `references/prompt-template.md`: prompt formula plus English and Chinese examples.
- `references/quality-checklist.md`: text and visual checks before final delivery.
- `assets/reference-images/`: style calibration only; borrow paper feel, line quality, spacing, and annotation mood, not content or composition.

## Workflow

1. Extract the one main point. Split overloaded concepts into multiple images.
2. Convert source text into short labels; by default translate Chinese source into concise English labels.
3. Pick a simple composition: comparison, three-part explanation, flow, mental model map, concept ladder, recursive loop, or single-vs-many agents.
4. If the user asks for a prompt, provide a ready-to-use image prompt. If they ask to generate, call image generation directly when the topic is clear.
5. Check `references/quality-checklist.md` for generated images or high-stakes prompt work; simplify if text is crowded, misspelled, too small, accidentally mixed-language, or cluttered.

## Output Style

When replying to the user:

- Be brief.
- Mention whether the output is English, Chinese, or bilingual.
- If generating multiple options, keep each option distinct in composition, not just color.
- Do not explain the whole style theory unless the user asks.
