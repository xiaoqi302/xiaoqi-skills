---
name: xiaoqi
description: 小七创作套件总入口。用户要求“小七风格”、公众号文章、AI 科技新闻解读、技术讲人话、手绘信息卡、正文配图、封面图、主题笔记图、Logo 方向、风格审校或不知道该用哪个 xiaoqi skill 时使用；负责识别任务并路由到 xiaoqi-wechat、xiaoqi-news-brief、xiaoqi-deep-explainer、xiaoqi-style-review、xiaoqi-info-card、xiaoqi-white、xiaoqi-topic-note、xiaoqi-fable、xiaoqi-cover-image、xiaoqi-article-illustrator、xiaoqi-logo-director。
---

# Xiaoqi

这是小七创作套件的总入口。你的任务不是直接包办所有输出，而是先判断用户真正要的产物，再使用最合适的 xiaoqi skill。

## 路由表

| 用户意图 | 使用 skill |
|---|---|
| 公众号文章、技术评论、长文改写 | `$xiaoqi-wechat` |
| AI/科技新闻快评、要点解读 | `$xiaoqi-news-brief` |
| 复杂技术、论文、产品机制讲人话 | `$xiaoqi-deep-explainer` |
| 检查文章是否像小七 | `$xiaoqi-style-review` |
| 技术手绘信息卡 | `$xiaoqi-info-card` |
| 白底极简解释卡 | `$xiaoqi-white` |
| 单主题手绘笔记图 | `$xiaoqi-topic-note` |
| 小白寓言风正文配图 | `$xiaoqi-fable` |
| 公众号/文章/播客封面 | `$xiaoqi-cover-image` |
| 长文拆 5-8 张正文配图 | `$xiaoqi-article-illustrator` |
| 产品 Logo 方向 | `$xiaoqi-logo-director` |

## 判断顺序

1. 如果用户点名某个 xiaoqi skill，直接使用它。
2. 如果用户要“写文章/改公众号”，使用 `$xiaoqi-wechat`。
3. 如果用户要“配图/封面/手绘图”，先判断是封面、正文配图、信息卡还是主题笔记。
4. 如果用户只说“小七风格看看”，使用 `$xiaoqi-style-review`。
5. 如果任务横跨多步，先完成文字，再建议配图；不要一次塞满全部流程。

## 输出方式

如果只需要路由，直接说“我会用 `$skill-name`”。如果当前环境会自动触发 skill，就继续执行对应 skill 的工作流。不要解释整套工具箱。
