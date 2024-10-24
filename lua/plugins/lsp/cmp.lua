--* --------------------------------------------------------------- *--
--?                      	   Auto Completion                        ?--
--* --------------------------------------------------------------- *--

return {
  {
    "windwp/nvim-autopairs",
    commit = "0f04d78619cce9a5af4f355968040f7d675854a1",
    event = "InsertEnter",
    config = function ()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    commit = "d3a3056204e1a9dbb7c7fe36c114dc43b681768c",
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" },
      { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
      { "L3MON4D3/LuaSnip", commit = "80a8528f084a97b624ae443a6f50ff8074ba486b" },
    },
    config = function ()
      local cmp = require("cmp")
      local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

      -- the meat and potatoes for cmp config
      cmp.setup({
        sources = {
          {name = "nvim_lsp"},
        },
        mapping = {
          -- IMPORTANT: since auto completion options can include expandable or jumpbable snippets they need to be accounted for when using the tab keybinding
          ["<Tab>"] = cmp.mapping(function (fallback)
            -- if the completion window is visible, tab to auto complete
            if cmp.visible() then -- Confirm completion if visible
              cmp.confirm({select = true})
            -- otherwise, if there is an expandable or jumpable snippet presented, tab to expand or jump to next section to fill in
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump() -- Jump to next snippet placeholder
            -- otherwise, use default behavior (e.g., indentation) if no menu/snippet
            else
              fallback()
            end
          end, {"i", "s" }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
          ["<PageDown>"] = cmp.mapping.scroll_docs(4),
          ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
          ["<C-p>"] = cmp.mapping(function()
            -- if the completion window is visible, select the previous item in the suggestion list
            if cmp.visible() then
              cmp.select_prev_item(cmp_select_opts)
            -- otherwise, open the completion menu and display suggestions
            else
              cmp.complete()
            end
          end, {"i", "s"}),
          ["<C-n>"] = cmp.mapping(function()
            -- if the completion window is visible, select the next item in the suggestion list
            if cmp.visible() then
              cmp.select_next_item(cmp_select_opts)
            -- otherwise, open the completion menu and display suggestions
            else
              cmp.complete()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          documentation = {
            max_height = 15,
            max_width = 60,
          }
        },
        formatting = {
          fields = {"abbr", "menu", "kind"},
          format = function(entry, item)
            local short_name = {
              nvim_lsp = "LSP",
              nvim_lua = "nvim"
            }

            local menu_name = short_name[entry.source.name] or entry.source.name
            item.menu = string.format("[%s]", menu_name)
            return item
          end,
        },
      })
    end,
  },
}

