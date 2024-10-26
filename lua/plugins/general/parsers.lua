--* --------------------------------------------------------------- *--
--?                           Code Parsing                          ?--
--* --------------------------------------------------------------- *--

return {
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "6f2ef910c2c320f27cf988cf4e688746f16f4f75",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", commit = "0d79d169fcd45a8da464727ac893044728f121d4" }
    },
    opts_extend = { "ensure_installed" },
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "go",
          "vim",
          "vimdoc",
          "query",
          -- "javascript",
          -- "typescript",
          -- "rust",
          "dockerfile",
          "python",
          "bash",
          "hcl",
          "terraform",
          -- "rego",
          "markdown",
          "markdown_inline"
        },
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          },
        },
      })
    end,
  },
}
