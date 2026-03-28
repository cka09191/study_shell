NUM=2
TITLE="問題02: コメント行を除外する | Remove comment lines"
CATEGORY="grep"
DATA_FILE="data/ntp.conf"
DESC="ntp.conf には # で始まるコメント行と空行が含まれています。
コメント行と空行を除いた設定行だけを表示してください。

ntp.conf contains comment lines (starting with #) and blank lines.
Display only the actual configuration lines (no comments, no blank lines)."
HINTS=(
  "grep の -v オプションでマッチしない行を表示できます / grep -v shows lines that do NOT match"
  "'^#' は # で始まる行、'^$' は空行にマッチします / '^#' matches lines starting with #, '^$' matches empty lines"
  "2つの grep -v をパイプでつなぎましょう / Chain two grep -v commands with a pipe"
)
ANSWER_DISPLAY="grep -v '^#' data/ntp.conf | grep -v '^$'"

get_expected() {
  grep -v '^#' data/ntp.conf | grep -v '^$'
}
