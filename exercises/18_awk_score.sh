NUM=18
TITLE="問題18: スコア 80 以上の人を抽出する | Extract high scorers"
CATEGORY="awk"
DATA_FILE="data/csv_data.csv"
DESC="csv_data.csv からスコア（4列目）が 80 以上の人の名前を表示してください。
（ヘッダ行は除く）

From csv_data.csv, display names of people with a score (4th column) of 80 or higher.
(Exclude the header row)"
HINTS=(
  "awk で -F',' フィールド区切り文字にカンマを指定します / Use -F',' in awk to set comma as field separator"
  "NR>1 でヘッダ行（1行目）をスキップします / NR>1 skips the header (first) line"
  "awk -F',' 'NR>1 && \$4>=80 {print \$1}' data/csv_data.csv"
)
ANSWER_DISPLAY="awk -F',' 'NR>1 && \$4>=80 {print \$1}' data/csv_data.csv"

get_expected() {
  awk -F',' 'NR>1 && $4>=80 {print $1}' data/csv_data.csv
}
