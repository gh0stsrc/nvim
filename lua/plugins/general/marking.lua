--* --------------------------------------------------------------- *--
--?                          Marking Setup                          ?--
--* --------------------------------------------------------------- *--

return {
    -- Harpoon plugin configuration
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      -- HACK: loading harpoon as a telescope extension - this will only work for harpoon v1
      require("telescope").load_extension('harpoon')
      require("harpoon").setup({
        global_settings = {
          -- set marks specific to each git branch inside git repository
          mark_branch = true
        }
      })
    end,
    keys = {
      {
        "hx",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
        desc = "Harpoon file",
      },
      {
        "hr",
        function()
          require("harpoon.mark").rm_file()
        end,
        mode = "n",
        desc = "Remove harpoon from file",
      },
      {
        "hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        mode = "n",
        desc = "Navigate to the next harpooned file",
      },
      {
        "hp",
        function()
          require("harpoon.ui").nav_prev()
        end,
        mode = "n",
        desc = "Navigate to the previous harpooned file",
      },
      {
        "hm",
        "<cmd>Telescope harpoon marks<cr>",
        mode = "n",
        desc = "Show harpoons",
      }
    },
  },
}
