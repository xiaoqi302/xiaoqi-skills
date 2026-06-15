# SOURCE_OF_TRUTH

`xiaoqi-skills` 的真源是本仓库的 `skills/` 目录。

## 真源目录

```text
skills/
  xiaoqi/
  xiaoqi-wechat/
  xiaoqi-news-brief/
  xiaoqi-deep-explainer/
  xiaoqi-style-review/
  xiaoqi-info-card/
  xiaoqi-white/
  xiaoqi-topic-note/
  xiaoqi-fable/
  xiaoqi-cover-image/
  xiaoqi-article-illustrator/
  xiaoqi-logo-director/
```

## 非真源

以下位置只是安装或构建产物：

- `~/.codex/skills/xiaoqi*`
- `~/.claude/skills/xiaoqi*`
- `dist/skills/*.zip`

不要直接在这些位置长期维护逻辑。需要更新时，改本仓库真源后重新安装或打包。

## 维护边界

- 新增 skill 时，同时补 `SKILL.md`、`agents/openai.yaml`，并更新 `README.md`、`tools/skill-bridge-map.md` 和 `tools/validate-skills.sh`。
- 删除或改名 skill 时，同步更新安装说明、bridge map、验证脚本和总入口 `skills/xiaoqi/SKILL.md`。
- 不把生成图片、临时实验、未整理 prompt 草稿放进真源。
