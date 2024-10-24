--* --------------------------------------------------------------- *--
--?                          Marking Setup                          ?--
--* --------------------------------------------------------------- *--

return {
    -- Harpoon plugin configuration
  {
    "ThePrimeagen/harpoon",
    branch = "master",
    commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a",
    dependencies = {
      { "nvim-lua/plenary.nvim", commit= "50012918b2fc8357b87cff2a7f7f0446e47da174" },
      { "nvim-telescope/telescope.nvim", tag = "nvim-0.6" }
    },
    config = function()
      -- HACK: loading harpoon as a telescope extension - this will only work for harpoon v1
      require("telescope").load_extension("harpoon")
      require("harpoon").setup({
        global_settings = {
          -- set marks specific to each git branch inside git repository
          mark_branch = true
        }
      })
    end,
    keys = {
      {
        "<leader>hx",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
        desc = "Harpoon file (mark)",
      },
      {
        "<leader>hr",
        function()
          require("harpoon.mark").rm_file()
        end,
        mode = "n",
        desc = "Remove harpoon from file",
      },
      {
        "<leader>hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        mode = "n",
        desc = "Navigate to the next harpooned file",
      },
      {
        "<leader>hp",
        function()
          require("harpoon.ui").nav_prev()
        end,
        mode = "n",
        desc = "Navigate to the previous harpooned file",
      },
      {
        "<leader>sm",
        function () vim.cmd("Telescope harpoon marks") end,
        mode = "n",
        desc = "[S]earch harpoons [M]arks",
      }
    },
  },
}
