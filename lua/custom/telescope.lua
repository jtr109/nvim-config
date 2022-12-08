local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
telescope.setup {
  pickers = {
    live_grep = {
      additional_args = function(_) -- parameter: opts
        return {
          "--hidden", -- search in hidden files
        }
      end
    },
    find_files = {
      hidden = true, -- show hidden files
    }
  }
}
