#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
README="$ROOT_DIR/README.md"
README_ZH="$ROOT_DIR/README.zh-CN.md"
SOURCE_OF_TRUTH="$ROOT_DIR/SOURCE_OF_TRUTH.md"
AGENTS="$ROOT_DIR/AGENTS.md"
BRIDGE_MAP="$ROOT_DIR/tools/skill-bridge-map.md"
VERSION_FILE="$ROOT_DIR/VERSION"

expected=(
  xiaoqi
  xiaoqi-research-dossier
  xiaoqi-wechat
  xiaoqi-news-brief
  xiaoqi-deep-explainer
  xiaoqi-style-review
  xiaoqi-content-repurpose
  xiaoqi-info-card
  xiaoqi-white
  xiaoqi-topic-note
  xiaoqi-fable
  xiaoqi-cover-image
  xiaoqi-article-illustrator
  xiaoqi-visual-qa
  xiaoqi-logo-director
)

fail() {
  echo "error: $*" >&2
  exit 1
}

[ -f "$README" ] || fail "README.md is missing"
[ -f "$README_ZH" ] || fail "README.zh-CN.md is missing"
[ -f "$SOURCE_OF_TRUTH" ] || fail "SOURCE_OF_TRUTH.md is missing"
[ -f "$AGENTS" ] || fail "AGENTS.md is missing"
[ -f "$BRIDGE_MAP" ] || fail "tools/skill-bridge-map.md is missing"
[ -f "$VERSION_FILE" ] || fail "VERSION is missing"
grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$' "$VERSION_FILE" || fail "VERSION must use semantic versioning"
grep -q 'README.zh-CN.md' "$README" || fail "README.md must link to README.zh-CN.md"
grep -q 'README.md' "$README_ZH" || fail "README.zh-CN.md must link to README.md"

tmp_banned="$(mktemp "${TMPDIR:-/tmp}/xiaoqi-validate-banned.XXXXXX")"
if find "$ROOT_DIR/skills" -name SKILL.md -exec grep -nH -E 'ian-xiaohei|topic-note-image|ai-logo-generator|capiworker|user_invocable|argument-hint|metadata:' {} + >"$tmp_banned" 2>/dev/null; then
  cat "$tmp_banned" >&2
  rm -f "$tmp_banned"
  fail "found stale dependency names or unsupported frontmatter keys"
fi
rm -f "$tmp_banned"

count="$(find "$ROOT_DIR/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')"
[ "$count" = "${#expected[@]}" ] || fail "expected ${#expected[@]} skills, found $count"

for name in "${expected[@]}"; do
  dir="$ROOT_DIR/skills/$name"
  skill="$dir/SKILL.md"
  agent="$dir/agents/openai.yaml"

  [ -d "$dir" ] || fail "missing skill directory: $name"
  [ -f "$skill" ] || fail "missing SKILL.md: $name"
  [ -f "$agent" ] || fail "missing agents/openai.yaml: $name"
  [ "$(grep -c '^interface:$' "$agent" || true)" = "1" ] || fail "$name agents/openai.yaml must have one interface block"

  display_name="$(sed -n 's/^  display_name: "\(.*\)"$/\1/p' "$agent")"
  short_description="$(sed -n 's/^  short_description: "\(.*\)"$/\1/p' "$agent")"
  default_prompt="$(sed -n 's/^  default_prompt: "\(.*\)"$/\1/p' "$agent")"
  [ -n "$display_name" ] || fail "$name agents/openai.yaml needs a quoted display_name"
  [ "$display_name" != "$name" ] || fail "$name display_name must be human-facing, not the raw slug"
  [ -n "$short_description" ] || fail "$name agents/openai.yaml needs a quoted short_description"
  short_length="$(printf '%s' "$short_description" | wc -m | tr -d ' ')"
  [ "$short_length" -ge 25 ] && [ "$short_length" -le 64 ] || fail "$name short_description must be 25-64 characters, found $short_length"
  [ -n "$default_prompt" ] || fail "$name agents/openai.yaml needs a quoted default_prompt"
  case "$default_prompt" in
    *"\$$name"*) ;;
    *) fail "$name default_prompt must explicitly include \$$name" ;;
  esac

  if [ "$name" = "xiaoqi" ]; then
    grep -q '^policy:$' "$agent" || fail "xiaoqi router must declare an explicit invocation policy"
    grep -q '^  allow_implicit_invocation: false$' "$agent" || fail "xiaoqi router must disable implicit invocation"
  fi

  first="$(sed -n '1p' "$skill")"
  [ "$first" = "---" ] || fail "$name frontmatter must start with ---"

  end_line="$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$skill")"
  [ -n "$end_line" ] || fail "$name frontmatter is not closed"

  frontmatter="$(sed -n "2,$((end_line - 1))p" "$skill")"
  echo "$frontmatter" | grep -q "^name: $name$" || fail "$name frontmatter name mismatch"
  echo "$frontmatter" | grep -q '^description: ' || fail "$name missing description"

  extra_keys="$(echo "$frontmatter" | grep -E '^[a-zA-Z_][a-zA-Z0-9_-]*:' | grep -Ev '^(name|description):' || true)"
  [ -z "$extra_keys" ] || fail "$name frontmatter has unsupported keys: $extra_keys"

  grep -q "\`$name\`" "$README" || fail "README.md does not mention $name"
  grep -q "\`$name\`" "$README_ZH" || fail "README.zh-CN.md does not mention $name"
  grep -q "\`$name\`" "$BRIDGE_MAP" || fail "bridge map does not mention $name"
  grep -q "$name/" "$SOURCE_OF_TRUTH" || fail "SOURCE_OF_TRUTH does not mention $name"

  placeholder="$(find "$dir" -type f \( -iname '*placeholder*' -o -iname '*go-here*' \) -print -quit)"
  [ -z "$placeholder" ] || fail "$name contains placeholder resource: $placeholder"

  refs="$({
    find "$dir" -type f -name '*.md' -exec grep -hoE '`(references|assets|examples)/[^`<>{}*]+`' {} + 2>/dev/null | tr -d '\`'
    find "$dir" -type f -name '*.md' -exec grep -hoE '\]\((references|assets|examples)/[^)#<>{}* ]+' {} + 2>/dev/null | sed 's/^](//'
  } | sort -u || true)"
  if [ -n "$refs" ]; then
    while IFS= read -r ref; do
      [ -n "$ref" ] || continue
      [ -e "$dir/$ref" ] || fail "$name references missing file: $ref"
    done <<< "$refs"
  fi

  lines="$(wc -l < "$skill" | tr -d ' ')"
  [ "$lines" -lt 500 ] || fail "$name SKILL.md should stay under 500 lines"
done

for name in "${expected[@]}"; do
  [ "$name" = "xiaoqi" ] && continue
  grep -q "\`\$$name\`" "$ROOT_DIR/skills/xiaoqi/SKILL.md" || fail "xiaoqi router does not mention \$$name"
done

echo "ok: validated ${#expected[@]} skills"
