local awful = require('awful')
local filesystem = require('gears.filesystem')

local apps = {}

apps.default = {
    terminal = "alacritty",
    launcher = "rofi -modi drun -show drun",
    --lock = "xsecurelock",
    --screenshot = "gnome-screenshot",
    filebrowser = "thunar",
    browser = "firefox",
    editor = "geany"
}

local run_on_start_up = {
    "picom $HOME/.config/picom/picom.conf",
    "nitrogen --restore",
    --"unclutter",
    "thunar --daemon",
    --"blueman-applet",
    "blueman-tray",
    "nm-applet",
    "volumeicon"
    --"xfce4-power-manager --restart",
    --"numlockx"
}

function apps.autostart()
   for _, app in ipairs(run_on_start_up) do
      local findme = app
      local firstspace = app:find(" ")
      if firstspace then
         findme = app:sub(0, firstspace - 1)
      end
         awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, app), false)
   end
end

return apps