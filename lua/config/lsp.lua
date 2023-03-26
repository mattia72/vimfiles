--
-- LSP Configuration & Plugins-
--
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
}

local function opts_desc(opts, desc)
  opts.desc = desc
  return opts
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_ --[[client]], bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, opts_desc(bufopts, 'Open floating window'))
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts_desc(bufopts, 'Previous diagnostic msg'))
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts_desc(bufopts, 'Next diagnostic msg'))
  vim.keymap.set('n', '<leader>da', vim.diagnostic.setloclist, opts_desc(bufopts, 'List all diagnostic msg'))

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts_desc(bufopts, 'Rename all references'))
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts_desc(bufopts, 'Code action'))

  vim.keymap.set('n', '<leader>fo', function() vim.lsp.buf.format { async = true } end, opts_desc(bufopts, 'Format '))

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts_desc(bufopts, 'Goto declaration'))
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts_desc(bufopts, 'Goto definition'))
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts_desc(bufopts, 'Goto type definition'))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts_desc(bufopts, 'List all implemetation in qf'))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts_desc(bufopts, 'List all references'))

  vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts_desc(bufopts, 'Show hover info'))
  --vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts_desc(bufopts, 'Signature help'))

  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts_desc(bufopts, 'Add workspace folder'))
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts_desc(bufopts, 'Remove workspace folder'))
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts_desc(bufopts, 'List workspace foders'))
end

--local lsp_flags = {
--debounce_text_changes = 150, -- This is the default in Nvim 0.7+
--}
-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()
