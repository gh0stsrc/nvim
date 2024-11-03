--* --------------------------------------------------------------- *--
--?                             Testing                             ?--
--* --------------------------------------------------------------- *--

return {
  {
    "vim-test/vim-test",
    config = function ()
      -- set vim-test to launch tests in toggleterm
      vim.cmd("let test#strategy = 'toggleterm'")
    end,
    keys = {
      {
        "<leader>Tn",
        function () vim.cmd("TestNearest") end,
        mode = "n",
        desc = "Run the [n]earest test to the cursor",
      },
      {
        "<leader>Tf",
        function () vim.cmd("TestFile") end,
        mode = "n",
        desc = "Run all tests within a [f]ile",
      },
      {
        "<leader>Ts",
        function () vim.cmd("TestSuite") end,
        mode = "n",
        desc = "Run all tests within a testing [s]uite",
      },
      {
        "<leader>Tl",
        function () vim.cmd("TestLast") end,
        mode = "n",
        desc = "Re-run the [l]ast executed test",
      },
    }
  },
}
