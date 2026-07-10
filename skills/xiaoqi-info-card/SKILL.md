---
name: xiaoqi-info-card
description: 将技术机制、系统架构、算法流程、组件依赖或数据关系转成手绘技术图解卡。用于解释系统如何工作、模块如何连接、数据如何流动、方案如何对比或论文机制如何运转；不用于非复杂技术的单观点极简卡、只给一个主题的 3:4 笔记图或整篇文章的配图选点，后者分别交给 xiaoqi-white、xiaoqi-topic-note、xiaoqi-article-illustrator。
---

# 小七技术机制图解

把一个可验证的技术结构压缩成一张手绘图解卡。一张图只讲一个机制、架构或数据关系，不把宽泛观点硬拆成伪流程。

详细视觉规则与质检办法见 [references/style-guide.md](references/style-guide.md)。

## 工作流

1. 从用户材料中提取：一个准确标题、一个核心关系、3-5 个节点、节点间方向和一个底部结论。保留原术语、数字与因果边界；材料不足时删减，不补造公式或关系。
2. 选择最能解释关系的结构：`pipeline`、`architecture`、`loop`、`before-after`、`three-phase` 或 `gap`。
3. 默认生成 `1` 张、比例 `16:9`；只在用户明确要求时生成多张或更换比例。
4. 区分交付模式：
   - 用户要求“生成 / 做图 / 出图”且环境有图像工具：实际生成图片。
   - 用户明确只要提示词，或环境没有图像工具：输出完整可执行提示词，并标注“仅提示词”；不要声称已经生成图片。
5. 实际生成时使用当前环境可用的图像生成工具，不绑定具体供应商。生成后查看真实成图，并按参考清单检查技术关系、文字、构图与风格。
6. 检查未通过时优先局部编辑，否则重生成；每张图最多修复 `2` 轮。两轮后仍有问题，交付最优版本并明确剩余问题。
7. 安全落盘：优先采用用户给出的绝对输出目录；相对目录必须先基于绝对工作区根解析，并确认结果仍在工作区内；未指定目录时保存到 `<绝对工作区根>/assets/xiaoqi-info-card/`。使用不覆盖的文件名；若没有可确定的工作区，保留工具返回的原始绝对路径，不向未知目录复制。

## 提示词骨架

```text
Create one hand-drawn technical sketchnote card about "{TOPIC}".

Aspect ratio: {ASPECT_RATIO}.
Audience: {AUDIENCE}.
Verified source summary: {SOURCE_CONTENT}.

Use a warm cream background, clean black marker line art, sparse pastel highlights,
rounded process boxes and meaningful arrows. Use a {LAYOUT_TYPE} composition.

Keep this on-image text exact and readable:
Title: "{TITLE}"
Node labels: "{POINT_1}", "{POINT_2}", "{POINT_3}"{OPTIONAL_POINTS}
Bottom takeaway: "{BOTTOM_TAKEAWAY}"

Draw: {DRAWABLE_OBJECTS}.
Show these verified relations: {RELATIONS}.

Avoid dense paragraphs, tiny labels, invented formulas or numbers, fake logos,
watermarks, QR codes, photorealism, glossy posters, 3D rendering and decorative arrows.
Output one high-resolution technical explainer card.
```

## 默认值

- `AUDIENCE`：技术读者、AI/ML 构建者、产品与工程人员。
- `ASPECT_RATIO`：`16:9`。
- `IMAGE_COUNT`：`1`。
- AI/ML 术语默认保留常用英文；其余文字跟随用户语言。

## 交付

- 实际生成：给出用途、绝对文件路径、检查结果与仍存在的问题。
- 仅提示词：只给完整提示词和建议比例，不虚构文件路径。
