# Requires: https://github.com/pwittchen/tmux-plugin-ram

show_ram_usage() {
  local index icon color text module

  tmux set-option -g @ram_low_bg_color "$thm_green" # background color when RAM is low
  tmux set-option -g @ram_medium_bg_color "$thm_yellow" # background color when RAM is medium
  tmux set-option -g @ram_high_bg_color "$thm_red" # background color when RAM is high

  index=$1
  tmux set-option -g @sysstat_mem_view_tmpl "#{mem.pused}"

  icon="$(get_tmux_option "@catppuccin_ram_icon"  "󰍛")"
  color="$(get_tmux_option "@catppuccin_ram_color" "#{ram_bg_color}")"
  text="$(get_tmux_option "@catppuccin_ram_text" "#{sysstat_mem}")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
