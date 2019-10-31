#!/usr/bin/env bash

hc() {
    herbstclient "$@"
}

source ~/.config/herbstluftwm/gruvbox_colors.sh

~/bin/monitors

# frame/window styling
hc set frame_border_active_color "$GRUVBOX_DARK4"
hc set frame_border_normal_color "$GRUVBOX_DARK0"
hc set frame_bg_transparent 1
hc set frame_border_width 1
hc set frame_gap 4
hc set frame_padding 0
hc set smart_frame_surroundings 1

hc set window_border_width 1
hc set window_border_inner_width 0
hc set window_border_normal_color "$GRUVBOX_DARK1"
hc set window_border_active_color "$GRUVBOX_BRIGHT_AQUA"
hc set window_gap 0
hc set smart_window_surroundings 1

hc set mouse_recenter_gap 0
