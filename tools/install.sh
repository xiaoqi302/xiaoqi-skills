#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="codex"
DRY_RUN=0
BACKUP=1
CHECK_DRIFT=0
PRUNE=0

legacy=(
  xiaoqi-tech-note
  xiaoqi-parallel-goals
)

usage() {
  echo "usage: tools/install.sh --target codex|claude|both [--dry-run] [--check-drift] [--prune] [--no-backup]" >&2
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
    --check-drift)
      CHECK_DRIFT=1
      shift
      ;;
    --prune)
      PRUNE=1
      shift
      ;;
    --no-backup)
      BACKUP=0
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

check_target() {
  local base="$1"
  local drift=0
  local skill_dir name dest old

  echo "target: $base"
  for skill_dir in "$ROOT_DIR"/skills/*; do
    [ -d "$skill_dir" ] || continue
    name="$(basename "$skill_dir")"
    dest="$base/$name"
    if [ ! -d "$dest" ]; then
      echo "  missing $name"
      drift=1
    elif diff -qr "$skill_dir" "$dest" >/dev/null 2>&1; then
      echo "  current $name"
    else
      echo "  changed $name"
      drift=1
    fi
  done

  for old in "${legacy[@]}"; do
    if [ -e "$base/$old" ]; then
      echo "  legacy $old"
      drift=1
    fi
  done

  return "$drift"
}

if [ "$CHECK_DRIFT" = "1" ]; then
  drift=0
  for base in "${targets[@]}"; do
    check_target "$base" || drift=1
  done
  if [ "$drift" = "1" ]; then
    echo "drift: run install without --check-drift; add --prune only to archive managed legacy skills" >&2
    exit 1
  fi
  echo "ok: installed skills match the repository"
  exit 0
fi

for base in "${targets[@]}"; do
  echo "target: $base"
  if [ "$DRY_RUN" = "0" ]; then
    mkdir -p "$base"
  fi

  backup_dir=""

  ensure_backup_dir() {
    if [ -z "$backup_dir" ]; then
      mkdir -p "$base/.xiaoqi-skills-backups"
      backup_dir="$(mktemp -d "$base/.xiaoqi-skills-backups/install-$(date +%Y%m%d-%H%M%S).XXXXXX")"
    fi
  }

  for skill_dir in "$ROOT_DIR"/skills/*; do
    [ -d "$skill_dir" ] || continue
    name="$(basename "$skill_dir")"
    dest="$base/$name"
    if [ -d "$dest" ] && diff -qr "$skill_dir" "$dest" >/dev/null 2>&1; then
      echo "  current $name"
      continue
    fi
    echo "  install $name -> $dest"
    if [ "$DRY_RUN" = "0" ]; then
      stage="$(mktemp -d "$base/.xiaoqi-install-$name.XXXXXX")"
      cp -R "$skill_dir" "$stage/$name"
      old_path=""

      if [ -e "$dest" ]; then
        if [ "$BACKUP" = "1" ]; then
          ensure_backup_dir
          old_path="$backup_dir/$name"
          mv "$dest" "$old_path"
          echo "    backup existing -> $backup_dir/$name"
        else
          old_path="$stage/.previous-$name"
          mv "$dest" "$old_path"
        fi
      fi

      if ! mv "$stage/$name" "$dest"; then
        [ -n "$old_path" ] && [ -e "$old_path" ] && mv "$old_path" "$dest"
        rm -rf "$stage"
        echo "error: failed to install $name; previous copy restored" >&2
        exit 1
      fi
      rm -rf "$stage"
    fi
  done

  if [ "$PRUNE" = "1" ]; then
    for old in "${legacy[@]}"; do
      dest="$base/$old"
      [ -e "$dest" ] || continue
      echo "  prune managed legacy $old"
      if [ "$DRY_RUN" = "0" ]; then
        if [ "$BACKUP" = "1" ]; then
          ensure_backup_dir
          mv "$dest" "$backup_dir/$old"
          echo "    backup legacy -> $backup_dir/$old"
        else
          rm -rf "$dest"
        fi
      fi
    done
  fi
done

if [ "$DRY_RUN" = "1" ]; then
  echo "dry-run: no files changed"
else
  echo "done"
fi
