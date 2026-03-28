NUM=11
TITLE="問題11: HTTP 200 のアクセス数を数える | Count HTTP 200 responses"
CATEGORY="grep+wc"
DATA_FILE="data/access.log"
DESC="access.log から HTTP ステータスコード 200 のアクセス数を表示してください。

Count the number of HTTP 200 responses in access.log."
HINTS=(
  "ログの形式では、ステータスコードはスペースに囲まれています / In the log format, the status code is surrounded by spaces"
  "grep '\" 200 \"' のようにスペースを含めてマッチさせましょう / Include spaces to match accurately: grep '\" 200 '...'"
  "grep '\" 200 ' data/access.log | wc -l"
)
ANSWER_DISPLAY="grep '\" 200 ' data/access.log | wc -l"

get_expected() {
  grep '" 200 ' data/access.log | wc -l
}
