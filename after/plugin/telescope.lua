local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search filenames" })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "Search in git files" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Grep working directory" })
