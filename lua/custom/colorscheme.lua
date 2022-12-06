-- vim.cmd "colorscheme darkblue" -- set default color scheme

vim.opt.background = "dark"

-- local colorscheme = "darkblue"
-- local colorscheme = "tokyonight"
-- local colorscheme = "tokyonight-day" -- light mode
-- local colorscheme = "material"
local colorscheme = "dracula"
-- local colorscheme = "one"

if colorscheme == 'material' then
  vim.g.material_theme_style  = 'default'
  -- vim.g.material_theme_style  = 'palenight'
  -- vim.g.material_theme_style  = 'ocean'
  -- vim.g.material_theme_style  = 'lighter'
  -- vim.g.material_theme_style  = 'darker'
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
