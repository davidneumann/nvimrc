require("standard.set")
require("standard.remap")

-- Primeagen stuff
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


-- vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
-- vim.g.netrw_liststyle = 0
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_winsize =  12
-- local agrp = vim.api.nvim_create_augroup
-- local acmd = vim.api.nvim_create_autocmd
-- local _general = agrp("_general", { clear = true })
-- acmd({ "VimEnter" },
--       { pattern = "*",
--         command = ":Vexplore",
--         group = _general })

-- acmd({ "FileType" },
--       { pattern = "*",
--         command = "setlocal formatoptions-=ro",
--         group = _general })
-- augroup ProjectDrawer
--   autocmd!
--   autocmd VimEnter * :Vexplore
-- augroup END
