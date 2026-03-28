#!/usr/bin/env bash
# study.sh - Interactive Shell Learning Tool
# Based on "シェル・ワンライナー160本ノック" (160 Shell One-liner Exercises)
# https://github.com/shellgei/shellgei160

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXERCISES_DIR="$SCRIPT_DIR/exercises"
PROGRESS_FILE="$SCRIPT_DIR/.progress"

# ANSI Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# ── Utility ────────────────────────────────────────────────────────────────────

print_line() {
  printf '%0.s─' {1..60}
  printf '\n'
}

print_header() {
  echo
  echo -e "${BOLD}${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
  echo -e "${BOLD}${BLUE}║  🐚  Shell Study  /  シェル学習ツール                    ║${NC}"
  echo -e "${BOLD}${BLUE}║     Based on シェル・ワンライナー160本ノック              ║${NC}"
  echo -e "${BOLD}${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
  echo
}

# ── Progress ───────────────────────────────────────────────────────────────────

load_progress() {
  COMPLETED=()
  if [[ -f "$PROGRESS_FILE" ]]; then
    while IFS= read -r line; do
      [[ -n "$line" ]] && COMPLETED+=("$line")
    done < "$PROGRESS_FILE"
  fi
}

is_completed() {
  local num="$1"
  local c
  for c in "${COMPLETED[@]:-}"; do
    [[ "$c" == "$num" ]] && return 0
  done
  return 1
}

mark_complete() {
  local num="$1"
  if ! is_completed "$num"; then
    echo "$num" >> "$PROGRESS_FILE"
    COMPLETED+=("$num")
  fi
}

# ── Exercise Management ────────────────────────────────────────────────────────

get_exercises() {
  find "$EXERCISES_DIR" -maxdepth 1 -name "*.sh" | sort
}

count_exercises() {
  get_exercises | wc -l | tr -d ' '
}

