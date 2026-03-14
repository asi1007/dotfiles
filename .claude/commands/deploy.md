---
description: /deploy コマンド - git commit, git push, clasp push を順番に実行するデプロイワークフロー
alwaysApply: true
---

# /deploy コマンド

ユーザが `/deploy` と入力した場合、以下の手順を順番に実行する。

## 手順

1. `git status` と `git diff` で変更内容を確認する
2. 変更内容を要約した簡潔なコミットメッセージを日本語で作成する
3. `git add .` で全変更をステージングする
4. `git commit` でコミットする
5. `git push` でリモートにプッシュする
6. `clasp push` で Google Apps Script にデプロイする
7. 各ステップの成功/失敗を報告する

## 注意事項

- コミットメッセージはユーザに確認せず、変更内容から自動生成する
- エラーが発生した場合はその時点で停止し、状況を報告する
- `.claspignore` や `.gitignore` の設定を尊重する
