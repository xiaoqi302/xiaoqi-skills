# Xiaoqi Skills

[English](README.md) | [简体中文](README.zh-CN.md)

A focused creative toolkit for turning AI and technology sources into evidence-aware Chinese writing, clear explanations, and restrained hand-drawn visuals.

Version `0.2.0` contains 12 portable `SKILL.md` workflows for Codex, Claude Code, and compatible agents.

## Install

Clone the repository, then install from the canonical `skills/` directory:

```bash
./tools/install.sh --target codex
./tools/install.sh --target claude
./tools/install.sh --target both
```

Preview without writing:

```bash
./tools/install.sh --target both --dry-run
```

Check whether an installation differs from the repository:

```bash
./tools/install.sh --target codex --check-drift
```

The legacy `xiaoqi-tech-note` and `xiaoqi-parallel-goals` directories are never removed by default. Archive and remove only those managed legacy copies with an explicit flag:

```bash
./tools/install.sh --target codex --prune
```

Existing skills are backed up under `.xiaoqi-skills-backups/` before replacement or pruning.

## Skills

| Skill | Purpose | Output |
|---|---|---|
| `xiaoqi` | Explicit router when the user is unsure which Xiaoqi workflow fits | One selected workflow and next action |
| `xiaoqi-wechat` | Turn verified source material into a publishable Chinese WeChat article | Structured long-form article |
| `xiaoqi-news-brief` | Explain one AI or technology event with source and date boundaries | Fact summary, interpretation, bounded judgment |
| `xiaoqi-deep-explainer` | Explain a paper, system, mechanism, or technical concept at a chosen depth | Layered explanation with examples and limits |
| `xiaoqi-style-review` | Review existing copy for Xiaoqi voice and common AI-writing patterns | Anchored score, priorities, replacement passages |
| `xiaoqi-info-card` | Visualize technical mechanisms, architecture, and data relationships | Cream technical sketchnote prompt or generated card |
| `xiaoqi-white` | Explain one non-complex idea as a minimal Chinese whiteboard card | Single black-and-red explainer card |
| `xiaoqi-topic-note` | Turn one topic into a low-density vertical note image | One 3:4 Chinese topic note |
| `xiaoqi-fable` | Execute an approved Xiaobai future-fable illustration shot | Generated illustration with visual QA |
| `xiaoqi-cover-image` | Develop or generate an article, podcast, or video cover | Three directions or one checked cover |
| `xiaoqi-article-illustrator` | Select illustration moments and route each shot to an execution skill | Article shot list with paragraph anchors |
| `xiaoqi-logo-director` | Direct original product-logo concepts and production handoff | Brief, concepts, checks, and locked master direction |

## Routing boundaries

- Use `xiaoqi-news-brief` for one current event; use `xiaoqi-wechat` for a finished long-form article.
- Use `xiaoqi-deep-explainer` to understand a mechanism; use `xiaoqi-style-review` to diagnose existing copy.
- Use `xiaoqi-info-card` for technical systems and relationships, `xiaoqi-white` for one simple claim, and `xiaoqi-topic-note` for one vertical topic poster.
- Use `xiaoqi-article-illustrator` to plan a full article; use `xiaoqi-fable` to execute selected Xiaobai shots.

## Recommended pipelines

```text
source -> xiaoqi-news-brief -> xiaoqi-wechat -> xiaoqi-style-review
       -> xiaoqi-article-illustrator -> xiaoqi-cover-image
```

```text
paper or mechanism -> xiaoqi-deep-explainer
                   -> xiaoqi-info-card or xiaoqi-white
```

## Validate and build

```bash
./tools/validate-skills.sh
./tools/install.sh --target both --dry-run
./tools/build-skills.sh
```

Build output is restricted to `dist/`. Individual archives and the full versioned bundle are written to `dist/skills/`.

## Source of truth

- `skills/` is the only source of truth.
- Host installations and `dist/` archives are generated copies.
- See [SOURCE_OF_TRUTH.md](SOURCE_OF_TRUTH.md) for migration and maintenance rules.
- See [AGENTS.md](AGENTS.md) for contribution and verification requirements.

## License

MIT
