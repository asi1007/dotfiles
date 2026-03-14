---
name: amazon-listing-creator
description: Use when Amazon商品の出品登録情報を作成してGoogle Sheetsに入力する必要がある場合。「出品登録」「商品ページ作成」「リスティング作成」などのキーワードがトリガー。
---

# Amazon出品登録情報作成

Amazon商品ページのURLから出品登録に必要な情報を生成し、Google Sheetsに入力するスキル。

## 実行手順

### Step 1: Amazon商品ページから情報取得

1. ユーザーから提供されたAmazon商品URL（`amazon.co.jp/dp/ASIN`）をWebFetchで取得
2. 以下の情報を抽出:
   - 商品名、ブランド名、価格、箇条書き（bullet points）
   - サイズ・寸法、重量、素材、カラー
   - ASIN、カテゴリ、原産国、メーカー名
   - パッケージ内容、その他仕様

### Step 2: 出品登録データ生成

ブランド名は **ｂｅｎｒｉｉ**（全角）を使用。以下の項目を生成:

| 項目 | 生成ルール |
|------|-----------|
| 商品タイプ | Amazonカテゴリに対応する値（例: STORAGE_BAG, PICTURE_FRAME） |
| SKU | `SKU-YYYYMMDDHHmmss` 形式で自動生成 |
| 商品名 | `ｂｅｎｒｉｉ` + 商品特徴キーワード（80文字以内） |
| ブランド名 | `ｂｅｎｒｉｉ` |
| 商品説明文 | 商品仕様 + 安心の国内企業テンプレート |
| 箇条書き1-4 | 商品の特徴（絵文字+【見出し】+説明文） |
| 箇条書き5 | 安心の国内企業テンプレート（固定） |
| 検索キーワード | 主要検索語をスペース区切り |
| メーカー名 | `ｂｅｎｒｉｉ` |
| 原産国 | `CN`（中国の場合） |
| カラー | 商品に応じた色 |
| メーカー希望小売価格・定価 | `0` |
| 危険物規制 | `not_applicable` |

#### 箇条書き5（固定テンプレート）
```
🇯🇵【安心の国内企業】ｂｅｎｒｉｉは安心安全の国内企業。1年間の保証付き！ 商品は万全の状態で発送しておりますが、万が一、不良品がございましたら、誠意をもってご対応いたします。お手数ですが、ご連絡いただければ返金交換等の対応をさせていただきます
```

#### 商品説明文テンプレート（末尾固定）
```
🇯🇵【安心の国内企業】ｂｅｎｒｉｉは安心安全の国内企業。1年間の保証付き！
商品は万全の状態で発送しておりますが、万が一、不良品がございましたら、誠意をもってご対応いたします。お手数ですが、ご連絡いただければ返金交換等の対応をさせていただきます。
```

### Step 3: Google Sheetsへの入力

1. gspreadとoauth2clientを使用（`pip install gspread oauth2client`）
2. サービスアカウント: `/Users/wadaatsushi/Documents/automation/auto-order/service_account.json`
   - メール: `auto-order@corded-guild-461323-e1.iam.gserviceaccount.com`
   - アクセス権がない場合、ユーザーにスプレッドシートへの共有を依頼
3. スプレッドシートの「出品登録」シート（gid=1176077009）を対象
4. A列（1列目）のキーに対応する値をB列（2列目）に入力

#### Google Sheets書き込みコードパターン
```python
import gspread
from oauth2client.service_account import ServiceAccountCredentials

scope = [
    "https://spreadsheets.google.com/feeds",
    "https://www.googleapis.com/auth/drive",
]
sa = "/Users/wadaatsushi/Documents/automation/auto-order/service_account.json"
creds = ServiceAccountCredentials.from_json_keyfile_name(sa, scope)
client = gspread.authorize(creds)
spreadsheet = client.open_by_url(sheet_url)

# gidでワークシートを特定
for ws in spreadsheet.worksheets():
    if ws.id == target_gid:
        worksheet = ws
        break

# バッチ更新
cells = [gspread.Cell(row + 1, 2, value) for row, value in data.items()]
worksheet.update_cells(cells)
```

### Step 4: 確認事項の報告

以下の項目はWebFetchで取得できない場合が多いため、ユーザーに確認を促す:
- 販売価格
- EAN/JANコード
- ブラウズカテゴリID
- パッケージ寸法・重さ（実測値が必要）

## スプレッドシートURL

デフォルト: `https://docs.google.com/spreadsheets/d/17912ZavieMsAtGXw5-s3cp4sbYDpA9XVirdgYJ_HzNw/edit?gid=1176077009#gid=1176077009`

## 注意事項

- WebFetchではAmazonページのJavaScriptレンダリングコンテンツが取得できないことが多い。取得できた情報で最善のデータを生成する
- 寸法の単位はcm、重さの単位はgでスプレッドシートに入力
- 品目の寸法とパッケージの寸法は異なるため注意
