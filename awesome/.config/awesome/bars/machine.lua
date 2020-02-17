local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local separators = require('util.separators')
local widget = require('util.widgets')

-- gradient colors (dark to light)
local g0 = beautiful.grey_dark
local g1 = beautiful.grey
local g2 = beautiful.primary_dark
local g3 = beautiful.secondary_dark
-- widgets load
local pad = separators.pad
local pipe = separators.pipe
local mpc = require("widgets.music-player")({})
local change_theme = require("widgets.button_change_theme")
local desktop_ctrl = require("widgets.desktop-control")
local scrot = require("widgets.scrot")
local layouts = require("widgets.layouts")

local brightness = require("widgets.brightness")({ mode = "progressbar", bar_size = 100 })
local hostname = require("widgets.hostname")
local scrot = require("widgets.scrot")
local volume = require("widgets.volume")({})
local volume_bg = beautiful.widget_volume_bg
local my_vol = widget.bg_rounded( volume_bg, g0, volume )

local my_menu = require("module.menu")
local launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = my_menu }
)
local my_launcher = widget.bg_rounded( "#4a455e", "#20252c", launcher, "button" )


local network = require("widgets.network")({ mode = "ip" })
local my_network = widget.bg( g2, network )

-- local wifi_str = require("widgets.wifi_str")
-- local my_wifi_str = widget.bg( g3, wifi_str )

local ram = require("widgets.ram")({})
local my_ram = widget.bg_rounded( g1, g0, ram )

local battery = require("widgets.battery")({})
local my_battery = widget.bg( g3, battery )

local date = require("widgets.date")
local my_date = widget.bg( g1, date_widget )

local wifi = require("widgets.wifi")
local my_wifi = widget.bg( g1, wifi_widget )

-- {{{ Wibar

local mybar = class()

-- Add the bar on each screen
function mybar:init(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create a taglist for each screen
  s.mytaglist = require("widgets.taglist")(s, { mode = "text", want_layout = "horizontal" })
  --s.mytaglist = require("taglists.anonymous")
  s.mytasklist = require("widgets.tasklist")(s)

  -- Create the wibox with default options
  --s.mywibox = awful.wibar({ position = beautiful.wibar_position,
    --width = beautiful.wibar_size, bg = beautiful.wibar_bg, screen = s })

  s.mywibox = awful.wibar({ height = beautiful.wibar_size,
    bg = beautiful.wibar_bg, width = beautiful.wibar_width, screen = s })
  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    spacing = dpi(9),
        { -- Left widgets
--            my_launcher,
            layout = wibox.layout.fixed.horizontal,
            s.mypromptbox,
            --layouts,
            spacing = 12,
            s.mytaglist

      --layout = wibox.layout.fixed.horizontal
        },
    { -- More or less Middle
      layout = wibox.layout.fixed.horizontal,
      s.mytasklist
    },
    { -- Right widgets
      widget.add_margin(desktop_ctrl, { left = 13 }),
      pipe(1),
      my_battery,
      pipe(1),
      my_ram,
      pipe(1),
      my_network,
      pipe(1),
      my_wifi,
      pipe(1),
      my_date,
      pipe(1),
      my_vol,
      brightness,
      scrot,
      spacing = beautiful.widget_spacing,
      layout = wibox.layout.fixed.horizontal,
    }
--    expand = true,
--    layout = wibox.layout.align.horizontal
  }
end

return mybar
