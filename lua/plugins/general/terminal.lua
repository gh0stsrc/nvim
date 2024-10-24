--* --------------------------------------------------------------- *--
--?                      toggle terminal Setup                      ?--
--* --------------------------------------------------------------- *--

return {
  "akinsho/toggleterm.nvim",
  tag = "v2.8.0",
  dependencies = {
    { "folke/which-key.nvim" },
  },
  config = function ()
      require("toggleterm").setup({
        direction = "horizontal",
        size = 15,
      })
      -- add group name for the root of <leader> t (i.e. terminal)
      require("which-key").add({
        { "<leader>t", group = "terminal", icon = { icon = "", color = "grey" }},
      })
  end,
  keys = {
    {
      "<leader>tj",
      function () vim.cmd("ToggleTerm direction=horizontal") end,
      mode = "n",
      desc = "Open horizontal toggle terminal window"
    },
    {
      "<leader>tk",
      function () vim.cmd("ToggleTerm direction=float") end,
      mode = "n",
      desc = "Open floating toggle terminal window"
    },
    --* key mapping to exit terminal mode while a toggleterm window is open
    {
      "jj", -- NOTE: `lazygit` is mapped differently, it maintains its own bindings, refer to its respective README for bindings
      function ()
        -- get all instances of toggle terminals that currently exist
        local terminals = require("toggleterm.terminal").get_all()
        -- enumerate over the toggle terminal instances
        for _, terminal in pairs(terminals) do
          -- break nvim out of terminal mode and toggle off the open terminal
          if terminal:is_open() then
            vim.api.nvim_feedkeys("<C\\-><C-n>", "n", true)
            terminal:toggle()
            break
          end
        end
      end,
      mode = "t",
      desc = "Minimize an open terminal"
    },
  }
}
