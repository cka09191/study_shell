# 🐚 study_shell — インタラクティブ・シェル学習ツール

**「[シェル・ワンライナー160本ノック](https://gihyo.jp/book/2021/978-4-297-12267-6)」** をベースとしたインタラクティブなシェル学習リポジトリです。
ターミナルでコマンドを試しながら、実践的にシェルスクリプトを学ぶことができます。

> An interactive shell learning tool based on [shellgei/shellgei160](https://github.com/shellgei/shellgei160).
> Practice shell commands in your terminal and get instant feedback!

---

## 📦 セットアップ / Setup

```bash
git clone https://github.com/cka09191/study_shell.git
cd study_shell
chmod +x study.sh
```

必要なコマンド / Requirements: `bash`, `grep`, `awk`, `sed`, `sort`, `uniq`, `cut`, `tr`, `wc`, `head`, `tail`（標準 Unix ツール / standard Unix tools）

---

## 🚀 使い方 / Usage

### インタラクティブメニュー / Interactive menu (recommended)

```bash
./study.sh
```

メニューから以下の操作ができます / From the menu you can:

| 選択 | 内容 |
|------|------|
| `1` | 最初から全問題を解く / Start all exercises from the beginning |
| `2` | 未解答の問題だけ解く / Continue with unsolved exercises only |
| `3` | 問題番号を指定して開く / Jump to a specific exercise |
| `4` | 問題一覧と進捗を確認 / View exercise list and progress |
| `5` | 進捗をリセット / Reset progress |
| `q` | 終了 / Quit |

### 直接起動 / Direct launch

```bash
./study.sh --exercise 5    # 問題5を直接開く / Open exercise 5 directly
./study.sh --list          # 問題一覧を表示 / List all exercises
./study.sh --progress      # 進捗を確認 / Show progress
./study.sh --reset         # 進捗をリセット / Reset progress
./study.sh --help          # ヘルプを表示 / Show help
```

---

## 📝 問題画面の操作 / Exercise controls

問題が表示されたら、シェルコマンドを入力して Enter で実行します。
When an exercise is shown, type your shell command and press Enter to run it.

| コマンド | 動作 |
|---------|------|
| （コマンド入力）| コマンドを実行して正解と比較 / Run command and compare with expected |
| `h` | ヒントを表示（最大3回）/ Show hint (up to 3 times) |
| `a` | 解答を表示して次へ / Show answer and continue |
| `s` または `n` | スキップして次の問題へ / Skip to next exercise |
| `l` | 問題一覧を表示 / Show exercise list |
| `q` | 終了 / Quit |

---

## 📚 収録問題一覧 / Exercise List

| # | カテゴリ | 問題 |
|---|---------|------|
| 01 | grep | .exe ファイルを探す / Find .exe files |
| 02 | grep | コメント行を除外する / Remove comment lines |
| 03 | awk | pool サーバーを取り出す / Extract NTP pool servers |
| 04 | sort+uniq | 単語の出現頻度を数える / Count word frequency |
| 05 | cut | CSV の名前列を取り出す / Extract name column from CSV |
| 06 | tr | テキストを大文字に変換する / Convert text to uppercase |
| 07 | grep+wc | エラー行数を数える / Count error lines |
| 08 | sort | 数値でソートする / Numeric sort |
| 09 | awk | 数値の合計を計算する / Calculate sum of numbers |
| 10 | awk | 東京在住者を抽出する / Extract Tokyo residents |
| 11 | grep+wc | HTTP 200 のアクセス数を数える / Count HTTP 200 responses |
| 12 | sort+uniq | 重複する単語を見つける / Find duplicate words |
| 13 | grep | .txt ファイルを探す / Find .txt files |
| 14 | head+tail | 最初の3行と最後の3行を表示する / Show first and last 3 lines |
| 15 | sed | sed でテキストを置換する / Replace text with sed |
| 16 | sort | CSV を年齢順にソートする / Sort CSV by age |
| 17 | awk | 行番号を付けて表示する / Add line numbers |
| 18 | awk | スコア 80 以上の人を抽出する / Extract high scorers |
| 19 | awk | 各単語の文字数を表示する / Show word lengths |
| 20 | awk+sort | 25歳以上を年齢の降順で表示する / Sort adults by age descending |

---

## 🗂 ディレクトリ構成 / Structure

```
study_shell/
├── study.sh          # メインの学習スクリプト / Main interactive learning script
├── exercises/        # 問題定義ファイル / Exercise definition files (bash source)
│   ├── 01_grep_exe.sh
│   ├── 02_grep_invert.sh
│   └── ...
├── data/             # 演習用サンプルデータ / Sample data for exercises
│   ├── files.txt     # ファイル名一覧
│   ├── ntp.conf      # NTP 設定ファイル
│   ├── words.txt     # 単語リスト
│   ├── numbers.txt   # 数値リスト
│   ├── people.txt    # 人物データ（名前・年齢・都市）
│   ├── access.log    # Apache スタイルのアクセスログ
│   └── csv_data.csv  # CSV データ
└── .progress         # 進捗記録（自動生成）/ Progress tracking (auto-generated)
```

---

## ➕ 問題を追加するには / Adding new exercises

`exercises/` ディレクトリに以下の形式でファイルを追加するだけです。
Just add a file to the `exercises/` directory with this format:

```bash
# exercises/21_your_exercise.sh
NUM=21
TITLE="問題21: タイトル | English Title"
CATEGORY="コマンド名"
DATA_FILE="data/your_data_file.txt"   # optional
DESC="問題の説明...

English description..."
HINTS=(
  "ヒント1 / Hint 1"
  "ヒント2 / Hint 2"
)
ANSWER_DISPLAY="your command here"

get_expected() {
  # Run the reference answer — output is compared with user's command
  your_command data/your_data_file.txt
}
```

---

## 🔗 参考 / References

- 書籍: [シェル・ワンライナー160本ノック](https://gihyo.jp/book/2021/978-4-297-12267-6) (技術評論社)
- 元リポジトリ: [shellgei/shellgei160](https://github.com/shellgei/shellgei160)
