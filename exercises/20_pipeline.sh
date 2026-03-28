NUM=20
TITLE="問題20: 25歳以上を年齢の降順で表示する | Sort adults by age descending"
CATEGORY="awk+sort"
DATA_FILE="data/people.txt"
DESC="people.txt から年齢（2列目）が 25 以上の人を、年齢の降順で表示してください。

From people.txt, display people aged 25 or older, sorted by age in descending order."
HINTS=(
  "awk '\$2>=25' で2列目が 25 以上の行をフィルタリングします / awk '\$2>=25' filters rows where the 2nd field is >= 25"
  "sort -k2 -nr でタブ区切りの2列目を数値の降順でソートします / sort -k2 -nr sorts by 2nd field numerically in reverse"
  "awk '\$2>=25' data/people.txt | sort -k2 -nr"
)
ANSWER_DISPLAY="awk '\$2>=25' data/people.txt | sort -k2 -nr"

get_expected() {
  awk '$2>=25' data/people.txt | sort -k2 -nr
}
