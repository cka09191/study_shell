NUM=9
TITLE="問題09: 数値の合計を計算する | Calculate sum of numbers"
CATEGORY="awk"
DATA_FILE="data/numbers.txt"
DESC="numbers.txt の全ての数値の合計を表示してください。

Calculate and display the sum of all numbers in numbers.txt."
HINTS=(
  "awk で各行の値を変数に加算していきます / In awk, you can accumulate values into a variable each line"
  "END ブロックは全行の処理が終わった後に実行されます / The END block runs after all lines are processed"
  "awk '{sum+=\$1} END{print sum}' data/numbers.txt"
)
ANSWER_DISPLAY="awk '{sum+=\$1} END{print sum}' data/numbers.txt"

get_expected() {
  awk '{sum+=$1} END{print sum}' data/numbers.txt
}
