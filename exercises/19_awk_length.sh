NUM=19
TITLE="問題19: 各単語の文字数を表示する | Show word lengths"
CATEGORY="awk"
DATA_FILE="data/words.txt"
DESC="words.txt の各単語の文字数を「単語 文字数」の形式で表示してください。
（例: \"apple 5\"）

For each word in words.txt, display the word and its character count.
(e.g., 'apple 5')"
HINTS=(
  "awk の length() 関数で文字列の長さを取得できます / The length() function in awk returns string length"
  "length(\$0) で行全体（\$0）の文字数を取得します / length(\$0) gets the length of the entire line"
  "awk '{print \$0, length(\$0)}' data/words.txt"
)
ANSWER_DISPLAY="awk '{print \$0, length(\$0)}' data/words.txt"

get_expected() {
  awk '{print $0, length($0)}' data/words.txt
}
