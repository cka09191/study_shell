NUM=6
TITLE="問題06: テキストを大文字に変換する | Convert text to uppercase"
CATEGORY="tr"
DATA_FILE="data/words.txt"
DESC="words.txt の内容を全て大文字に変換して表示してください。

Convert all text in words.txt to uppercase and display it."
HINTS=(
  "tr コマンドで文字の変換ができます / The tr command can translate characters"
  "tr 'a-z' 'A-Z' で小文字を大文字に変換します / tr 'a-z' 'A-Z' converts lowercase to uppercase"
  "リダイレクト < でファイルを入力として使います / Use < to redirect a file as input"
)
ANSWER_DISPLAY="tr 'a-z' 'A-Z' < data/words.txt"

get_expected() {
  tr 'a-z' 'A-Z' < data/words.txt
}
