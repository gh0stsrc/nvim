--* --------------------------------------------------------------- *--
--?                     Language Server Protocol   	                ?--
--* --------------------------------------------------------------- *--

return {
  {
    "williamboman/mason.nvim",
    commit = "cd7835b15f5a4204fc37e0aa739347472121a54c",
    config = function ()
      require("mason").setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "09be3766669bfbabbe2863c624749d8da392c916",
    dependencies = {
      { "williamboman/mason.nvim"},
      { "neovim/nvim-lspconfig"},
    },
    config = function ()
      require("mason-lspconfig").setup({
      -- list of language servers, debugger adapters, linters and formatters to be installed by mason and leveraged by nvim-lspconfig
        ensure_installed = {
          "lua_ls",
          -- "tsserver",
          "gopls",
          -- "eslint",
          -- "rust_analyzer",
          "terraformls",
          "tflint",
          "bashls",
          "dockerls",
          -- "helm_ls",
          "pyright",
          "marksman",
          -- "yamls",
        },
      })
    end
  },
  {
    "fatih/vim-go",
    commit = "1401b576c6ac382529188d3d26cff866139f2f9a"
  },
  {
    "neovim/nvim-lspconfig",
    commit = "38da5bbe1eaab2394056109e48c7e195bdb8fdfe",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "folke/which-key.nvim" },
    },
    config = function ()
      local lspconfig = require("lspconfig")
      local lspconfig_defaults = require('lspconfig').util.default_config

      -- NOTE: globally configure the default capabilities for all Language Server Protocol (LSP) servers in Neovim that are managed by nvim-lspconfig
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities, -- hold onto default configuration options (on_attach, capabilities, etc.) that are applied to all LSP servers unless explicitly overridden within specific lsp server configs.
        require('cmp_nvim_lsp').default_capabilities() -- a set of LSP capabilities that enable autocompletion features when using nvim-cmp with LSP servers. It ensures that LSP servers are aware of the client’s autocompletion capabilities, like completion requests, snippet support, and more.
      )

      -- lsp keymappings that are made available whenever an LSP server is attached to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}
          vim.keymap.set("n", "<leader>ld", function () vim.lsp.buf.hover() end , opts)
          vim.keymap.set("n", "<leader>lgd",  function () vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "<leader>lgD",  function () vim.lsp.buf.declaration() end, opts)
          vim.keymap.set("n", "<leader>lgi",  function () vim.lsp.buf.implementation() end, opts)
          vim.keymap.set("n", "<leader>lgt",  function () vim.lsp.buf.type_definition() end, opts)
          vim.keymap.set("n", "<leader>lcr",  function () vim.lsp.buf.rename() end, opts)
          vim.keymap.set("n", "<leader>lcf",  function () vim.lsp.buf.format({async = true}) end, opts)
          vim.keymap.set("n", "<leader>lca",  function () vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>lh<enter>",  function () vim.lsp.buf.document_highlight() end, opts)
          vim.keymap.set("n", "<leader>lhc",  function () vim.lsp.buf.clear_references() end, opts)
          vim.keymap.set("n", "<leader>llh",  function () vim.lsp.buf.signature_help() end, opts)
          vim.keymap.set("n", "<leader>llb",  function () vim.lsp.buf.document_symbol() end, opts)
          vim.keymap.set("n", "<leader>llw",  function () vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>lr<enter>",  function () vim.cmd("Telescope lsp_references") end, {buffer = true})
          vim.keymap.set("n", "<leader>lri",  function () vim.lsp.buf.incoming_calls() end, opts)
          vim.keymap.set("n", "<leader>lro",  function () vim.lsp.buf.outgoing_calls() end, opts)
        end,
      })

      -- add keybindings to which-key in a structured manner
      require("which-key").add({
        { "<leader>l",  group  = "lsp", icon = { icon = "", color = "blue" }},
        { "<leader>ld", mode   = "n", desc = "Documentation preview of symbol (floating)", icon = { icon = "", color = "purple"} },
        { "<leader>lg", group  = "goto", icon = { icon = "⚡", }},
        { "<leader>lgd",  mode   = "n", desc = "Go to symbol definition" },
        { "<leader>lgD",  mode   = "n", desc = "Go to symbol declaration" },
        { "<leader>lgi",  mode   = "n", desc = "Go to symbol implementation" },
        { "<leader>lgt",  mode   = "n", desc = "Go to symbol type definition" },
        { "<leader>lgr",  mode   = "n", desc = "Go to symbol references (telescope)" },
        { "<leader>lc", group  = "code", icon = { icon = "󰅩", color = "blue" }},
        { "<leader>lcr",  mode   = "n", desc = "Rename symbol" },
        { "<leader>lcf",  mode   = "n", desc = "Format code within the current buffer" },
        { "<leader>lca",  mode   = "n", desc = "Invoke context-aware code actions" },
        { "<leader>lh", group  = "highlight", icon = { icon = "", color = "yellow" }},
        { "<leader>lh<enter>",  mode   = "n", desc = "Highlight all occurences of the symbol" },
        { "<leader>lhc",  mode   = "n", desc = "Clear all highlights" },
        { "<leader>ll", group  = "list", icon = { icon = "󱘎", color = "green" }},
        { "<leader>llh",  mode   = "n", desc = "Display symbol signature help" },
        { "<leader>llb",  mode   = "n", desc = "List all buffer symbols" },
        { "<leader>llw",  mode   = "n", desc = "List all workspace symbols" },
        { "<leader>lr", group  = "references", icon = { icon = "", color = "purple" }},
        { "<leader>lr<enter>",  mode   = "n", desc = "Search all references (telescope)" },
        { "<leader>lri",  mode   = "n", desc = "Search call sites of the symbol (incoming)" },
        { "<leader>lro",  mode   = "n", desc = "Search all sites called by the symbol (outgoing)" },
      })

      -- NOTE:  default capabilties have already been configured globally for all LSP servers by setting `lspconfig_defaults.capabilities` earlier, ONLY custom setting should be added to particular LSP server setup configs
      --        although default configurations of language servers should be automatically handled by `mason-lspconfig`, some language servers may also require an explicit `setup({})` call to properly initialize
      --        if lsp functionality is not working for a newly added language server, add an explicit setup call for the particular language server within the `nvim-lspconfig` config function

      lspconfig.gopls.setup({})
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Recognize the 'vim' global variable as valid
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false, -- Optional: Avoids annoying prompts about third-party libraries
            },
            telemetry = {
              enable = false, -- Disable telemetry to not send data to the LSP server
            },
          },
        },
      })
      lspconfig.bashls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.terraformls.setup({})
      -- Auto format on save for tf files
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format({async = true})
        end,
      })
      lspconfig.tflint.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.yamlls.setup({})
    end,
  },
}

