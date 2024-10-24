--* --------------------------------------------------------------- *--
--?                 Interactive Keybinding Explorer                 ?--
--* --------------------------------------------------------------- *--

-- NOTE: `whichkey` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)


return {
  "folke/which-key.nvim",
  tag = "v3.13.3",
  dependencies = {
    {"nvim-tree/nvim-web-devicons" },
    {"echasnovski/mini.icons" },
  },
  event = "VeryLazy",
  opts = {
    -- disable icons
    -- icons = {
    --   mappings = false
    -- }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