show_progress_bar() {
  local total
  total=$(count_exercises)
  local done=${#COMPLETED[@]}
  local bar_width=40
  local filled=0
  [[ $total -gt 0 ]] && filled=$(( bar_width * done / total ))
  local empty=$(( bar_width - filled ))

  printf "${BOLD}進捗 / Progress: ${GREEN}%d${NC} / %d  " "$done" "$total"
  printf "${GREEN}"
  local i
  for (( i=0; i<filled; i++ )); do printf '█'; done
  printf "${DIM}"
  for (( i=0; i<empty; i++ )); do printf '░'; done
  printf "${NC}"
  [[ $total -gt 0 ]] && printf " %d%%\n" $(( 100 * done / total )) || printf " 0%%\n"
  echo
}

list_exercises() {
  load_progress
  echo -e "${BOLD}問題一覧 / Exercise List:${NC}"
  echo
  local ex_file
  for ex_file in $(get_exercises); do
    local NUM TITLE CATEGORY
    NUM='' TITLE='' CATEGORY=''
    # shellcheck disable=SC1090
    source "$ex_file"
    local status
    if is_completed "$NUM"; then
      status="${GREEN}✓${NC}"
    else
      status="${DIM}○${NC}"
    fi
    printf "  %b [%b%-12b%b] %b\n" \
      "$status" \
      "${CYAN}" "$CATEGORY" "${NC}" \
      "$TITLE"
  done
  echo
}

# ── Exercise Runner ────────────────────────────────────────────────────────────

run_exercise() {
  local ex_file="$1"

  local NUM TITLE CATEGORY DATA_FILE DESC HINTS ANSWER_DISPLAY
  NUM='' TITLE='' CATEGORY='' DATA_FILE='' DESC='' HINTS=() ANSWER_DISPLAY=''

  # shellcheck disable=SC1090
  source "$ex_file"

  load_progress
  cd "$SCRIPT_DIR"

  clear
  print_header

  echo -e "${BOLD}${CYAN}問題 $NUM / Exercise $NUM${NC}  ${DIM}[${CATEGORY}]${NC}"
  print_line
  echo -e "${BOLD}$TITLE${NC}"
  echo
  echo -e "$DESC"
  echo

  # Data file preview
  if [[ -n "$DATA_FILE" && -f "$SCRIPT_DIR/$DATA_FILE" ]]; then
    echo -e "${DIM}▶ データファイル / Data file: ${BOLD}$DATA_FILE${NC}"
    echo -e "${DIM}$(head -5 "$SCRIPT_DIR/$DATA_FILE")${NC}"
    local total_lines
    total_lines=$(wc -l < "$SCRIPT_DIR/$DATA_FILE")
    if [[ $total_lines -gt 5 ]]; then
      echo -e "${DIM}  ... ($total_lines 行 / lines total)${NC}"
    fi
    echo
  fi

  if is_completed "$NUM"; then
    echo -e "${GREEN}✓ この問題はすでに解いています / Already completed!${NC}"
    echo
  fi

  print_line
  echo -e "${DIM}コマンドを入力して Enter で実行します${NC}"
  echo -e "${DIM}h=ヒント  a=解答を見る  s=スキップ  l=一覧  q=終了${NC}"
  echo -e "${DIM}Type your command and press Enter to run${NC}"
  echo -e "${DIM}h=hint   a=show answer   s=skip   l=list   q=quit${NC}"
  print_line

  local hint_level=0
  local max_hints=${#HINTS[@]}

  while true; do
    echo
    printf "${BOLD}${YELLOW}\$ ${NC}"
    IFS= read -r user_input

    # Strip leading/trailing whitespace
    user_input="${user_input#"${user_input%%[![:space:]]*}"}"
    user_input="${user_input%"${user_input##*[![:space:]]}"}"

    case "$user_input" in
      q|quit|exit)
        echo -e "${CYAN}さようなら！/ Goodbye!${NC}"
        exit 0
        ;;
      s|skip|n|next)
        echo -e "${DIM}スキップしました / Skipped${NC}"
        return 0
        ;;
      l|list)
        list_exercises
        print_line
        echo -e "${DIM}h=ヒント  a=解答を見る  s=スキップ  q=終了 / h=hint  a=answer  s=skip  q=quit${NC}"
        print_line
        ;;
      h|hint)
        if [[ $hint_level -lt $max_hints ]]; then
          echo -e "${YELLOW}💡 ヒント $((hint_level+1))/$max_hints / Hint $((hint_level+1))/$max_hints:${NC}"
          echo -e "   ${HINTS[$hint_level]}"
          (( hint_level++ )) || true
        else
          echo -e "${DIM}これ以上ヒントはありません / No more hints available${NC}"
        fi
        ;;
      a|answer)
        echo -e "${CYAN}📖 解答 / Answer:${NC}"
        echo -e "   ${BOLD}\$ $ANSWER_DISPLAY${NC}"
        echo
        echo -e "${CYAN}実行結果 / Output:${NC}"
        cd "$SCRIPT_DIR"
        get_expected
        mark_complete "$NUM"
        echo
        echo -e "${GREEN}Enter で次へ / Press Enter to continue${NC}"
        IFS= read -r _
        return 0
        ;;
      "")
        echo -e "${DIM}コマンドを入力してください / Please enter a command${NC}"
        ;;
      *)
        # Run user's command
        echo -e "${DIM}────────────────────────────${NC}"
        local user_output
        if user_output=$(cd "$SCRIPT_DIR" && eval "$user_input" 2>&1); then
          echo "$user_output"
        else
          echo -e "${RED}エラー / Error:${NC}"
          echo "$user_output"
          echo -e "${DIM}────────────────────────────${NC}"
          continue
        fi
        echo -e "${DIM}────────────────────────────${NC}"

        # Get expected output
        local expected_output
        expected_output=$(cd "$SCRIPT_DIR" && get_expected 2>/dev/null)

        # Compare (trim trailing whitespace for robustness)
        local user_trimmed expected_trimmed
        user_trimmed=$(echo "$user_output" | sed 's/[[:space:]]*$//')
        expected_trimmed=$(echo "$expected_output" | sed 's/[[:space:]]*$//')

        if [[ "$user_trimmed" == "$expected_trimmed" ]]; then
          echo
          echo -e "${GREEN}${BOLD}🎉 正解！ Correct!${NC}"
          mark_complete "$NUM"
          echo
          echo -e "${GREEN}Enter で次へ / Press Enter to continue${NC}"
          IFS= read -r _
          return 0
        else
          echo
          echo -e "${YELLOW}⚠  期待する出力と異なります / Output doesn't match expected${NC}"
          echo -e "${DIM}期待する出力 / Expected output:${NC}"
          echo "$expected_output"
          echo
          echo -e "${DIM}h でヒント、a で解答を表示 / Type 'h' for a hint, 'a' for the answer${NC}"
        fi
        ;;
    esac
  done
}

# ── Navigation ─────────────────────────────────────────────────────────────────

run_all_from() {
  local start_completed="$1"   # if true: skip completed; if false: run all
  local exercises
  exercises=()
  while IFS= read -r line; do exercises+=("$line"); done < <(get_exercises)
  local ex_file
  for ex_file in "${exercises[@]}"; do
    local NUM=''
    # shellcheck disable=SC1090
    source "$ex_file"
    load_progress
    if [[ "$start_completed" == "skip_completed" ]] && is_completed "$NUM"; then
      continue
    fi
    run_exercise "$ex_file"
  done
  clear
  print_header
  echo -e "${GREEN}${BOLD}🏆 全問題を終了しました！ / All exercises done!${NC}"
  echo
  show_progress_bar
  echo -e "Enter で メニューに戻る / Press Enter to return to menu"
  IFS= read -r _
}

