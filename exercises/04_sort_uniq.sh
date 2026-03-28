NUM=4
TITLE="問題04: 単語の出現頻度を数える | Count word frequency"
CATEGORY="sort+uniq"
DATA_FILE="data/words.txt"
DESC="words.txt に含まれる単語の出現回数を、多い順に表示してください。
（形式: 「回数 単語」）

Count how many times each word appears in words.txt and display them in descending order.
(Format: 'count word')"
HINTS=(
  "まず sort でソートしてから uniq -c で隣接する重複をカウントします / First sort, then use uniq -c to count adjacent duplicates"
  "sort -rn で数字の大きい順にソートします / sort -rn sorts in reverse numeric order"
  "sort data/words.txt | uniq -c | sort -rn"
)
ANSWER_DISPLAY="sort data/words.txt | uniq -c | sort -rn"

get_expected() {
  sort data/words.txt | uniq -c | sort -rn
}
