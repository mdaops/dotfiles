local colors = require("lua/rose-pine").colors()
local window_frame = require("lua/rose-pine").window_frame()

return {
	colors = colors,
	window_frame = window_frame, -- needed only if using fancy tab bar
}
