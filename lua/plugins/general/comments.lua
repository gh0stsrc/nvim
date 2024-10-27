--* --------------------------------------------------------------- *--
--?                           Commenting                            ?--
--* --------------------------------------------------------------- *--

return {
  {
    "numToStr/Comment.nvim",
    commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
    dependencies = {
      { "MunifTanjim/nui.nvim", commit="c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32" },
      { "nvim-lua/plenary.nvim", commit= "50012918b2fc8357b87cff2a7f7f0446e47da174" },
      { "nvim-telescope/telescope.nvim", tag = "nvim-0.6" }
    },
    opts = {
      ignore = "^$"
    }
  },
  {
    "folke/todo-comments.nvim",
    commit = "3094ead8edfa9040de2421deddec55d3762f64d1",
    lazy = false,
    opts = {
      --override icons and colours associated to comment keywords
      keywords = {
        TODO = { icon = "󰐱 ", color = "info" },
        HACK = { icon = "󰠥 ", color = "warning" },
        FIX = {
              icon = "󰻕 ",
              color = "error",
              alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        IMPORTANT = { icon = "󰚌 ", color = "error", alt = { "IMP", "!!!" } },
        WARN = { icon = "󱡝 ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "󱓞 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "󰇥 ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "󱈼", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      }
    },
    keys = {
      {
        "<leader>st",
        function () vim.cmd("TodoTelescope") end,
        mode = "n",
        desc = "[S]earch [T]odo comment tags"
      },
      {
       "]t",
       function() require("todo-comments").jump_next({keywords = {"TODO"}}) end,
       mode = "n",
       desc = "Jump to next TODO comment"
      },
      {
       "[t",
       function() require("todo-comments").jump_prev({keywords = {"TODO"}}) end,
       mode = "n",
       desc = "Jump to previous TODO comment"
      },
      {
       "]h",
       function() require("todo-comments").jump_next({keywords = {"HACK"}}) end,
       mode = "n",
       desc = "Jump to next HACK comment"
      },
      {
       "[h",
       function() require("todo-comments").jump_prev({keywords = {"HACK"}}) end,
       mode = "n",
       desc = "Jump to previous HACK comment"
      },
      {
       "]b",
       function() require("todo-comments").jump_next({keywords = {"BUG", "FIX"}}) end,
       mode = "n",
       desc = "Jump to next BUG / FIX comment"
      },
      {
       "[b",
       function() require("todo-comments").jump_prev({keywords = {"BUG", "FIX"}}) end,
       mode = "n",
       desc = "Jump to previous BUG / FIX comment"
      },
      {
       "]i",
       function() require("todo-comments").jump_next({keywords = {"IMPORTANT", "IMP"}}) end,
       mode = "n",
       desc = "Jump to next IMPORTANT comment"
      },
      {
       "[i",
       function() require("todo-comments").jump_prev({keywords = {"IMPORTANT", "IMP"}}) end,
       mode = "n",
       desc = "Jump to previous IMPORTANT comment"
      },
      {
       "]w",
       function() require("todo-comments").jump_next({keywords = {"WARNING", "WARN"}}) end,
       mode = "n",
       desc = "Jump to next WARN comment"
      },
      {
       "[w",
       function() require("todo-comments").jump_prev({keywords = {"WARNING", "WARN"}}) end,
       mode = "n",
       desc = "Jump to previous WARN comment"
      },
      {
       "]p",
       function() require("todo-comments").jump_next({keywords = {"PERF"}}) end,
       mode = "n",
       desc = "Jump to next PERF comment"
      },
      {
       "[p",
       function() require("todo-comments").jump_prev({keywords = {"PERF"}}) end,
       mode = "n",
       desc = "Jump to previous PERF comment"
      },
      {
       "]n",
       function() require("todo-comments").jump_next({keywords = {"NOTE"}}) end,
       mode = "n",
       desc = "Jump to next NOTE comment"
      },
      {
       "[n",
       function() require("todo-comments").jump_prev({keywords = {"NOTE"}}) end,
       mode = "n",
       desc = "Jump to previous NOTE comment"
      },
      {
       "]T",
       function() require("todo-comments").jump_next({keywords = {"TEST"}}) end,
       mode = "n",
       desc = "Jump to next TEST comment"
      },
      {
       "[T",
       function() require("todo-comments").jump_prev({keywords = {"TEST"}}) end,
       mode = "n",
       desc = "Jump to previous TEST comment"
      },
    }
  },
}

