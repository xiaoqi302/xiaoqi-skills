# Prompt Template

## Formula

Use this structure for generated images:

```text
Create a 16:9 hand-drawn technical explainer diagram about [TOPIC].

Style:
warm off-white paper background, subtle paper texture, hand-drawn whiteboard sketch, black imperfect ink lines, simple cartoon characters, rounded boxes, casual arrows, handwritten English labels, pastel highlight colors, clean educational layout.

Language:
English-only text by default. No Chinese text unless explicitly requested.

Composition:
[left vs right / flow / three sections / comparison / four pathways / recursive loop]

Content:
[main title]
[subtitle]
[section labels]
[short text labels]
[icons and characters]
[bottom takeaway]

Rules:
large readable text, minimal words, clear visual hierarchy, medium-low information density, no photorealism, no glossy corporate UI, no tiny text, no clutter.
```

## English Example

```text
Create a 16:9 hand-drawn technical explainer diagram about why AI agents waste tokens during tool exploration.

Use a warm off-white paper background, black imperfect hand-drawn ink lines, simple cartoon developer and confused AI agent, rounded boxes, casual arrows, and pastel highlight colors.

Language:
English-only. No Chinese text.

Layout:
Top section: "Human Developer" sees a complete dashboard with Auth, Tables, Storage, RLS, and Functions.
Bottom section: "AI Agent" has to discover each part separately through scattered MCP tool calls.

Add short labels:
"I can see everything"
"I have to discover each piece"
"Multiple calls"
"Incomplete picture"
"Tokens wasted"

Use simple icons:
key for Auth, table for Database, bucket for Storage, shield for RLS, lightning for Functions, robot for AI Agent.

Make the image feel like a friendly whiteboard sketch from an engineer's notebook. Large readable handwritten text, minimal words, clear comparison, no photorealism, no glossy UI, no tiny text.
```

## Research Paper Example

```text
Create a 16:9 hand-drawn technical explainer diagram based on a research paper about the transition from AGI to ASI.

Style:
warm off-white paper background, hand-drawn whiteboard sketch, black imperfect ink lines, simple cartoon robots, rounded boxes, casual arrows, handwritten English labels, soft pastel highlights.

Language:
English-only. No Chinese text.

Title:
From AGI to ASI

Subtitle:
Four Possible Pathways

Composition:
Place a friendly AGI robot on the left.
Place four stacked pathway boxes in the center.
Place a glowing ASI destination badge on a hill on the right.
Use arrows from AGI through the pathways toward ASI.

Pathway labels:
1. Scaling - Compute, models, and data keep growing
2. Paradigm Shift - New architectures, new algorithms
3. Recursive Improvement - AI improves AI
4. Group Agents - Many AGIs form a super-organization

Bottom takeaway:
These pathways may happen in parallel

Rules:
large readable text, minimal words, clean hierarchy, no tiny text, no dense paragraphs, no photorealism, no glossy UI.
```

## Chinese Example

Use only when the user explicitly asks for Chinese.

```text
画一张 16:9 手绘技术解释图，主题是：为什么 AI Agent 在调用工具时容易浪费 token。

风格：
暖白色纸张背景，手绘白板草图风格，黑色不完美墨线，简单漫画人物，圆角信息框，手写字体，柔和低饱和配色，像工程师在笔记本上画的解释图。

语言：
中文。文字尽量少而大。

构图：
上半部分是“人类开发者”，可以直接看到完整的 Dashboard，包括 Auth、Tables、Storage、RLS、Functions。
下半部分是“AI Agent”，只能通过多个 MCP 工具调用一点点探索系统状态。

文字：
“我能看到全局”
“我得一点点找”
“多次调用”
“信息不完整”
“上下文浪费”

图标：
钥匙代表 Auth，表格代表数据库，水桶代表 Storage，盾牌代表 RLS，闪电代表 Functions，机器人代表 AI Agent。

要求：
字大、内容少、结构清楚、手机上也能看清。不要写实，不要赛博朋克，不要复杂 UI，不要小字，不要拥挤。
```
