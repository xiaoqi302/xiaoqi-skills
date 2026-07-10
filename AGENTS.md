# AGENTS.md

本仓库是 `xiaoqi-skills` 的真源仓库。任何 Agent 修改本仓库时，按以下规则执行。

## 基本规则

- 中文回复，简洁直接。
- 优先保持 `skills/*` 的结构稳定，不做无关重构。
- `skills/<skill-name>/SKILL.md` 只放核心工作流和必要路由信息。
- 详细风格、模板、检查表放到 `references/`，避免把 `SKILL.md` 写成大文档。
- `SKILL.md` frontmatter 只允许 `name` 和 `description`。
- `agents/openai.yaml` 只放 UI 元数据，不承载长期逻辑。

## 真源规则

- `skills/` 是唯一真源。
- `~/.codex/skills` 和 `~/.claude/skills` 只是安装结果，不在那里长期维护逻辑。
- 如果修改 skill，先改本仓库，再通过 `tools/install.sh` 安装到宿主目录。

## 验证规则

提交前运行：

```bash
./tools/validate-skills.sh
./tools/install.sh --target both --dry-run
./tools/build-skills.sh
```

如果修改了安装脚本，额外检查 dry-run 输出是否不会写入用户目录。
如果本机已安装 Xiaoqi Skills，再运行 `./tools/install.sh --target codex --check-drift`；预期漂移必须在提交说明中交代。

验证器必须覆盖 `agents/openai.yaml` 的 `$skill-name`、简介长度、资源引用、占位文件和总路由完整性，不能只检查字段是否存在。

## 提交规则

提交信息必须包含问题描述、复现路径或修复思路之一。推荐格式：

```text
feat: improve xiaoqi skill validation

问题描述：...
复现路径：...
修复思路：...
```
