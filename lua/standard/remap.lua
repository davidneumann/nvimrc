vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer / Netrw" })
--print("Hello?")

vim.keymap.set({ "n", "v" }, "<leader>", "<nop>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Concat following line. Don't move cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Rebind jump half page down to keep cursor in middle of screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Rebind jump half page up to keep cursor in middle of screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Rebind search forward keeping cursor in middle of screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Rebind search backward keeping cursor in middle of screen" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Delete motion into void" })

vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line into clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy motion into clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete motion into void" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable things I get stuck in and don't understand" })
vim.keymap.set("n", "q", "<nop>", { desc = "Disable things I get stuck in and don't understand" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document when no LSP loaded" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quick fix item global" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quick fix item global" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next quick fix item local" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous quick fix item local" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Regex replace current word" })

-- vim.keymap.set("i", "\"", "\"\"<left>")
-- vim.keymap.set("i", "'", " '<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.keymap.set("i", "{", "{}<left>")

-- close quickfix menu after selecting choice
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = { "qf" },
    command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
  })


vim.keymap.set("n", "<leader>\\", ":NvimTreeToggle<CR>", { desc = "Toggle neotree" })
vim.keymap.set("n", "<leader>|", ":NvimTreeFocus<CR>", { desc = "Focus neotree" })

vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>", { desc = "Toggle trouble" })

vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
-- vim.keymap.set('i', '<C-s>', function()
--   require('lsp_signature').toggle_float_win()
-- end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set("n", "<leader>ll", function() require 'dap'.continue() end, { desc = "Start/Continue debugging" })
vim.keymap.set("n", "<leader>lL", function() require 'dap'.run_last() end, { desc = "Run last" })
vim.keymap.set("n", "<leader>li", function() require 'dap'.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>lo", function() require 'dap'.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>lc", function() require 'dap'.step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>lb", function() require 'dap'.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>lB", function() require 'dap'.set_breakpoint() end, { desc = "Set breakpoint" })
vim.keymap.set("n", "<leader>lr", function() require 'dap'.repl.open() end, { desc = "Open REPL" })
vim.keymap.set({ 'n', 'n' }, "<leader>lh", function()
  require('dap.ui.widgets').hover()
end, { desc = "Hover" })
