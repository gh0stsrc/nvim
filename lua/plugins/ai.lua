--* --------------------------------------------------------------- *--
--?                         AI Assist Setup                         ?--
--* --------------------------------------------------------------- *--

local Helpers = require("utils.helpers")

-- IMPORTANT: to leverage the chatgpt plugin you will need to provide a valid API key; see the README for more details
-- check if the env var `NVIM_ENABLE_GPT` is set to true; if so invoke the plugin's default setup, with a couple of overrides
return {
  "jackMort/ChatGPT.nvim",
  enabled = Helpers.to_boolean(os.getenv("NVIM_ENABLE_GPT")) == true,
  lazy = false,
  keys = {
    { "gpt", "<cmd>ChatGPT<cr>", mode = "n", desc = "Open ChatGPT window" },
    { "gpta", "<cmd>ChatGPTActAs<cr>", mode = "n", desc = "Open prompt prepared ChatGPT window (adopting a persona)" },
    { "gpte", "<cmd>ChatGPTEditWithInstructions<cr>", mode = "n", desc = "Open an interactive window where ChatGPT will edit a copy of the current buffer" },
    { "gptr", "<cmd>ChatGPTRun<cr>", mode = "n", desc = "Execute ChatGPT commands" },
    { "gptc", "<cmd>ChatGPTCompleteCode<cr>", mode = "n", desc = "Code completion recommendations" },
  },
  opts = {
    chat = {
      question_sign = "󰆆",
      answer_sign = "󰯉",
      border_left_sign = "",
      border_right_sign = "",
    },
    popup_window = {
      border = {
        text = {
          top = "󰯉  ChatGPT 󰯉 ",
        },
      },
    },
    openai_params = {
      model = "gpt-4-turbo",
      max_tokens = 900,
    },
  }
}

