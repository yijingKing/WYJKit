#!/bin/bash

# 脚本配置
REPO_NAME="WYJKit"
VERSION=$1

if [ -z "$VERSION" ]; then
  echo "❌ 请输入版本号，如：./publish.sh 1.0.3"
  exit 1
fi

# 步骤1：Git 提交并打 Tag
echo "🚀 开始提交 Git..."
git add .
git commit -m "release: $VERSION"
git tag $VERSION
git push origin main
git push origin $VERSION

# 步骤2：校验 podspec
echo "🔍 校验 podspec..."
pod lib lint  --allow-warnings --verbose --no-clean

if [ $? -ne 0 ]; then
  echo "❌ podspec 校验失败"
  exit 1
fi

# 步骤3：发布到 trunk
echo "📦 发布到 CocoaPods..."
pod trunk push  --allow-warnings --verbose

if [ $? -eq 0 ]; then
  echo "✅ 发布成功：${REPO_NAME} ${VERSION}"
else
  echo "❌ 发布失败"
fi
