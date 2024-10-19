--* --------------------------------------------------------------- *--
--?                     Comment Related Plugins                     ?--
--* --------------------------------------------------------------- *--

return {
  --* ------------------------------------ *--
  --?          lsp aware comments          ?--
  --* ------------------------------------ *--
  {
    "numToStr/Comment.nvim",
    opts = {
      ignore = "^$"
    }
  },
  --* ------------------------------------ *--
  --?             todo-comments            ?--
  --* ------------------------------------ *--
  {
    "folke/todo-comments.nvim",
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
      {
        "tt",
        "<cmd>TodoTelescope<cr>",
        mode = "n",
        desc = "Open Telescope preview with all comment tags"
      },

    }
  },
}

