--* --------------------------------------------------------------- *--
--?            Language Server Protocol & interface Setup           ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: lsp-zero config no longer abstract mason.nvim, and requires mason.nvim to be configured explicitly

local lsp_zero = require("lsp-zero")

-- integration and keybindings for telescope functionality (on attach - before setup)
local lsp_attach = (function(client, bufnr)
  lsp_zero.default_keymaps({{buffer = bufnr}})
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover over documentation preview
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer = true})
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set("n", "<M-r>", vim.lsp.buf.rename, opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.keymap.set("n", "hl", function() vim.lsp.buf.document_highlight() end, opts)
  vim.keymap.set("n", "hc", function() vim.lsp.buf.clear_references() end, opts)
  vim.keymap.set("n", "ds", function() vim.lsp.buf.document_symbol() end, opts)
  -- vim.keymap.set("n", "ws", function() vim.lsp.buf.workspace_symbol() end, opts)
end)

lsp_zero.extend_lspconfig({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  lsp_attach = lsp_attach,
  float_border = 'rounded',
  sign_text = true,
})

-- NOTE: mason config - required as of lsp-zero v3.x
require('mason').setup({})
require('mason-lspconfig').setup({
-- list of language servers, debugger adapters, linters and formatters to be installed by mason and leveraged by lsp-zero
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "gopls",
    "eslint",
    "rust_analyzer",
    "terraformls",
    "tflint",
    "bashls",
    "dockerls",
    "helm_ls", -- TODO: need to figure out why the Helm language server is not rendering properly
    "pyright",
    "marksman",
  -- "yamls", -- IMPORTANT: disabled on purpose, see configurations for more details
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

