NUM=5
TITLE="問題05: CSV の名前列を取り出す | Extract name column from CSV"
CATEGORY="cut"
DATA_FILE="data/csv_data.csv"
DESC="csv_data.csv からヘッダ行を除いた name 列（1列目）だけを表示してください。

From csv_data.csv, display only the name column (1st column), excluding the header row."
HINTS=(
  "cut -d',' -f1 でカンマ区切りの1列目を取り出せます / cut -d',' -f1 extracts the 1st comma-delimited field"
  "tail -n +2 でヘッダ行（1行目）をスキップできます / tail -n +2 skips the first (header) line"
  "tail -n +2 data/csv_data.csv | cut -d',' -f1"
)
ANSWER_DISPLAY="tail -n +2 data/csv_data.csv | cut -d',' -f1"

get_expected() {
  tail -n +2 data/csv_data.csv | cut -d',' -f1
}
