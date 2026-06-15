#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
README="$ROOT_DIR/README.md"
SOURCE_OF_TRUTH="$ROOT_DIR/SOURCE_OF_TRUTH.md"
AGENTS="$ROOT_DIR/AGENTS.md"
BRIDGE_MAP="$ROOT_DIR/tools/skill-bridge-map.md"

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
[ -f "$SOURCE_OF_TRUTH" ] || fail "SOURCE_OF_TRUTH.md is missing"
[ -f "$AGENTS" ] || fail "AGENTS.md is missing"
[ -f "$BRIDGE_MAP" ] || fail "tools/skill-bridge-map.md is missing"

if grep -R -n -E 'ian-xiaohei|topic-note-image|ai-logo-generator|capiworker|user_invocable|argument-hint|metadata:' "$ROOT_DIR/skills" "$README" "$BRIDGE_MAP" >/tmp/xiaoqi-validate-banned.$$ 2>/dev/null; then
  cat /tmp/xiaoqi-validate-banned.$$ >&2
  rm -f /tmp/xiaoqi-validate-banned.$$
  fail "found stale dependency names or unsupported frontmatter keys"
fi
rm -f /tmp/xiaoqi-validate-banned.$$

count="$(find "$ROOT_DIR/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')"
[ "$count" = "${#expected[@]}" ] || fail "expected ${#expected[@]} skills, found $count"

for name in "${expected[@]}"; do
  dir="$ROOT_DIR/skills/$name"
  skill="$dir/SKILL.md"
  agent="$dir/agents/openai.yaml"

  [ -d "$dir" ] || fail "missing skill directory: $name"
  [ -f "$skill" ] || fail "missing SKILL.md: $name"
  [ -f "$agent" ] || fail "missing agents/openai.yaml: $name"
  grep -q "^interface:" "$agent" || fail "$name agents/openai.yaml missing interface"
  grep -q "display_name:" "$agent" || fail "$name agents/openai.yaml missing display_name"
  grep -q "short_description:" "$agent" || fail "$name agents/openai.yaml missing short_description"
  grep -q "default_prompt:" "$agent" || fail "$name agents/openai.yaml missing default_prompt"

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
  grep -q "\`$name\`" "$BRIDGE_MAP" || fail "bridge map does not mention $name"
  grep -q "$name/" "$SOURCE_OF_TRUTH" || fail "SOURCE_OF_TRUTH does not mention $name"

  refs="$(grep -Eo '`(references|assets|examples)/[^`]+`' "$skill" | tr -d '\`' || true)"
  if [ -n "$refs" ]; then
    while IFS= read -r ref; do
      [ -n "$ref" ] || continue
      [ -e "$dir/$ref" ] || fail "$name references missing file: $ref"
    done <<< "$refs"
  fi
done

echo "ok: validated ${#expected[@]} skills"
