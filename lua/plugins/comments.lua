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

    }
  },
  --* ------------------------------------ *--
  --?             todo-comments            ?--
  --* ------------------------------------ *--
  {
    "folke/todo-comments.nvim",
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
    }
  },
}

