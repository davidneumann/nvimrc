local wk = require("which-key")

wk.register({
    ["<leader>v"] =
    {
        name = "LSP actions",
    },

    ["<leader>p"] =
    {
        name = "Navigation and search",
        v = {
            "<cmd>Explore<cr>",
            "File explorer / Netrw",
        },
    },

    ["<leader>g"] =
    {
        name = "Git stuff"
    },

    ["<leader>h"] =
    {
        name = "Harpoon"
    }
  ["<leader>l"] =
  {
    name = "Debugging"
  },
})
