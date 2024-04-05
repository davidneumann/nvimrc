local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'ruff_lsp'
  -- 'pylint',
  -- 'rust_analyzer'
})

require("lspconfig").tsserver.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    -- client.cmp_nvim_lsp.default_capabilities.document_formatting = false
  end,
})

-- require("lspconfig").eslint.setup({
--   capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   on_attach = function(client)
--     client.resolved_capabilities.document_formatting = false
--     -- client.cmp_nvim_lsp.default_capabilities.document_formatting = false
--   end,
-- })

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
  -- lsp.buffer_autoformat()
  -- require "lsp_signature".on_attach({}, bufnr)     -- Note: add in lsp client on-attach

  local opts = { buffer = bufnr, remap = false }

  local function create_opts_with_desc(desc)
    local new_opts = vim.tbl_extend("force", opts, { desc = desc })
    return new_opts
  end

  if client.name == "tsserver" then
    -- client.resolved_capabilities.document_formatting = false          -- 0.7 and earlier
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, create_opts_with_desc("Go to definition"))
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, create_opts_with_desc("LSP Hover"))
  vim.keymap.set("n", "<leader>pws", function() vim.lsp.buf.workspace_symbol() end,
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

-- lsp.format_on_save({
--   servers = {
--     ['eslint'] = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--   }
-- })

lsp.format_on_save({
  servers = {
    ['null-ls'] = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
    ['pylsp'] = { "python" },
  }
})


lsp.setup()

require 'lspconfig'.eslint.setup {}

require('lspconfig').ruff_lsp.setup {}
require 'lspconfig'.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pydocsytle = { enabled = true },
      }
    }
  }
}

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    --- Replace these with the tools you have installed
    null_ls.builtins.formatting.prettierd,
  }
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

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

-- Super dumb omnisharp LSP fix
-- See: https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local function toSnakeCase(str)
      return string.gsub(str, "%s*[- ]%s*", "_")
    end

    if client.name == 'omnisharp' then
      local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
      for i, v in ipairs(tokenModifiers) do
        tokenModifiers[i] = toSnakeCase(v)
      end
      local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
      for i, v in ipairs(tokenTypes) do
        tokenTypes[i] = toSnakeCase(v)
      end
    end
  end,
})

-- require 'lspconfig'.pyright.setup {}

require 'lspconfig'.angularls.setup {
  on_attach = function(client)
    client.server_capabilities.renameProvider = false
  end,
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
