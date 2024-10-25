--* --------------------------------------------------------------- *--
--?                Artificial Intelligence Assistant                ?--
--* --------------------------------------------------------------- *--


-- IMPORTANT: to leverage the chatgpt plugin you will need to provide a valid API key; see the README for more details
-- check if the env var `NVIM_ENABLE_GPT` is set to true; if so invoke the plugin's default setup, with a couple of overrides
return {
  "jackMort/ChatGPT.nvim",
  commit = "5b6d296eefc75331e2ff9f0adcffbd7d27862dd6",
  dependencies = {
    { "MunifTanjim/nui.nvim", commit="c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32" },
    { "nvim-lua/plenary.nvim", commit= "50012918b2fc8357b87cff2a7f7f0446e47da174" },
    { "nvim-telescope/telescope.nvim" }
  },
  cond = function()
    return vim.g.neoteusz_gpt_enabled == true
  end,
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
          top = "󰯉  NeoteuszGPT 󰯉 ",
        },
      },
    },
    openai_params = {
      model =  "gpt-4-turbo",
      max_tokens = 900,
    },
  },
  keys = {
    { "<leader>k<enter>",
      function () vim.cmd("ChatGPT") end,
      mode = "n",
      desc = "Open interactive window"
    },
    {
      "<leader>kp",
      function () vim.cmd("ChatGPTActAs") end,
      mode = "n",
      desc = "Open interactive window with prompt prepared persona"
    },
    {
      "<leader>ke",
      function () vim.cmd("ChatGPTEditWithInstructions") end,
      mode = "n",
      desc = "Open interactive window with a copy of the current buffer"
    },
    {
      "<leader>kr",
      function () vim.cmd("ChatGPTRun") end,
      mode = "n",
      desc = "Execute commands"
    },
    {
      "<leader>kc",
      function () vim.cmd("ChatGPTCompleteCode") end,
      mode = "n",
      desc = "Code completion recommendations for the current buffer"
    },
  },
}

