NUM=12
TITLE="問題12: 重複する単語を見つける | Find duplicate words"
CATEGORY="sort+uniq"
DATA_FILE="data/words.txt"
DESC="words.txt で複数回出現する単語（重複している単語）だけを表示してください。

Display only the words that appear more than once (duplicates) in words.txt."
HINTS=(
  "まず sort で並べ替えると重複が隣接します / Sorting first makes duplicates adjacent"
  "uniq -d オプションは重複している行のみを表示します / uniq -d shows only lines that appear more than once"
  "sort data/words.txt | uniq -d"
)
ANSWER_DISPLAY="sort data/words.txt | uniq -d"

get_expected() {
  sort data/words.txt | uniq -d
}
