NUM=8
TITLE="問題08: 数値でソートする | Numeric sort"
CATEGORY="sort"
DATA_FILE="data/numbers.txt"
DESC="numbers.txt の数値を小さい順（昇順）に並べ替えてください。

Sort the numbers in numbers.txt in ascending numeric order."
HINTS=(
  "sort コマンドはデフォルトで文字順（辞書順）にソートします / sort defaults to lexicographic (alphabetical) order"
  "-n オプションで数値としてソートします / The -n option sorts numerically"
  "sort -n data/numbers.txt"
)
ANSWER_DISPLAY="sort -n data/numbers.txt"

get_expected() {
  sort -n data/numbers.txt
}
