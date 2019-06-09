local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local date = wibox.widget.textclock("%B %d")
date.align = "center"
date.valign = "center"
date.font = "Roboto Bold 18"

sidebar = wibox({
	x = 0,
	y = 0,
	visible = false,
	ontop = true,
	type = "dock"
	})

sidebar.bg = "#202020"
sidebar.fg = "#EEEEEE"

sidebar:setup {
	date,
	{},
	{}
}

