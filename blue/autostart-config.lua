-----------------------------------------------------------------------------------------------------------------------
--                                              Autostart app list                                                   --
-----------------------------------------------------------------------------------------------------------------------

-- Grab environment
local awful = require("awful")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local autostart = {}

-- Application list function
--------------------------------------------------------------------------------
function autostart.run()
	-- utils
	awful.spawn.with_shell("compton")
	awful.spawn.with_shell("nm-applet")
	awful.spawn.with_shell("xrandr --output eDP1 --primary --auto --output HDMI1 --auto --right-of eDP1")
	awful.spawn.with_shell("/usr/bin/xinput set-prop 13 288 1")
	awful.spawn.with_shell("/usr/bin/xinput set-prop 17 306 1")
	awful.spawn.with_shell("setxkbmap us -variant intl")
	awful.spawn.with_shell("pamac-tray")
	awful.spawn.with_shell("jgmenu --no-spawn")
	awful.spawn.with_shell("pulseaudio --daemonize && start-pulseaudio-x11")
	
--	awful.spawn.with_shell("bash ~/scripts/env/pa-setup.sh")
--	awful.spawn.with_shell("bash ~/scripts/env/color-profile-setup.sh")

--	awful.spawn.with_shell("sleep 1 && bash ~/scripts/firefox/ff-sync.sh")

	-- gnome environment
--	awful.spawn.with_shell("/lib/gsd-xsettings")
	awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- keyboard layouts
--	awful.spawn.with_shell("kbdd")
--	awful.spawn.with_shell("bash ~/scripts/env/kbdd-setup.sh")

	-- apps
	awful.spawn.with_shell("megasync")
	awful.spawn.with_shell("redshift-gtk")
--	awful.spawn.with_shell("clipflap")
--	awful.spawn.with_shell("transmission-gtk -m")

end

-- Read and commads from file and spawn them
--------------------------------------------------------------------------------
function autostart.run_from_file(file_)
	local f = io.open(file_)
	for line in f:lines() do
		if line:sub(1, 1) ~= "#" then awful.spawn.with_shell(line) end
	end
	f:close()
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return autostart
