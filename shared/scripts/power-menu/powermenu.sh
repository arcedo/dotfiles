#!/usr/bin/env bash

# Current Theme
dir="~/shared/scripts/power-menu/"
theme='style'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown=''
reboot='↻'
lock=''
suspend='󰒲'
logout=''
yes=''
no=''

# Screen control (Hyprland only)
screen_off() {
  hyprctl dispatch dpms off
}

screen_on() {
  hyprctl dispatch dpms on
}

# Rofi CMD
rofi_cmd() {
  rofi -dmenu \
    -p "Uptime: $uptime" \
    -mesg "Uptime: $uptime" \
    -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
  rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
    -theme-str 'mainbox {children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you Sure?' \
    -theme ${dir}/${theme}.rasi
}

confirm_exit() {
  echo -e "$yes\n$no" | confirm_cmd
}

run_rofi() {
  echo -e "$lock\n$shutdown\n$reboot\n$suspend\n$logout" | rofi_cmd
}

run_cmd() {
  selected="$(confirm_exit)"

  [[ "$selected" != "$yes" ]] && exit 0

  case "$1" in
  --shutdown)
    systemctl poweroff
    ;;

  --reboot)
    systemctl reboot
    ;;

  --suspend)
    mpc -q pause
    amixer set Master mute
    systemctl suspend
    ;;

  --logout)
    hyprctl dispatch exit 1
    ;;
  esac
}

chosen="$(run_rofi)"

case ${chosen} in

$shutdown)
  run_cmd --shutdown
  ;;

$reboot)
  run_cmd --reboot
  ;;

$lock)
  # 🔥 Hyprland-optimized lock flow

  # 1. Turn screen off immediately
  screen_off

  # 2. Small delay so DPMS registers before lock
  sleep 0.2

  # 3. Lock (this will wake the screen when active — expected behavior)
  hyprlock &

  # 4. Wait until lock starts fully
  sleep 0.5

  # 5. Optional: ensure DPMS stays off briefly (prevents flash)
  screen_off
  ;;

$suspend)
  run_cmd --suspend
  ;;

$logout)
  run_cmd --logout
  ;;

esac
