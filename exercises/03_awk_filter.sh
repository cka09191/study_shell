NUM=3
TITLE="問題03: pool サーバーを取り出す | Extract NTP pool servers"
CATEGORY="awk"
DATA_FILE="data/ntp.conf"
DESC="ntp.conf から pool で始まる行のサーバー名（2列目）だけを表示してください。

From ntp.conf, display only the server names (2nd field) from lines starting with 'pool'."
HINTS=(
  "awk の \$1 は第1フィールド（列）を表します / In awk, \$1 refers to the first field (column)"
  "awk '\$1==\"pool\"' で pool で始まる行をフィルタリングできます / awk '\$1==\"pool\"' filters lines where the first field is 'pool'"
  "awk '\$1==\"pool\" {print \$2}' で2列目を表示します / awk '\$1==\"pool\" {print \$2}' prints the second field"
)
ANSWER_DISPLAY="awk '\$1==\"pool\" {print \$2}' data/ntp.conf"

get_expected() {
  awk '$1=="pool" {print $2}' data/ntp.conf
}
