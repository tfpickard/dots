local awful = require("awful")

-- Autostart windowless processes
local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    local findme = cmd
    local firstspace = cmd:find(' ')
    if firstspace then
      findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.with_shell(string.format(
      'pgrep -u $USER -x %s > /dev/null || pgrep -u $USER -x -f %s > /dev/null || (%s)',
      findme, findme, cmd
    ))
  end
end
awful.spawn('systemctl --user restart redshift.service &')
run_once({'xrandr --output eDP1 --mode 2048x1152'})
run_once({'compton -b >/dev/null 2>&1'})
run_once({'slack >/dev/null 2>&1'})
run_once({'signal-desktop >/dev/null 2>&1'})
--run_once({'telegram-desktop'})
run_once({'spotify >/dev/null 2>&1'})

-- run_once({ env.term .. env.term_call[1] .. 'music_n' .. env.term_call[2] .. 'ncmpcpp'})
-- run_once({ env.term .. env.term_call[1] .. 'music_c' .. env.term_call[2] .. 'cava'})
-- run_once({ env.term .. env.term_call[1] .. 'music_t' .. env.term_call[2] .. 'tmux'})
--run_once({ env.term .. env.term_call[1] .. 'chat' .. env.term_call[2] .. 'weechat'})
