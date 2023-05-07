local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
vim.keymap.set("n", "<C-h>e", ui.toggle_quick_menu, { desc = "Open harpoon quick menu" })

vim.keymap.set("n", "<C-h>h", function() ui.nav_file(1) end, { desc = "Go to Harpoon 1" })
vim.keymap.set("n", "<C-h>j", function() ui.nav_file(2) end, { desc = "Go to Harpoon 2" })
vim.keymap.set("n", "<C-h>k", function() ui.nav_file(3) end, { desc = "Go to Harpoon 3" })
vim.keymap.set("n", "<C-h>l", function() ui.nav_file(4) end, { desc = "Go to Harpoon 4" })
