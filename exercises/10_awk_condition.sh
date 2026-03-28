NUM=10
TITLE="問題10: 東京在住者を抽出する | Extract Tokyo residents"
CATEGORY="awk"
DATA_FILE="data/people.txt"
DESC="people.txt には「名前 年齢 都市」がタブ区切りで格納されています。
Tokyo 在住の人の名前だけを表示してください。

people.txt stores 'name age city' separated by tabs.
Display only the names of people living in Tokyo."
HINTS=(
  "awk の \$3 は第3フィールド（3列目）を表します / In awk, \$3 refers to the third field"
  "\$3==\"Tokyo\" で3列目が Tokyo の行をフィルタリングします / \$3==\"Tokyo\" filters rows where the 3rd field is 'Tokyo'"
  "awk '\$3==\"Tokyo\" {print \$1}' data/people.txt"
)
ANSWER_DISPLAY="awk '\$3==\"Tokyo\" {print \$1}' data/people.txt"

get_expected() {
  awk '$3=="Tokyo" {print $1}' data/people.txt
}
