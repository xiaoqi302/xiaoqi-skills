#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"
REQUESTED_OUT="${1:-dist/skills}"

usage() {
  echo "usage: tools/build-skills.sh [dist/output-directory]" >&2
}

[ "$#" -le 1 ] || {
  usage
  exit 1
}

case "/$REQUESTED_OUT/" in
  *"/../"*|*"/./"*)
    echo "error: output path must not contain . or .. segments" >&2
    exit 1
    ;;
esac

case "$REQUESTED_OUT" in
  /*) OUT_DIR="$REQUESTED_OUT" ;;
  *) OUT_DIR="$ROOT_DIR/$REQUESTED_OUT" ;;
esac
OUT_DIR="${OUT_DIR%/}"

case "$OUT_DIR" in
  "$ROOT_DIR"/dist/*) ;;
  *)
    echo "error: output directory must be inside $ROOT_DIR/dist" >&2
    exit 1
    ;;
esac

command -v zip >/dev/null 2>&1 || {
  echo "error: zip is required" >&2
  exit 1
}

"$ROOT_DIR/tools/validate-skills.sh" >/dev/null

mkdir -p "$ROOT_DIR/dist"
stage="$(mktemp -d "$ROOT_DIR/dist/.build-$VERSION.XXXXXX")"
trap 'rm -rf "$stage"' EXIT
stage_out="$stage/output"
mkdir -p "$stage_out"

for skill_dir in "$ROOT_DIR"/skills/*; do
  [ -d "$skill_dir" ] || continue
  name="$(basename "$skill_dir")"
  archive="$stage_out/$name.zip"
  (
    cd "$skill_dir"
    zip -qr "$archive" . -x "*.DS_Store" "*/__pycache__/*"
  )
  echo "built $name.zip"
done

bundle="$stage/xiaoqi-skills-$VERSION"
mkdir -p "$bundle"
cp "$ROOT_DIR/README.md" "$bundle/README.md"
cp "$ROOT_DIR/README.zh-CN.md" "$bundle/README.zh-CN.md"
cp "$ROOT_DIR/AGENTS.md" "$bundle/AGENTS.md"
cp "$ROOT_DIR/LICENSE" "$bundle/LICENSE"
cp "$ROOT_DIR/SOURCE_OF_TRUTH.md" "$bundle/SOURCE_OF_TRUTH.md"
cp "$ROOT_DIR/VERSION" "$bundle/VERSION"
cp -R "$ROOT_DIR/skills" "$bundle/skills"
cp -R "$ROOT_DIR/tools" "$bundle/tools"

(
  cd "$stage"
  zip -qr "$stage_out/xiaoqi-skills-$VERSION.zip" "xiaoqi-skills-$VERSION" -x "*.DS_Store" "*/__pycache__/*"
)

rm -rf "$OUT_DIR"
mv "$stage_out" "$OUT_DIR"
echo "built $OUT_DIR/xiaoqi-skills-$VERSION.zip"
