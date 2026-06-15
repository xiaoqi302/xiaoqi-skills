#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="codex"
DRY_RUN=0

usage() {
  echo "usage: tools/install.sh --target codex|claude|both [--dry-run]" >&2
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --target)
      TARGET="${2:-}"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done

case "$TARGET" in
  codex)
    targets=("$HOME/.codex/skills")
    ;;
  claude)
    targets=("$HOME/.claude/skills")
    ;;
  both)
    targets=("$HOME/.codex/skills" "$HOME/.claude/skills")
    ;;
  *)
    usage
    exit 1
    ;;
esac

"$ROOT_DIR/tools/validate-skills.sh" >/dev/null

for base in "${targets[@]}"; do
  echo "target: $base"
  if [ "$DRY_RUN" = "0" ]; then
    mkdir -p "$base"
  fi

  for skill_dir in "$ROOT_DIR"/skills/*; do
    [ -d "$skill_dir" ] || continue
    name="$(basename "$skill_dir")"
    dest="$base/$name"
    echo "  install $name -> $dest"
    if [ "$DRY_RUN" = "0" ]; then
      rm -rf "$dest"
      cp -R "$skill_dir" "$dest"
    fi
  done
done

if [ "$DRY_RUN" = "1" ]; then
  echo "dry-run: no files changed"
else
  echo "done"
fi
