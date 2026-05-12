#!/bin/bash
cd ~/Desktop/asset-manager

# 最新ファイルを探す
LATEST=$(ls -t ~/Downloads/asset-manager*.html 2>/dev/null | head -1)
if [ -z "$LATEST" ]; then
  echo "❌ ダウンロードフォルダにファイルが見つかりません"
  exit 1
fi

echo "📄 使用ファイル: $LATEST"

# バージョン番号（現在時刻）を埋め込んでコピー
TIMESTAMP=$(date '+%Y%m%d%H%M%S')
sed "s/BUILD_TIME/$TIMESTAMP/g" "$LATEST" > ~/Desktop/asset-manager/asset-manager_5.html

git add -A
git commit -m "update $TIMESTAMP"
git push
echo "✅ デプロイ完了！スマホでアプリを閉じて再度開いてください"
