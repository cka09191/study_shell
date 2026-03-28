NUM=16
TITLE="問題16: CSV を年齢順にソートする | Sort CSV by age"
CATEGORY="sort"
DATA_FILE="data/csv_data.csv"
DESC="csv_data.csv からヘッダ行を除いた行を、年齢（2列目）の昇順でソートして表示してください。

Sort the rows of csv_data.csv (excluding the header) by age (2nd column) in ascending order."
HINTS=(
  "sort の -t オプションでフィールド区切り文字を指定します / sort -t specifies the field delimiter"
  "sort -k2 で2列目をソートキーとして使います / sort -k2 uses the 2nd field as sort key"
  "tail -n +2 data/csv_data.csv | sort -t',' -k2 -n"
)
ANSWER_DISPLAY="tail -n +2 data/csv_data.csv | sort -t',' -k2 -n"

get_expected() {
  tail -n +2 data/csv_data.csv | sort -t',' -k2 -n
}
