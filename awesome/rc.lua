-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
beautiful.init("/home/matheus/.config/awesome/themes/one_darker/theme.lua")
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Error Handling
require("error_handling")

-- Default editor and terminal
terminal = "alacritty"
editor = os.getenv("EDITOR") or "code"
editor_cmd = terminal .. " -e " .. editor

-- Keybindings
require("keys")

-- UI
require("ui")

-- Layouts
require("layouts")

-- Menu
require("menu")

-- Wibar
require("bar")

-- Set keys
root.keys(globalkeys)

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Autostart Applications
awful.spawn.with_shell("picom --experimental-backends --xrender-sync-fence --config ~/.config/awesome/themes/one_darker/config/picom.conf")
awful.spawn.with_shell("nitrogen --restore")

awful.spawn.with_shell("~/.config/polybar/launch.sh")
-- Unused but maybe is important idk --

-- Keyboard map indicator and switcher
--mykeyboardlayout = awful.widget.keyboardlayout()
