local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Open harpoon quick menu" })

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, { desc = "Go to Harpoon 1" })
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end, { desc = "Go to Harpoon 2" })
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end, { desc = "Go to Harpoon 3" })
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end, { desc = "Go to Harpoon 4" })
