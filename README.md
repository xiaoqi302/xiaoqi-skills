# Xiaoqi Skills

[English](README.md) | [简体中文](README.zh-CN.md)

A small collection of Xiaoqi-style Codex skills for Chinese content, visual explainers, article illustrations, and parallel task planning.

## Skills

| Skill | Use it for |
| --- | --- |
| `xiaoqi-wechat` | Rewrite source material into Xiaoqi-style Chinese WeChat articles, then plan cover and article illustrations. |
| `xiaoqi-fable` | Generate Xiaobai IP / future-fable style illustrations for Chinese articles. |
| `xiaoqi-tech-note` | Create warm hand-drawn technical explainer diagrams and image prompts. |
| `xiaoqi-info-card` | Create polished cream technical sketchnote cards for AI/ML and engineering topics. |
| `xiaoqi-white` | Create minimalist Chinese whiteboard knowledge cards. |
| `xiaoqi-parallel-goals` | Turn a task into a filled brief, top-level goal, parallel agent goals, and final synthesis. |

## Install

Clone the repository, then copy the skill you want into your Codex skills directory:

```bash
git clone https://github.com/xiaoqi302/xiaoqi-skills.git
cp -R xiaoqi-skills/skills/xiaoqi-tech-note ~/.codex/skills/
```

To install all skills:

```bash
cp -R xiaoqi-skills/skills/xiaoqi-* ~/.codex/skills/
```

## Layout

```text
skills/
  xiaoqi-fable/
  xiaoqi-info-card/
  xiaoqi-parallel-goals/
  xiaoqi-tech-note/
  xiaoqi-wechat/
  xiaoqi-white/
```

## License

MIT
