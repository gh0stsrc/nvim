--* --------------------------------------------------------------- *--
--?                  Neovim Clipboard Bootstrapping                 ?--
--* --------------------------------------------------------------- *--

local Helpers = require("utils.helpers")
local async = require("plenary.async")

-- get a table of compatible clipboard providers that are currently installed on the system
local clipboard_providers = Helpers.check_clipboard_providers()

-- check if no clipboard provider has been found AND if the user has NOT explicitly disabled clipboard validation and bootstrapping
if #clipboard_providers == 0 and vim.g.neoteusz_clipboard_skip ~= true then
  -- If no providers were found, notify the user
  async.run(function()
    vim.notify(
    "No clipboard providers found, either install a compatible clipboard provider or set the `clipboard.skip` field within the config.lua file true to ignore clipboard errors. To see compatible clipboards, use the `help: g:clipboard` command (or telescope help search).",
      vim.log.levels.WARN, { title = vim.g.neoteusz_name })
  end, function() end)    -- empty callback
else
  -- if one or more providers were found, notify the user via debug message
  if ((string.upper(vim.g.neoteusz_logging_level) or "nil") == "DEBUG") then
    async.run(function()
      vim.notify("CLIPBOARD PROVIDERS FOUND: " .. "[" .. table.concat(clipboard_providers, ", ") .. "]",
        vim.log.levels.DEBUG, { title = vim.g.neoteusz_name })
    end, function() end)  -- empty callback
  end
end

-- only bootstrap tmux as the clipboard provider if the user explicitly enables bootstrapping OR tmux is the only clipboard provider on the system and there is an active tmux session attached
if vim.g.neoteusz_clipboard_tmux_bootstrap or (Helpers.onlyContains(clipboard_providers, "TMUX") and (os.getenv("TMUX") ~= nil)) then
  -- explictly set tmux as the neovim clipboard provider
  vim.g.clipboard = {
    name = "tmux",
    copy = {
      ["+"] = { "tmux", "load-buffer", "-" },
      ["*"] = { "tmux", "load-buffer", "-" },
    },
    paste = {
      ["+"] = { "tmux", "save-buffer", "-" },
      ["*"] = { "tmux", "save-buffer", "-" },
    },
    cache_enabled = true
  }
end
