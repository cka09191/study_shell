NUM=14
TITLE="問題14: 最初の3行と最後の3行を表示する | Show first and last 3 lines"
CATEGORY="head+tail"
DATA_FILE="data/words.txt"
DESC="words.txt の最初の3行と最後の3行を表示してください（順番通りに）。

Display the first 3 lines and the last 3 lines of words.txt (in order)."
HINTS=(
  "head -3 で最初の3行、tail -3 で最後の3行を表示できます / head -3 shows first 3 lines, tail -3 shows last 3 lines"
  "{ コマンド1; コマンド2; } でコマンドをグループ化してまとめて出力できます / Group commands with { cmd1; cmd2; } to combine output"
  "{ head -3 data/words.txt; tail -3 data/words.txt; }"
)
ANSWER_DISPLAY="{ head -3 data/words.txt; tail -3 data/words.txt; }"

get_expected() {
  { head -3 data/words.txt; tail -3 data/words.txt; }
}
