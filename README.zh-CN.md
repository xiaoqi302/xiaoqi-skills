# Xiaoqi Skills

[English](README.md) | [简体中文](README.zh-CN.md)

小七创作套件：把 AI、科技资料和复杂技术，转成有事实边界的中文内容、清晰解释与克制的手绘视觉。

`0.2.0` 版本包含 12 个可移植的 `SKILL.md` 工作流，适用于 Codex、Claude Code 及其他兼容 Agent。

## 安装

克隆仓库后，从唯一真源 `skills/` 安装：

```bash
./tools/install.sh --target codex
./tools/install.sh --target claude
./tools/install.sh --target both
```

只预览，不写入：

```bash
./tools/install.sh --target both --dry-run
```

检查安装版是否与仓库不同：

```bash
./tools/install.sh --target codex --check-drift
```

旧版 `xiaoqi-tech-note` 和 `xiaoqi-parallel-goals` 不会被默认删除。只有显式执行下面的命令，才会备份并移除这两个受管理的旧 Skill：

```bash
./tools/install.sh --target codex --prune
```

替换或清理前，已有 Skill 会备份到目标目录的 `.xiaoqi-skills-backups/`。

## Skill 清单

| Skill | 用途 | 产出 |
|---|---|---|
| `xiaoqi` | 用户不知道选哪个工作流时显式调用 | 选择一个主 Skill 并继续执行 |
| `xiaoqi-wechat` | 把经过核实的素材写成中文公众号文章 | 结构完整的长文成稿 |
| `xiaoqi-news-brief` | 解读一条 AI/科技事件并控制来源、日期边界 | 事实摘要、人话解释、有边界的判断 |
| `xiaoqi-deep-explainer` | 按读者层级解释论文、系统、机制或技术概念 | 分层解释、例子与局限 |
| `xiaoqi-style-review` | 审校现有文稿的小七风格与常见 AI 腔 | 有锚点的评分、优先修改和替换片段 |
| `xiaoqi-info-card` | 呈现技术机制、架构、流程和数据关系 | 米白底技术图解提示词或成图 |
| `xiaoqi-white` | 用极简白板卡解释一个非复杂观点 | 单张黑线红标中文解释卡 |
| `xiaoqi-topic-note` | 把一个主题转成低密度竖版笔记图 | 单张 3:4 中文主题笔记 |
| `xiaoqi-fable` | 执行已经确定的小白未来寓言配图 shot | 经过视觉检查的正文配图 |
| `xiaoqi-cover-image` | 规划或生成文章、播客、视频封面 | 3 个方向或 1 张检查后的封面 |
| `xiaoqi-article-illustrator` | 为整篇文章选择配图位置并路由执行 Skill | 带段落锚点的 shot list |
| `xiaoqi-logo-director` | 设计原创产品 Logo 方向并完成生产交接 | brief、候选方向、检查与锁定母版 |

## 路由边界

- 单条时效新闻用 `xiaoqi-news-brief`；可发布长文用 `xiaoqi-wechat`。
- 理解技术机制用 `xiaoqi-deep-explainer`；诊断已有文稿用 `xiaoqi-style-review`。
- 技术系统和关系用 `xiaoqi-info-card`，单观点极简解释用 `xiaoqi-white`，单主题竖版图用 `xiaoqi-topic-note`。
- 整篇文章选点用 `xiaoqi-article-illustrator`；确定后的单张小白配图由 `xiaoqi-fable` 执行。

## 推荐工作流

```text
资料 -> xiaoqi-news-brief -> xiaoqi-wechat -> xiaoqi-style-review
     -> xiaoqi-article-illustrator -> xiaoqi-cover-image
```

```text
论文或机制 -> xiaoqi-deep-explainer
           -> xiaoqi-info-card 或 xiaoqi-white
```

## 验证与构建

```bash
./tools/validate-skills.sh
./tools/install.sh --target both --dry-run
./tools/build-skills.sh
```

构建输出被限制在 `dist/` 内；独立 Skill 压缩包和完整版本包默认写入 `dist/skills/`。

## 真源规则

- `skills/` 是唯一真源。
- 本机安装目录和 `dist/` 都只是生成副本。
- 迁移与维护规则见 [SOURCE_OF_TRUTH.md](SOURCE_OF_TRUTH.md)。
- Agent 修改与验证要求见 [AGENTS.md](AGENTS.md)。

## License

MIT
