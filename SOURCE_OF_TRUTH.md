# SOURCE_OF_TRUTH

`xiaoqi-skills` 的唯一真源是本仓库的 `skills/` 目录。当前版本为 `0.2.0`。

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

## 安装漂移

检查 Codex 安装版是否与真源一致：

```bash
./tools/install.sh --target codex --check-drift
```

安装器默认只新增或替换当前 Skill，不删除其它目录。

以下两个旧版名称由 `0.2.0` 管理，但只会在显式传入 `--prune` 时备份并移除：

- `xiaoqi-tech-note`：能力已由 `xiaoqi-info-card`、`xiaoqi-white` 和 `xiaoqi-deep-explainer` 覆盖。
- `xiaoqi-parallel-goals`：不属于小七内容创作套件的当前产品边界。

不要把 `--prune` 扩展成删除所有未知的 `xiaoqi-*` 目录，避免误删用户自定义 Skill。

## 维护边界

- 新增 skill 时，同时补 `SKILL.md`、`agents/openai.yaml`，并更新双语 README、`tools/skill-bridge-map.md` 和 `tools/validate-skills.sh`。
- 删除或改名 skill 时，同步更新安装说明、bridge map、验证脚本和总入口 `skills/xiaoqi/SKILL.md`。
- 不把生成图片、临时实验、未整理 prompt 草稿放进真源。
