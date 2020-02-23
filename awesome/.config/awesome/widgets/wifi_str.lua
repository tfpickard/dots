local awful = require("awful")
local beautiful = require("beautiful")
local widget = require("util.widgets")
local helpers = require("helpers")

-- beautiful vars
local fg = beautiful.widget_wifi_str_fg
local bg = beautiful.widget_wifi_str_bg
local l = beautiful.widget_wifi_layout or 'horizontal'
local spacing = beautiful.widget_spacing or 1

-- widget creation
local text = widget.base_text()
local wifi_str_widget = widget.box_with_margin(l, { text }, spacing)

awful.widget.watch(
  os.getenv("HOME").."/.config/awesome/widgets/network.sh wifi", 60,
  function(widget, stdout, stderr, exitreason, exitcode)
    ff = io.open("/tmp/wifishit", "w")
    io.output(ff)
    local filter_wifi = stdout:match('.*')
    io.write("filter:"..filter_wifi)
    local wifi_str = filter_wifi or "shit"
    io.write("wifi_str:"..wifi_str)
    text.markup = helpers.colorize_text(filter_wifi, fg)
    io.write(text)
    io.close(ff)
  end
)
return wifi_str_widget
