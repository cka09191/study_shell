NUM=17
TITLE="問題17: 行番号を付けて表示する | Add line numbers"
CATEGORY="awk"
DATA_FILE="data/words.txt"
DESC="words.txt の各行に行番号を付けて表示してください。
形式: \"番号: 単語\" （例: \"1: apple\"）

Display each line of words.txt with its line number.
Format: 'number: word' (e.g., '1: apple')"
HINTS=(
  "awk の NR は現在処理中の行番号を表します / In awk, NR holds the current line number"
  "\$0 は現在の行全体を表します / \$0 represents the entire current line"
  "awk '{print NR\": \"\$0}' data/words.txt"
)
ANSWER_DISPLAY="awk '{print NR\": \"\$0}' data/words.txt"

get_expected() {
  awk '{print NR": "$0}' data/words.txt
}
