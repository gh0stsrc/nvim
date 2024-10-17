--* --------------------------------------------------------------- *--
--?                      toggle terminal Setup                      ?--
--* --------------------------------------------------------------- *--

return {
  "akinsho/toggleterm.nvim",
  opts = {
    direction = "horizontal",
    size = 15,
  },
  keys = {
    {
      "<M-j>",
      "<cmd>ToggleTerm direction=horizontal<cr>",
      mode = "n",
      desc = "Open horizontal toggle terminal window"
    },
    {
      "<M-k>",
      "<cmd>ToggleTerm direction=float<cr>",
      mode = "n",
      desc = "Open floating toggle terminal window"
    },
    --* key mapping to exit terminal mode while a toggleterm window is open; hit `jj` then either `alt-j` or `alt-k` to exit a generic toggleterm window.
    -- NOTE: `lazygit` is mapped differently, as it maintains its own key bindings, refer to the README for respective key bindings.
    {
      "jj",
      [[<C-\><C-n>]],
      mode = "t",
      desc = "Jump out of terminal mode when toggle terminal windows are active"
    },
  }
}
