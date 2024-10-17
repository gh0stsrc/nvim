--* --------------------------------------------------------------- *--
--?                 Navigation Related Plugin Setup                 ?--
--* --------------------------------------------------------------- *--

return {
  {
    "folke/flash.nvim",
    lazy = false,
    opts = {
      modes = {
        search ={
          enabled = true -- NOTE: enable flash on regular search (i.e. `/`, `?`)
        }
      }
    },
    keys = {
      {
        "<leader>s",
        function() require("flash").jump() end,
        mode = {"n", "x", "o"},
        desc = "Open flash search"
      },
      {
        "<leader>t",
        function() require("flash").treesitter_search() end,
        mode = {"n", "x", "o"},
        desc = "Open flash search in treesitter mode"
      },
      {
        "<leader>r",
        function() require("flash").remote() end,
        mode = "o",
        desc = "Open flash search in remote mode"
      },
    }
  }
}
