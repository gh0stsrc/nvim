--* --------------------------------------------------------------- *--
--?                           Navigation                            ?--
--* --------------------------------------------------------------- *--

return {
  {
    "christoomey/vim-tmux-navigator",
    commit = "2d8bc8176af90935fb918526b0fde73d6ceba0df",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      {
        "<C-h>",
        function() vim.cmd("TmuxNavigateLeft") end,
        desc = "Navigate to the window to the left (tmux or neovim)",
        mode = "n"
      },
      {
        "<C-j>",
        function() vim.cmd("TmuxNavigateDown") end,
        desc = "Navigate to the below window (tmux or neovim)",
        mode = "n"
      },
      {
        "<C-k>",
        function() vim.cmd("TmuxNavigateUp") end,
        desc = "Navigate to the above window (tmux or neovim)",
        mode = "n"
      },
      {
        "<C-l>",
        function() vim.cmd("TmuxNavigateRight") end,
        desc = "Navigate to the window to the right (tmux or neovim)",
        mode = "n"
      },
      {
        "<C-\\>",
        function() vim.cmd("TmuxNavigatePrevious") end,
        desc = "Navigate back to the previously accessed window (tmux or neovim)",
        mode = "n"
      },
    },
  },
}
