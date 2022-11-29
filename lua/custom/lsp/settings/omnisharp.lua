local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/path/to/omnisharp-repo/run"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
-- For my device
-- local omnisharp_bin = "C:\\Users\\liryan\\omnisharp-win-x64-net6.0\\OmniSharp.exe"
local config = {
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  -- cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
  -- rest of your settings
}

return config
