NUM=15
TITLE="問題15: sed でテキストを置換する | Replace text with sed"
CATEGORY="sed"
DATA_FILE="data/words.txt"
DESC="words.txt の \"apple\" を \"APPLE\" に置換して表示してください。

Replace all occurrences of 'apple' with 'APPLE' in words.txt and display the result."
HINTS=(
  "sed の s コマンドで置換できます: sed 's/検索/置換/' / sed's s command replaces: sed 's/search/replace/'"
  "末尾の g フラグで行内の全てのマッチを置換します / The g flag at the end replaces all matches in a line"
  "sed 's/apple/APPLE/g' data/words.txt"
)
ANSWER_DISPLAY="sed 's/apple/APPLE/g' data/words.txt"

get_expected() {
  sed 's/apple/APPLE/g' data/words.txt
}