pick_exercise() {
  list_exercises
  printf "問題番号を入力 / Enter exercise number (1-%d): " "$(count_exercises)"
  IFS= read -r num
  # Find matching file
  local ex_file
  ex_file=$(find "$EXERCISES_DIR" -maxdepth 1 -name "$(printf '%02d' "$num")_*.sh" 2>/dev/null | sort | head -1)
  if [[ -n "$ex_file" ]]; then
    run_exercise "$ex_file"
  else
    echo -e "${RED}問題が見つかりません / Exercise $num not found${NC}"
    sleep 1
  fi
}

# ── Main Menu ──────────────────────────────────────────────────────────────────

main_menu() {
  load_progress
  while true; do
    clear
    print_header
    show_progress_bar

    echo -e "${BOLD}メニュー / Menu${NC}"
    echo -e "  ${CYAN}1${NC})  最初から始める          / Start from the beginning"
    echo -e "  ${CYAN}2${NC})  未解答の問題を解く      / Continue with unsolved exercises"
    echo -e "  ${CYAN}3${NC})  問題を番号で選ぶ        / Pick an exercise by number"
    echo -e "  ${CYAN}4${NC})  問題一覧を見る          / List all exercises"
    echo -e "  ${CYAN}5${NC})  進捗をリセットする      / Reset progress"
    echo -e "  ${CYAN}q${NC})  終了                   / Quit"
    echo
    printf "選択 / Choice: "
    IFS= read -r choice

    case "$choice" in
      1) run_all_from "all"             ;;
      2) run_all_from "skip_completed"  ;;
      3) pick_exercise                  ;;
      4)
        clear
        print_header
        load_progress
        show_progress_bar
        list_exercises
        printf "Enter で戻る / Press Enter to go back: "
        IFS= read -r _
        ;;
      5)
        echo -e "${YELLOW}進捗をリセットしますか？ / Reset all progress? [y/N]: ${NC}"
        IFS= read -r confirm
        if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
          rm -f "$PROGRESS_FILE"
          COMPLETED=()
          echo -e "${GREEN}リセットしました / Progress reset${NC}"
          sleep 1
        fi
        ;;
      q|quit|exit)
        echo -e "${CYAN}さようなら！/ Goodbye!${NC}"
        exit 0
        ;;
      *)
        echo -e "${DIM}無効な選択 / Invalid choice${NC}"
        sleep 1
        ;;
    esac
  done
}

# ── Entry Point ────────────────────────────────────────────────────────────────

usage() {
  cat <<EOF
使い方 / Usage: $(basename "$0") [オプション / option]

  (オプション無し)          インタラクティブメニューを起動 / Launch interactive menu
  --exercise N             問題 N を直接開く / Open exercise N directly
  --list                   問題一覧を表示 / List all exercises
  --progress               進捗を表示 / Show progress summary
  --reset                  進捗をリセット / Reset progress
  -h, --help               このメッセージを表示 / Show this help

例 / Examples:
  ./study.sh               # メニューから開始 / Start with menu
  ./study.sh --exercise 5  # 問題5を直接開く / Jump to exercise 5
  ./study.sh --list        # 一覧を表示 / List exercises
EOF
}

main() {
  case "${1:-}" in
    --exercise|-e)
      if [[ -z "${2:-}" ]]; then
        echo "エラー: 問題番号を指定してください / Error: specify exercise number" >&2
        exit 1
      fi
      load_progress
      local ex_file
      ex_file=$(find "$EXERCISES_DIR" -maxdepth 1 -name "$(printf '%02d' "$2")_*.sh" 2>/dev/null | sort | head -1)
      if [[ -n "$ex_file" ]]; then
        run_exercise "$ex_file"
      else
        echo "問題 $2 が見つかりません / Exercise $2 not found" >&2
        exit 1
      fi
      ;;
    --list|-l)
      load_progress
      list_exercises
      ;;
    --progress|-p)
      load_progress
      show_progress_bar
      ;;
    --reset)
      echo -e "${YELLOW}進捗をリセットしますか？ / Reset all progress? [y/N]: ${NC}"
      IFS= read -r confirm
      if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        rm -f "$PROGRESS_FILE"
        echo -e "${GREEN}リセットしました / Progress reset${NC}"
      fi
      ;;
    -h|--help)
      usage
      ;;
    "")
      main_menu
      ;;
    *)
      echo "不明なオプション / Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
}

main "$@"
