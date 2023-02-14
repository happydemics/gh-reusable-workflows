commands=()

border() {
    title="| $@ |"
    edge=$(echo "$title" | sed 's/./-/g')
    echo "$edge"
    echo "$title"
    echo "$edge"
}

run_in_background() {
  local cmd_name=$1
  local file="$cmd_name.txt"
  shift
  border "$@" > $file
  { time $@; } >> $file 2>&1
  test $? -eq 0 || echo "\$ $@" >> fail.txt
}

launch_as() {
  local cmd_name=$1
  commands+=($cmd_name)

  run_in_background $@ &
}

wait_and_display() {
  wait

  all_commands_except_last="${commands[@]::${#commands[@]}-1}"
  last_command="${commands[@]: -1:1}"
  for c in $all_commands_except_last; do
    echo "::group::{${c}}"
    cat $c.txt
    echo -e ""
    echo "::endgroup::"
  done
  echo "::group::{${last_command}}"
  cat $last_command.txt
  echo "::endgroup::"
  if [ -f fail.txt ]; then
    echo "::group::{FAILURE}"
    echo -e ""
    border "Failed commands"
    cat fail.txt
    echo "::endgroup::"
    exit 1
  fi
}
