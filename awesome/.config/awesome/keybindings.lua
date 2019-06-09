-- Awesome WM - Keybindings
-- Author: recursiveR
-- Date: 03/14/2019

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")



-- ******************************
-- Default Applications
-- ******************************
terminal = "st"
browser = "firefox"
private_browser = browser .. " --private-window"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
filemanager = terminal .. " -e ranger"
gui_filemanager = "thunar"



-- ******************************
-- Modification Key Variables
-- ******************************
modkey = "Mod4"
superkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"


-- ******************************
-- Global Keybindings 
-- ******************************
globalkeys = gears.table.join(
	-- super + escape : reload awesome config
	awful.key({ superkey }, "Escape",
		awful.restart,
		{ group = "awesome", description = "reload awesome wm" }
	),

	-- super + e : launch file manager
	awful.key({ superkey }, "e",
		function () awful.spawn(filemanager) end,
		{ group = "launcher", description = "launch file manager" }
	),

	-- super + shift + e : launch gui file manager
	awful.key({ superkey, shiftkey }, "e",
		function ()	awful.spawn(gui_filemanager) end,
		{ group = "launcher", description = "launch gui file manager" }
	),

	-- Multimedia Keys
	awful.key({ }, "XF86AudioRaiseVolume",
		function () awful.spawn("amixer -q sset Master 10%+") end),

	awful.key({ }, "XF86AudioLowerVolume",
		function () awful.spawn("amixer -q sset Master 10%-") end),

	awful.key({ }, "XF86AudioMute",
		function () awful.spawn("amixer -q sset Master toggle") end),

	awful.key({ }, "XF86MonBrightnessUp",
		function () awful.spawn("xbacklight +5") end),

	awful.key({ }, "XF86MonBrightnessDown",
		function () awful.spawn("xbacklight -5") end),

	awful.key({ superkey }, "XF86MonBrightnessUp",
		function () awful.spawn("xbacklight =100") end,
		{ group = "multimedia", description = "set screen to full brightness" }),

	awful.key({ superkey }, "XF86MonBrightnessDown",
		function () awful.spawn("xbacklight =1") end,
		{ group = "multimedia", description = "set screen to lowest brightness" })
	
)

-- ******************************
-- Client Keybindings 
-- ******************************
clientkeys = gears.table.join(
	-- super + shift + q : close current window
	awful.key({ superkey, shiftkey }, "q",
		function (c) c:kill() end,
		{ group = "client", description = "close" }
	),

	-- super + f : toggle fullscreen
	awful.key({ superkey }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{ group = "client", description = "toggle fullscreen" }
	),

	-- super + m : toggle maximize
	awful.key({ superkey }, "m",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end,
		{ group = "client", description = "toggle maximize" }
	),

	-- super + shift + f : toggle floating
	awful.key({ superkey, shiftkey }, "f",
		awful.client.floating.toggle,
		{ group = "client", description = "toggle floating" }
	)
)
