#!/bin/bash
cp ~/Downloads/asset-manager_*.html ~/Desktop/asset-manager/asset-manager_5.html 2>/dev/null || true
git add -A
git commit -m "update"
git push
echo "✅ デプロイ完了！"
