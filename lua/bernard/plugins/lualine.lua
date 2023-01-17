local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_theme = require("lualine.themes.wombat")

lualine_theme.command = {
	a = {
		gui = "bold",
	},
}

lualine.setup({
	options = {
		theme = lualine_theme,
	},
})
