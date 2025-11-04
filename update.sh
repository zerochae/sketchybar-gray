#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "  SketchyBar Gray - Update Script"
echo "=========================================="
echo ""

cd "$SCRIPT_DIR" || {
  echo "❌ 디렉토리 이동 실패"
  exit 1
}

echo "📂 현재 디렉토리: $SCRIPT_DIR"
echo ""

if [ ! -d ".git" ]; then
  echo "❌ Git 저장소가 아닙니다"
  exit 1
fi

echo "🔄 변경사항 확인 중..."
git fetch origin

BEHIND=$(git rev-list HEAD..origin/master --count 2>/dev/null)

if [ -z "$BEHIND" ] || [ "$BEHIND" -eq 0 ]; then
  echo "✅ 이미 최신 버전입니다"
  exit 0
fi

echo "📦 업데이트 가능: ${BEHIND}개의 새로운 커밋"
echo ""

if git diff-index --quiet HEAD --; then
  echo "🔽 업데이트 다운로드 중..."
  if git pull origin master; then
    echo ""
    echo "✅ 업데이트 완료!"
    echo ""
    echo "🔄 SketchyBar를 재시작합니다..."
    sketchybar --reload
    echo ""
    echo "✨ 모든 작업이 완료되었습니다"
  else
    echo ""
    echo "❌ 업데이트 실패"
    exit 1
  fi
else
  echo "⚠️  로컬 변경사항이 있습니다"
  echo ""
  echo "다음 중 하나를 선택하세요:"
  echo "  1) 로컬 변경사항을 유지하고 업데이트 (git stash + git pull)"
  echo "  2) 로컬 변경사항을 버리고 업데이트 (git reset --hard + git pull)"
  echo "  3) 취소"
  echo ""
  read -p "선택 (1/2/3): " choice

  case $choice in
    1)
      echo "💾 로컬 변경사항 임시 저장 중..."
      git stash
      echo "🔽 업데이트 다운로드 중..."
      git pull origin master
      echo "📤 로컬 변경사항 복구 중..."
      git stash pop
      echo ""
      echo "✅ 업데이트 완료!"
      echo ""
      echo "🔄 SketchyBar를 재시작합니다..."
      sketchybar --reload
      ;;
    2)
      echo "⚠️  로컬 변경사항을 삭제합니다..."
      git reset --hard HEAD
      echo "🔽 업데이트 다운로드 중..."
      git pull origin master
      echo ""
      echo "✅ 업데이트 완료!"
      echo ""
      echo "🔄 SketchyBar를 재시작합니다..."
      sketchybar --reload
      ;;
    3)
      echo "❌ 업데이트를 취소했습니다"
      exit 0
      ;;
    *)
      echo "❌ 잘못된 선택입니다"
      exit 1
      ;;
  esac
fi

echo ""
echo "=========================================="
