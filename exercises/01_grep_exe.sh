NUM=1
TITLE="問題01: .exeファイルを探す | Find .exe files"
CATEGORY="grep"
DATA_FILE="data/files.txt"
DESC="files.txt には様々なファイル名が含まれています。
.exe で終わるファイル名だけを表示してください。

files.txt contains various filenames.
Display only the filenames ending with .exe"
HINTS=(
  "grep コマンドを使ってみましょう / Use the grep command"
  "正規表現: '\\.' はリテラルのドット、'\$' は行末を意味します / In regex, '\\.' matches a literal dot and '\$' matches end of line"
  "答えに近い形: grep 'パターン' ファイル名 / Close to answer: grep 'pattern' filename"
)
ANSWER_DISPLAY="grep '\\.exe\$' data/files.txt"

get_expected() {
  grep '\.exe$' data/files.txt
}
