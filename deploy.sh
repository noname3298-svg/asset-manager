#!/bin/bash
cd ~/Desktop/asset-manager

# ダウンロードフォルダの最新HTMLファイルをコピー
LATEST=$(ls -t ~/Downloads/asset-manager*.html 2>/dev/null | head -1)
if [ -z "$LATEST" ]; then
  echo "❌ ダウンロードフォルダにasset-manager*.htmlが見つかりません"
  exit 1
fi

echo "📄 使用ファイル: $LATEST"
cp "$LATEST" ~/Desktop/asset-manager/asset-manager_5.html

git add -A
git commit -m "update $(date '+%Y-%m-%d %H:%M')"
git push
echo "✅ デプロイ完了！1〜2分後にスマホに反映されます"
