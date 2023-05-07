local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    --'tsserver',
    'eslint',
    'rust_analyzer'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
-- 	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
-- 	['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- 	["<C-l>"] = cmp.mapping.complete(),
-- })
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    local function create_opts_with_desc(desc)
        local new_opts = vim.tbl_extend("force", opts, { desc = desc })
        return new_opts
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, create_opts_with_desc("Go to definition"))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, create_opts_with_desc("LSP Hover"))
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        create_opts_with_desc("Lists all symbols in the current workspace"))
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        create_opts_with_desc("Show diagnostics in a floating window"))
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, create_opts_with_desc("Next diagnostic"))
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, create_opts_with_desc("Previous diagnostic"))
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, create_opts_with_desc("Code action"))
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, create_opts_with_desc("LSP references"))
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, create_opts_with_desc("LSP rename"))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, create_opts_with_desc("Signature help"))
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, create_opts_with_desc("Format document"))
end)

lsp.setup()

require 'lspconfig'.eslint.setup {}
-- require('typescript').setup({
--   server = {
--     on_attach = function(client, bufnr)
--       -- You can find more commands in the documentation:
--       -- https://github.com/jose-elias-alvarez/typescript.nvim#commands
--
--       vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', {buffer = bufnr})
--     end
--   }
-- })

require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.diagnostic.config({
    virtual_text = true
})
