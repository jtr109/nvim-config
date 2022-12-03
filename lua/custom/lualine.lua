-- https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end
lualine.setup({
  sections = {
    lualine_c = {
      {
        'filename',
        -- Filename path formatting
        -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        path = 1,
      }
    }
  }
})
