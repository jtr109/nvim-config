local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end
bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        numbers = function(opts) -- :help bufferline-numbers
            return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
    }
}
