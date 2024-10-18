--* --------------------------------------------------------------- *--
--?                   Git Related Plugins Setup                     ?--
--* --------------------------------------------------------------- *--

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" }  -- override gitsigns to reflect new lines with a 'plus' sign
    }
  }
}

