NUM=7
TITLE="問題07: エラー行数を数える | Count error lines"
CATEGORY="grep+wc"
DATA_FILE="data/access.log"
DESC="access.log の中で「ERROR」という文字列を含む行の数を表示してください。

Count the number of lines containing 'ERROR' in access.log."
HINTS=(
  "grep でパターンにマッチする行を抽出できます / grep extracts lines matching a pattern"
  "wc -l でパイプから受け取った行数を数えられます / wc -l counts lines from a pipe"
  "grep 'ERROR' ファイル | wc -l"
)
ANSWER_DISPLAY="grep 'ERROR' data/access.log | wc -l"

get_expected() {
  grep 'ERROR' data/access.log | wc -l
}
