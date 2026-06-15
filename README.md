# xiaoqi-skills

小七创作套件：把 AI/科技新闻、复杂技术、公众号文章和手绘配图，做成一套可复用的 Agent skills。

首版包含 12 个精品 skill，适合 Codex、Claude Code 以及其它支持 `SKILL.md` 的 Agent 工作流。

## 安装

### Codex

```bash
./tools/install.sh --target codex
```

### Claude Code

```bash
./tools/install.sh --target claude
```

### 同时安装到 Codex 和 Claude

```bash
./tools/install.sh --target both
```

### 只预览安装动作

```bash
./tools/install.sh --target both --dry-run
```

## 工具箱

| Skill | 用途 | 典型触发词 | 产出 |
|---|---|---|---|
| `xiaoqi` | 总入口和路由 | 小七风格、不知道用哪个 | 推荐并转入合适 skill |
| `xiaoqi-wechat` | 公众号文章成稿 | 公众号文章、小七风格、技术评论 | 完整中文长文 |
| `xiaoqi-news-brief` | AI/科技新闻快评 | 新闻解读、帮我看看这条消息 | 事实摘要 + 趋势判断 |
| `xiaoqi-deep-explainer` | 复杂技术讲人话 | 讲明白、解释论文、机制 | 分层解释 + 例子 + 边界 |
| `xiaoqi-style-review` | 风格审校 | 像不像小七、去 AI 味 | 评分 + 修改建议 + 替换片段 |
| `xiaoqi-info-card` | 技术手绘信息卡 | 技术图解、信息卡 | 米白底技术 sketchnote |
| `xiaoqi-white` | 白底极简解释卡 | 白板风、极简卡片 | 黑线红标手绘知识卡 |
| `xiaoqi-topic-note` | 单主题笔记图 | 主题笔记图、手绘主题笔记 | 竖版 3:4 中文笔记图 |
| `xiaoqi-fable` | 小白寓言风配图 | 小白、寓言、黑白手绘 | 未来寓言风正文配图 |
| `xiaoqi-cover-image` | 文章封面 | 公众号封面、文章头图 | 3 个封面方向 + 提示词 |
| `xiaoqi-article-illustrator` | 长文正文配图 | 给文章配图、shot list | 5-8 张配图规划 + 提示词 |
| `xiaoqi-logo-director` | 产品 Logo 方向 | Logo、大厂感、AI 产品 | brief + 3 个方向 + 评估 |

## 推荐工作流

```text
新闻/资料
  -> xiaoqi-news-brief
  -> xiaoqi-wechat
  -> xiaoqi-style-review
  -> xiaoqi-article-illustrator
  -> xiaoqi-cover-image
```

```text
技术/论文/产品机制
  -> xiaoqi-deep-explainer
  -> xiaoqi-info-card 或 xiaoqi-white
```

```text
产品想法
  -> xiaoqi-deep-explainer
  -> xiaoqi-logo-director
  -> xiaoqi-cover-image
```

## 本地构建

生成每个 skill 的独立 zip 和总包：

```bash
./tools/build-skills.sh
```

产物在 `dist/skills/`。

## 验证

```bash
./tools/validate-skills.sh
```

验证内容包括：

- 12 个 skill 是否齐全。
- 每个 `SKILL.md` 是否有合法 frontmatter。
- `name` 是否和目录名一致。
- 每个 skill 是否有 `agents/openai.yaml`。
- README 是否列出所有 skill。

## 设计原则

- 小七风格优先：讲人话、有判断、结构清楚、不过度营销。
- `SKILL.md` 保持精简，详细风格放在 `references/`。
- 不绑定具体图像 API；默认输出可直接用于任意图像工具的提示词。
- 仓库里的 `skills/*` 是真源，安装目录只是复制结果。

## License

MIT
