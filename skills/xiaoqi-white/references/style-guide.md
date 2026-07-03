# Xiaoqi White Style Guide

## Visual DNA

- Plain warm white background, like a clean whiteboard or presentation board.
- Thick black handwritten Chinese title at the top.
- Minimal black marker line art, not watercolor.
- Red marker only for key phrase, big arrow, checkmark, or underline.
- Spacious composition with few elements.
- Speech bubbles, rounded task boxes, arrows, checklists, simple icons.
- One bottom conclusion sentence with a wavy underline.
- Clear Chinese lettering; no dense paragraphs.

## Composition Patterns

Choose the clearest pattern for the content:

- `problem -> solution`: left worried person or messy problem, red arrow, right solution boxes.
- `formula`: title, central formula, surrounding labels, bottom takeaway.
- `before/after`: left old way, right new way, red transition arrow.
- `process ladder`: four stacked boxes connected by red arrows.
- `cycle`: circular workflow for feedback loops or systems.

## Prompt Template

```text
Create a clean whiteboard-style Chinese explainer card about: 「{TOPIC}」.

Aspect ratio: {ASPECT_RATIO}.
Target audience: {AUDIENCE}.
Source content summary: {SOURCE_CONTENT}.

Style reference:
Minimalist black marker whiteboard drawing, plain warm white background, no ruled paper, no watercolor, no glossy poster. Thick handwritten black Chinese title, simple black line doodles, red marker accent arrows and emphasis words. Spacious layout, large readable Chinese, casual classroom whiteboard feel.

On-image text, keep exact and readable:
Title: 「{TITLE}」
Red emphasis: 「{RED_EMPHASIS}」
Key boxes:
「{POINT_1}」
「{POINT_2}」
「{POINT_3}」
「{POINT_4}」
Bottom big sentence: 「{BOTTOM_SUMMARY}」

Composition:
{COMPOSITION}. Use simple black line doodles: {DRAWABLE_OBJECTS}. Use red marker only for the main arrow, emphasis phrase, checkmark, or underline.

Text rules:
All Chinese text must be big, crisp, black marker lettering. Use short phrases only. Avoid wrong characters, blurred text, tiny labels, dense paragraphs, watermarks, logos, QR codes, photorealism, notebook lines, blue/yellow marker, 3D rendering, glossy digital poster style, and clutter.

Output: polished whiteboard sketchnote, high resolution.
```

## Defaults

- `AUDIENCE`: `中文社媒读者，中学生也能看懂`
- `ASPECT_RATIO`: `16:9`
- `IMAGE_COUNT`: `5`
- Use 4 key boxes unless the content clearly needs 3 or 5.
- Prefer concrete scenes over abstract icons.

## Quality Bar

- A reader should understand the card in 5 seconds.
- The title and red emphasis must be the strongest visual signals.
- Every card should include at least one person, object, or workflow sketch.
- Keep text sparse; use layout and arrows to explain relationships.
