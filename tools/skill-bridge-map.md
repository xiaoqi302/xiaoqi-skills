# xiaoqi-skills bridge map

`skills/` 是真源，Codex 和 Claude 目录只是 bridge/install target。

| Skill | Source | Codex target | Claude target |
|---|---|---|---|
| `xiaoqi` | `skills/xiaoqi` | `~/.codex/skills/xiaoqi` | `~/.claude/skills/xiaoqi` |
| `xiaoqi-research-dossier` | `skills/xiaoqi-research-dossier` | `~/.codex/skills/xiaoqi-research-dossier` | `~/.claude/skills/xiaoqi-research-dossier` |
| `xiaoqi-wechat` | `skills/xiaoqi-wechat` | `~/.codex/skills/xiaoqi-wechat` | `~/.claude/skills/xiaoqi-wechat` |
| `xiaoqi-news-brief` | `skills/xiaoqi-news-brief` | `~/.codex/skills/xiaoqi-news-brief` | `~/.claude/skills/xiaoqi-news-brief` |
| `xiaoqi-deep-explainer` | `skills/xiaoqi-deep-explainer` | `~/.codex/skills/xiaoqi-deep-explainer` | `~/.claude/skills/xiaoqi-deep-explainer` |
| `xiaoqi-style-review` | `skills/xiaoqi-style-review` | `~/.codex/skills/xiaoqi-style-review` | `~/.claude/skills/xiaoqi-style-review` |
| `xiaoqi-content-repurpose` | `skills/xiaoqi-content-repurpose` | `~/.codex/skills/xiaoqi-content-repurpose` | `~/.claude/skills/xiaoqi-content-repurpose` |
| `xiaoqi-info-card` | `skills/xiaoqi-info-card` | `~/.codex/skills/xiaoqi-info-card` | `~/.claude/skills/xiaoqi-info-card` |
| `xiaoqi-white` | `skills/xiaoqi-white` | `~/.codex/skills/xiaoqi-white` | `~/.claude/skills/xiaoqi-white` |
| `xiaoqi-topic-note` | `skills/xiaoqi-topic-note` | `~/.codex/skills/xiaoqi-topic-note` | `~/.claude/skills/xiaoqi-topic-note` |
| `xiaoqi-fable` | `skills/xiaoqi-fable` | `~/.codex/skills/xiaoqi-fable` | `~/.claude/skills/xiaoqi-fable` |
| `xiaoqi-cover-image` | `skills/xiaoqi-cover-image` | `~/.codex/skills/xiaoqi-cover-image` | `~/.claude/skills/xiaoqi-cover-image` |
| `xiaoqi-article-illustrator` | `skills/xiaoqi-article-illustrator` | `~/.codex/skills/xiaoqi-article-illustrator` | `~/.claude/skills/xiaoqi-article-illustrator` |
| `xiaoqi-visual-qa` | `skills/xiaoqi-visual-qa` | `~/.codex/skills/xiaoqi-visual-qa` | `~/.claude/skills/xiaoqi-visual-qa` |
| `xiaoqi-logo-director` | `skills/xiaoqi-logo-director` | `~/.codex/skills/xiaoqi-logo-director` | `~/.claude/skills/xiaoqi-logo-director` |

Use `tools/install.sh --target both` to refresh both host directories from the same source.

Use `tools/install.sh --target codex --check-drift` to compare an installed copy without writing. Managed legacy names are archived only with the explicit `--prune` flag.
