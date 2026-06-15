#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"
OUT_DIR="${1:-"$ROOT_DIR/dist/skills"}"

command -v zip >/dev/null 2>&1 || {
  echo "error: zip is required" >&2
  exit 1
}

"$ROOT_DIR/tools/validate-skills.sh" >/dev/null

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

for skill_dir in "$ROOT_DIR"/skills/*; do
  [ -d "$skill_dir" ] || continue
  name="$(basename "$skill_dir")"
  archive="$OUT_DIR/$name.zip"
  (
    cd "$skill_dir"
    zip -qr "$archive" . -x "*.DS_Store" "*/__pycache__/*"
  )
  echo "built $archive"
done

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

mkdir -p "$stage/xiaoqi-skills-$VERSION"
cp "$ROOT_DIR/README.md" "$stage/xiaoqi-skills-$VERSION/README.md"
cp "$ROOT_DIR/AGENTS.md" "$stage/xiaoqi-skills-$VERSION/AGENTS.md"
cp "$ROOT_DIR/LICENSE" "$stage/xiaoqi-skills-$VERSION/LICENSE"
cp "$ROOT_DIR/SOURCE_OF_TRUTH.md" "$stage/xiaoqi-skills-$VERSION/SOURCE_OF_TRUTH.md"
cp "$ROOT_DIR/VERSION" "$stage/xiaoqi-skills-$VERSION/VERSION"
cp -R "$ROOT_DIR/skills" "$stage/xiaoqi-skills-$VERSION/skills"
cp -R "$ROOT_DIR/tools" "$stage/xiaoqi-skills-$VERSION/tools"

(
  cd "$stage"
  zip -qr "$OUT_DIR/xiaoqi-skills-$VERSION.zip" "xiaoqi-skills-$VERSION" -x "*.DS_Store" "*/__pycache__/*"
)

echo "built $OUT_DIR/xiaoqi-skills-$VERSION.zip"
