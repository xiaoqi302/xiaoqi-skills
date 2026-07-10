---
name: xiaoqi
description: 小七创作套件的显式路由入口。仅在用户明确调用 $xiaoqi、点名“小七总入口/路由”，或表示不知道该选哪个 xiaoqi skill 时使用；若用户已经明确要公众号文章、新闻快评、技术解释、风格审校或某类视觉产物，直接使用对应叶子 skill，不触发本入口。
---

# Xiaoqi

只负责识别产物并路由，不替代叶子 skill 完成专业工作流。

## 路由表

| 用户要的产物 | 使用 skill |
|---|---|
| 公众号文章、技术评论、长文重组 | `$xiaoqi-wechat` |
| AI/科技新闻快评、消息解读 | `$xiaoqi-news-brief` |
| 复杂技术、论文或产品机制解释 | `$xiaoqi-deep-explainer` |
| 现有文本的小七风格审校 | `$xiaoqi-style-review` |
| 技术手绘信息卡 | `$xiaoqi-info-card` |
| 白底极简解释卡 | `$xiaoqi-white` |
| 单主题手绘笔记图 | `$xiaoqi-topic-note` |
| 小白寓言风单张正文配图 | `$xiaoqi-fable` |
| 公众号、文章或播客封面 | `$xiaoqi-cover-image` |
| 长文的多张正文配图规划 | `$xiaoqi-article-illustrator` |
| 产品 Logo 方向 | `$xiaoqi-logo-director` |

## 路由规则

1. 用户点名叶子 skill 时，直接使用该 skill。
2. 一个明确产物只选择一个主 skill；不要把整套工具箱同时展开。
3. 任务横跨多步时，只执行用户当前要求的阶段；确需串联时使用最短链路。
4. 仅当不同选择会明显改变结果时，询问一个必要问题；否则直接选择。

## 输出

用一句话说明“将使用 $skill-name”。环境支持加载或调用该 Skill 时，立即执行对应工作流；无法加载时，给出可直接调用的 `$skill-name` 和一条完整任务提示，不要停在口头声明。不要介绍完整路由表，也不要附加未被请求的后续服务。
