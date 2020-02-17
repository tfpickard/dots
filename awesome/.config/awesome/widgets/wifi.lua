local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local widget = require("util.widgets")
local helpers = require("helpers")

-- beautiful vars
local wifi_icon = beautiful.widget_wifi_icon
local fg = beautiful.widget_wifi_fg
local bg = beautiful.widget_wifi_bg
local l = 'horizontal' --beautiful.widget_date_layout or 'horizontal'
local spacing = beautiful.widget_spacing or 1

-- widget creation
local icon = widget.base_icon()
local text = widget.base_text()
wifi_widget = widget.box(l, { icon, text }, spacing)

local wifi_script = [[
  bash -c "iwgetid -s &&\
           echo \" | \" ; \
           iwgetid -f | cut -d: -f2"
  ]]

awful.widget.watch(wifi_script, 60, function(widget, stdout)
-- local result = string.gsub(s, "n", "") -- remove line breaks
  local wifi = stdout:gsub("\n","")
  icon.markup = helpers.colorize_text(wifi_icon, fg)
  text.markup = helpers.colorize_text(wifi, fg)
end)
