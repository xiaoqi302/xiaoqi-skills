---
name: xiaoqi-white
description: Create minimalist Chinese Xiaoqi-style whiteboard explainer cards from a topic, article, note, lesson, workflow, product idea, or short explanation. Use when the user asks for Chinese whiteboard knowledge cards, black marker line art, red accent arrows, large readable handwritten Chinese text, formula cards, before/after cards, or process-ladder cards. Default 16:9 unless the user specifies another ratio. Do not use for English technical sketchnotes, Xiaobai fable article illustrations, or full WeChat article rewriting.
user_invocable: true
argument-hint: "中文主题/文章/笔记，可补充比例、张数、重点句"
---

# Xiaoqi White

Create clean Chinese Xiaoqi-style explainer cards: plain white background, black marker handwriting, simple line doodles, red accent arrows, and one clear bottom takeaway.

For visual rules, composition patterns, prompt template, defaults, and quality bar, read [references/style-guide.md](references/style-guide.md) when needed.

## Route Boundary

Use this skill for Chinese-first minimalist whiteboard knowledge cards. Use `xiaoqi-info-card` for warm cream technical sketchnote cards, `xiaoqi-tech-note` for English-first technical diagrams or prompt writing, and `xiaoqi-fable` for Xiaobai narrative article illustrations.

## Workflow

1. Read the source content and identify:
   - one strong hook title
   - one core conclusion
   - 3-5 short key points
   - 3-6 drawable objects or scenes
   - one bottom summary sentence
2. Determine aspect ratio:
   - Default: `16:9`
   - If the user specifies a ratio, use it exactly, such as `1:1`, `4:5`, `16:9`, `9:16`, `3:4`, or a custom ratio.
3. Generate one prompt per requested image.
   - Default image count: 5
   - If the user specifies a number, use that number.
   - Keep the same visual DNA while varying title, composition, examples, and emphasis.
