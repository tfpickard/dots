local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local separators = require('util.separators')
local widget = require('util.widgets')

local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()
-- widgets load
local pad = separators.pad
local mpc = require("widgets.music-player")({})
local change_theme = require("widgets.button_change_theme")
local desktop_ctrl = require("widgets.desktop-control")
local scrot = require("widgets.scrot")
local layouts = require("widgets.layouts")

local date = require("widgets.date")
local date_bg = beautiful.widget_date_bg
local my_date = widget.bg_rounded( date_bg, "#873075", date_widget )

local battery = require("widgets.battery")({})
local bat_bg = beautiful.widget_battery_bg
local my_battery = widget.bg_rounded( bat_bg, "#794298", battery )
local textclock = wibox.widget {
  format = '<span foreground="'..beautiful.fg_primary..'" font="12">%H:%M:%S</span>',
  refresh = 1,
  timezone = "America/Denver",
  widget = wibox.widget.textclock,
  -- forced_height = dpi(88),
  -- forced_width = dpi(90)
}
local my_time = widget.bg_rounded( date_bg, "#873075", textclock )

local network = require("widgets.network")({ mode = "ip" })
local my_network = widget.bg_rounded( g2, xrdb.color5, network )
local wifi_str = require("widgets.wifi_str")
local my_wifi_str = widget.bg_rounded( g3, xrdb.color6, wifi_str )

-- init tables
local mybar = class()

-- {{{ Wibar
function mybar:init(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create a tasklist widget for each screen
  s.mytasklist = require("widgets.tasklist")(s)

  -- Create a taglist widget for each screen
  s.mytaglist = require("widgets.taglist")(s, { mode = "line", want_layout = 'flex' })

  -- Create the wibox with default options
  s.mywibox = awful.wibar({ position = beautiful.wibar_position, height = beautiful.wibar_size, bg = beautiful.wibar_bg, screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    { -- Left widgets
      layouts,
--      wibox.widget.textbox(" "),
      spacing = beautiful.widget_spacing,
      layout = wibox.layout.align.horizontal
    },
        s.mytasklist, -- More or less Middle
    { -- Right widgets
      --mpc,
      --change_theme,
      scrot,
      desktop_ctrl,
      my_battery,
--      wibox.widget.textbox(" "),
      spacing = beautiful.widget_spacing,
      layout = wibox.layout.fixed.horizontal,
      -- my_network,
      my_wifi_str,
      my_time,
      my_date
    },
    expand ="none",
    layout = wibox.layout.align.horizontal
  }

  -- tagslist bar
  s.mywibox_tags = awful.wibar({ position = beautiful.wibar_position, height = dpi(5), bg = beautiful.wibar_bg, screen = s })
  awful.placement.maximize_horizontally(s.mywibox_tags)

  s.mywibox_tags:setup {
    widget = s.mytaglist
  }
end

return mybar
