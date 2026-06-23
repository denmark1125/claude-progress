#!/bin/bash
# ============================================================
#  claude-progress 安裝器
#  把 /上次的進度 和 /存進度 兩個指令裝進 Claude Code
# ============================================================
set -e

# 找到這個腳本所在的資料夾（不管從哪裡執行都正確）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude/commands"

echo "📦 安裝 claude-progress ..."
mkdir -p "$DEST"

for f in "$SCRIPT_DIR"/commands/*.md; do
  name="$(basename "$f")"
  cp "$f" "$DEST/$name"
  echo "  ✓ 已安裝指令：/${name%.md}"
done

# 把進度範本也放到家目錄方便取用（選用）
mkdir -p "$HOME/.claude/templates"
cp "$SCRIPT_DIR/templates/RESUME.template.md" "$HOME/.claude/templates/RESUME.template.md" 2>/dev/null || true

echo ""
echo "✅ 安裝完成！"
echo ""
echo "重開 Claude Code 後就能用："
echo "   /上次的進度            → 顯示最近專案的完整進度"
echo "   /上次的進度 <關鍵字>   → 顯示指定專案的進度"
echo "   /存進度 <這次重點>     → 把目前專案的進度寫進它的 RESUME.md"
echo ""
echo "慣例：每個專案資料夾放一個 RESUME.md，這兩個指令就會自動運作。"
