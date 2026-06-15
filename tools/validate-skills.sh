#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
README="$ROOT_DIR/README.md"

expected=(
  xiaoqi
  xiaoqi-wechat
  xiaoqi-news-brief
  xiaoqi-deep-explainer
  xiaoqi-style-review
  xiaoqi-info-card
  xiaoqi-white
  xiaoqi-topic-note
  xiaoqi-fable
  xiaoqi-cover-image
  xiaoqi-article-illustrator
  xiaoqi-logo-director
)

fail() {
  echo "error: $*" >&2
  exit 1
}

[ -f "$README" ] || fail "README.md is missing"

count="$(find "$ROOT_DIR/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')"
[ "$count" = "${#expected[@]}" ] || fail "expected ${#expected[@]} skills, found $count"

for name in "${expected[@]}"; do
  dir="$ROOT_DIR/skills/$name"
  skill="$dir/SKILL.md"
  agent="$dir/agents/openai.yaml"

  [ -d "$dir" ] || fail "missing skill directory: $name"
  [ -f "$skill" ] || fail "missing SKILL.md: $name"
  [ -f "$agent" ] || fail "missing agents/openai.yaml: $name"

  first="$(sed -n '1p' "$skill")"
  [ "$first" = "---" ] || fail "$name frontmatter must start with ---"

  end_line="$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$skill")"
  [ -n "$end_line" ] || fail "$name frontmatter is not closed"

  frontmatter="$(sed -n "2,$((end_line - 1))p" "$skill")"
  echo "$frontmatter" | grep -q "^name: $name$" || fail "$name frontmatter name mismatch"
  echo "$frontmatter" | grep -q "^description: " || fail "$name missing description"

  extra_keys="$(echo "$frontmatter" | grep -E '^[a-zA-Z_][a-zA-Z0-9_-]*:' | grep -Ev '^(name|description):' || true)"
  [ -z "$extra_keys" ] || fail "$name frontmatter has unsupported keys: $extra_keys"

  grep -q "\`$name\`" "$README" || fail "README does not mention $name"
done

echo "ok: validated ${#expected[@]} skills"
