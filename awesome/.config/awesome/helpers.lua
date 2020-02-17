local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

local helpers = {}

-- Create rounded rectangle shape
helpers.rrect = function(radius)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, radius)
    --gears.shape.octogon(cr, width, height, radius)
    --gears.shape.rounded_bar(cr, width, height)
  end
end

-- Create rectangle shape
helpers.rect = function()
  return function(cr, width, height)
    gears.shape.rectangle(cr, width, height)
  end
end

function helpers.create_titlebar(c, titlebar_buttons, titlebar_position, titlebar_size)
  awful.titlebar(c, {font = beautiful.titlebar_font, position = titlebar_position, size = titlebar_size}) : setup {
    {
      buttons = titlebar_buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    {
      buttons = titlebar_buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    {
      buttons = titlebar_buttons,
      layout = wibox.layout.fixed.horizontal
    },
    layout = wibox.layout.align.horizontal
  }
end

function helpers.colorize_text(txt, fg)
  local txt = txt or tostring(nil)
  return '<span foreground="'..fg..'">'..txt..'</span>'
end

function helpers.ret_content(path)
  local f = io.open(path, 'r')
  local ff = io.open("/tmp/ret_content.shit", 'a')
  ff:write(path.."\n")
  if f == nil then
    ff:close()
    return
  end
  local s = f:read("*a")
  ff:write(s.."\n")
  ff:close()
  f:close()
  return s
end

local function in_percent(size, coord)
  local value = 0
  -- if x , use width screen
  if coord == 'x' then
    value = screen_width / 100 * size
  -- if y, use height screen
  else
    value = screen_height / 100 * size
  end
  return value
end

-- Create the gravity system like subtlewm
function helpers.like_subtle(gravities) -- args: x, y, width, height
  local x = in_percent(gravities[1], 'x')
  local y = in_percent(gravities[2], 'y')
  local width = in_percent(gravities[3], 'x')
  local height = in_percent(gravities[4], 'y')
  return  { floating = true, width = width, height = height, x = x, y = y }
end


local volume_get_cmd = "pactl list sinks | grep -m 1 'Volume:' | awk '{print $5}' | cut -d '%' -f1 "
local muted_get_cmd = "pactl list sinks | grep -m 1 'Mute:' | awk '{printf \"%s\", $2}'"
local volume_notif
function helpers.volume_control(step)
    local cmd
    if step == 0 then
        -- Toggle mute
        cmd = "pactl set-sink-mute @DEFAULT_SINK@ toggle && "..muted_get_cmd
        awful.spawn.with_shell(cmd)
    else
        if step > 0 then
            sign = "+"
        else
            sign = ""
        end
        cmd = "pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ "..sign..tostring(step).."% && "..volume_get_cmd
        awful.spawn.easy_async_with_shell(cmd, function(out)
            print(out)
            out = out:gsub('^%s*(.-)%s*$', '%1')
            print(out)
            if not sidebar.visible then
                if volume_notif and not volume_notif.is_expired then
                    volume_notif.message = out
                else
                    volume_notif = naughty.notification({ title = "Volume", message = out, timeout = 2 })
                end
            end

        end)
    end
end



return helpers
