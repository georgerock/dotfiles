# Requires: https://github.com/tassaron/tmux-df

show_storage() {
  local index icon color text module

  index=$1

  icon="$(get_tmux_option "@catppuccino_storage_icon" "󰋊")"
  color="$(get_tmux_option "@catppuccino_storage_color" "$thm_blue")"
  text="$(get_tmux_option "@catppuccino_storage_text" "#{df_avail} - #{df_percent} used")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
