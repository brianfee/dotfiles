local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local accent = "#0B76DE"
local bg = "#101010"

local update_interval = 60

local battery_bar = wibox.widget {
	max_value = 100,
	value = 50,
	forced_height = 10,
	margins = { top = 8, bottom = 8 },
	forced_width = 20,
	shape				= gears.shape.rounded_bar,
	bar_shape 			= gears.shape.rounded_bar,
	color				= accent,
	background_color 	= bg,
	border_width 		= 0,
	border_color		= "#686868",
	widget				= wibox.widget.progressbar
}

local function update_widget( bat )
	battery_bar.value = tonumber(bat)
end

local bat_script = [[
	bash -c "
		acpi -b | awk -F'[,:%]' '{print $3}' | {
		read -r capacity 

		echo "$capacity"
		}
	"
]]

awful.widget.watch(bat_script, update_interval, function( widget, stdout )
	local bat = stdout
	update_widget(bat)
	end
)

return battery_bar
