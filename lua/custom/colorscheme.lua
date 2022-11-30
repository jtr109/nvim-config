-- vim.cmd "colorscheme darkblue" -- set default color scheme

-- local colorscheme = "darkblue"
-- local colorscheme = "tokyonight"
local colorscheme = "tokyonight-day" -- light mode

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
