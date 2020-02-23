local awidget = require("awful.widget")
local helpers = require("helpers")
local beautiful = require("beautiful")

local unknown_icon = beautiful.widget_battery_icon_unknown or ""



local function battery_info()
  local path_power="/sys/class/power_supply/"
  local bat = env.battery or "BAT0"
  local fpath = path_power..bat

  local battery_state = {
    ["Full\n"]        = { beautiful.widget_battery_icon_full, beautiful.fg_grey },
    ["Unknown\n"]     = { unknown_icon, beautiful.alert_light },

    ["Charged\n"]     = { beautiful.widget_battery_icon_charging, beautiful.primary_light },
    ["Charging\n"]    = { beautiful.widget_battery_icon_charging, beautiful.secondary_light },
    ["Discharging\n"] = { beautiful.widget_battery_icon_discharging, beautiful.alert }
  }

  ofp = io.open("/tmp/shitbat", "w")
  ifp = io.open(fpath.."/present", "r")
  io.input(ifp)
  io.output(ofp)
  io.write(io.read())
  -- if battery is present
  local bat_present = helpers.ret_content(fpath.."/present")
  if bat_present ~= "1\n" then
    return awesome.emit_signal("daemon::battery", battery_state["Unknown\n"], 0)
  end
  io.write("ok\n")

  -- state information
  local battery_status = helpers.ret_content(fpath.."/status")
  local state = battery_state[battery_status] or battery_state["Unknown\n"]
  io.write("->|"..battery_status.."|<-\n") --.."\n"..state.."\n")
  -- io.write(state)
  -- charge now
  local remaining, capacity, capacity_design
  local charge_now = helpers.ret_content(fpath.."/energy_now")
  io.write(charge_now.."\n")
  if charge_now then
    capacity = helpers.ret_content(fpath.."/energy_full")
    remaining = charge_now
    capacity_design = helpers.ret_content(fpath.."/energy_full_design") or capacity
  else
    return awesome.emit_signal("daemon::battery", battery_state["Unknown\n"], 0)
  end

  local percent = math.min(math.floor(remaining / capacity * 100), 100)
  -- io.write(percent.."\n")
  io.close(ifp)
  io.close(ofp)

  awesome.emit_signal("daemon::battery", state, percent)
end

awidget.watch('sh -c ":"', 10, function(widget, stdout)
  battery_info()
end)
