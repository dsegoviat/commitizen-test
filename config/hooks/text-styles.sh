#!/bin/sh

colorPrint() {
  local color=$1
  local text=$2
  shift 2
  local newline="\n"
  local tab=""

  for arg in "$@"
  do
    if [ "$arg" = "-t" ]; then
      tab="\t"
    elif [ "$arg" = "-n" ]; then
      newline=""
    fi
  done

  case $color in
    black) color_code="30" ;;
    red) color_code="31" ;;
    green) color_code="32" ;;
    yellow) color_code="33" ;;
    blue) color_code="34" ;;
    magenta) color_code="35" ;;
    cyan) color_code="36" ;;
    white) color_code="37" ;;
    brightBlack) color_code="90" ;;
    brightRed) color_code="91" ;;
    brightGreen) color_code="92" ;;
    brightYellow) color_code="93" ;;
    brightBlue) color_code="94" ;;
    brightMagenta) color_code="95" ;;
    brightCyan) color_code="96" ;;
    brightWhite) color_code="97" ;;
    *) echo "Invalid color"; return ;;
  esac

  printf "\e[${color_code}m${tab}%s\e[0m${newline}" "$text"
}

underline () {
  printf "\033[4m%s\033[24m" "$1"
}