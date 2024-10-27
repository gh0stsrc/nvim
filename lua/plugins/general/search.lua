--* --------------------------------------------------------------- *--
--?                            Searching                            ?--
--* --------------------------------------------------------------- *--

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "nvim-0.6",
    dependencies = {
      { "nvim-lua/plenary.nvim", commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" },
      { "BurntSushi/ripgrep", commit = "7099e174acbcbd940f57e4ab4913fee4040c826e" },
      { "sharkdp/fd", commit = "a11f8426d4e88ccc3745cc27b700aeb5ede39013" },
      { "folke/which-key.nvim" },
    },
    config = function ()
      require("telescope").setup({})
      -- add group name for the root of <leader> s (i.e. search)
      require("which-key").add({
        { "<leader>s", group = "search", icon = { icon = "", color = "blue" }},
      })
    end,
    keys = {
      {
        "<leader>sf",
        function () require("telescope.builtin").find_files() end,
        mode = "n",
        desc = "[S]earch [F]iles",
      },
      {
        "<leader>s/",
        function () require("telescope.builtin").oldfiles() end,
        mode = "n",
        desc = "[/] Find recently opened files",
      },
      {
        "<leader>s<space>",
        function () require("telescope.builtin").buffers() end,
        mode = "n",
        desc = "[<space>] Find existing buffers",
      },
      {
        "<leader>sh",
        function () require("telescope.builtin").help_tags() end,
        mode = "n",
        desc = "[S]earch [H]elp",
      },
      {
        "<leader>sw",
        function () require("telescope.builtin").grep_string() end,
        mode = "n",
        desc = "[S]earch current [W]ord",
      },
      {
        "<leader>sg",
        function () require("telescope.builtin").live_grep() end,
        mode = "n",
        desc = "[S]earch by [G]rep",
      },
      {
        "<leader>sd",
        function () require("telescope.builtin").diagnostics() end,
        mode = "n",
        desc = "[S]earch [D]iagnostics",
      },
    },
  },
  {
    "folke/flash.nvim",
    commit = "48817af25f51c0590653bbc290866e4890fe1cbe",
    event = "VeryLazy",
    opts = {
      modes = {
        search ={
          enabled = true -- NOTE: this enables flash on regular search (i.e. `/`, `?`)
        }
      }
    },
    keys = {
      {
        "<leader>sF<enter>",
        function() require("flash").jump() end,
        mode = {"n", "x", "o"},
        desc = "Flash"
      },
      {
        "<leader>sFt",
        function() require("flash").treesitter() end,
        mode = { "n", "x", "o" },
        desc = "Flash Treesitter"
      },
      {
        "<leader>sFT",
        function() require("flash").treesitter_search() end,
        mode = {"n", "x", "o"},
        desc = "Treesitter search"
      },
      {
        "<leader>sFr",
        function() require("flash").remote() end,
        mode = "o",
        desc = "Open flash search in remote mode"
      },
      {
        "<c-s>",
        function() require("flash").toggle() end,
        mode = "c",
        desc = "Toggle flash search"
      },
    }
  },
}

