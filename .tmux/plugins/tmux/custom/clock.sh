show_clock() {
  local index icon color text module

  index=$1


  icon="$(get_tmux_option "@catppuccin_clock_icon"  "")"
  color="$(get_tmux_option "@catppuccin_clock_color" "$thm_red")"
  text="$(get_tmux_option "@catppuccin_world_text" "#{screentime_status} %a %h-%d %H:%M")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
