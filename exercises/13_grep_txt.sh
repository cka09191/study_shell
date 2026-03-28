NUM=13
TITLE="問題13: .txt ファイルを探す | Find .txt files"
CATEGORY="grep"
DATA_FILE="data/files.txt"
DESC="files.txt から .txt で終わるファイル名だけを表示してください。

From files.txt, display only the filenames ending with .txt"
HINTS=(
  "grep で正規表現パターンを使って行をフィルタリングできます / grep can filter lines using regex patterns"
  "'\\.' はリテラルのドット、'\$' は行末にマッチします / '\\.' matches a literal dot, '\$' matches end of line"
  "grep '\\.txt\$' data/files.txt"
)
ANSWER_DISPLAY="grep '\\.txt\$' data/files.txt"

get_expected() {
  grep '\.txt$' data/files.txt
}
