local M = {}

function M.setup(_)
  local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path, {})
end

return M
