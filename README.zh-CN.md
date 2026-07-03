# Xiaoqi Skills

[English](README.md) | [简体中文](README.zh-CN.md)

小七风格 Codex skills 合集，用于中文内容创作、技术解释图、文章配图和并行任务规划。

## Skills

| Skill | 适用场景 |
| --- | --- |
| `xiaoqi-wechat` | 把素材改写成小七公众号文章，并规划封面和正文配图。 |
| `xiaoqi-fable` | 为中文文章生成小白 IP / 未来寓言风配图。 |
| `xiaoqi-tech-note` | 生成小七风格手绘技术解释图和图像提示词。 |
| `xiaoqi-info-card` | 生成米白底、偏 AI/ML 和工程机制的技术信息卡。 |
| `xiaoqi-white` | 生成中文白板知识卡。 |
| `xiaoqi-parallel-goals` | 把任务整理成 brief、顶层目标、并行子目标和最终汇总。 |

## 安装

克隆仓库后，把需要的 skill 复制到 Codex skills 目录：

```bash
git clone https://github.com/xiaoqi302/xiaoqi-skills.git
cp -R xiaoqi-skills/skills/xiaoqi-tech-note ~/.codex/skills/
```

安装全部：

```bash
cp -R xiaoqi-skills/skills/xiaoqi-* ~/.codex/skills/
```

## 目录

```text
skills/
  xiaoqi-fable/
  xiaoqi-info-card/
  xiaoqi-parallel-goals/
  xiaoqi-tech-note/
  xiaoqi-wechat/
  xiaoqi-white/
```

## 许可证

MIT
