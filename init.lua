---
---  ███╗   ██╗███████╗ ██████╗ ████████╗███████╗██╗   ██╗███████╗███████╗
---  ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██║   ██║██╔════╝╚══███╔╝
---  ██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║███████╗  ███╔╝ 
---  ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║╚════██║ ███╔╝  
---  ██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝███████║███████╗
---  ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝╚══════╝
---
--- version : v2.0.0-rc0
--- NOTE    : Comments have been extended by the use of `folke/todo-comments.nvim`. comments are enriched with color highlighting, distinct icons and are searchable via commands and key-bindings, throughout open buffers and
---           the entire project workspace.
---
---           [LEGEND]:
---             - IMPORTANT:
---               - Important information which should be understood
---             - NOTE:
---               - Information that is considered to be noteworthy 
---             - TODO:
---               - More stuff to do 
---             - HACK:
---               - Sus code (smooth brain stuff)
---             - BUG:
---               - Logical bug (also can be commitged using FIX)
---             - WARN:
---               - Possible issues or concerns
---             - TEST:
---               - Testing
---             - PERF:
---               - Performance optimization
---             - --:
---               - Regular Comment           


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                              lazy.nvim Setup & Bootstrapping                                             ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- set the default leader for key mappings
vim.g.mapleader = " " -- IMPORTANT: leader is the <space> key
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- load neoteusz specific configs
require("utils.config-loader")

-- lazy.nvim startup configuration, including plugin bootstrapping 
require("lazy").setup({
  spec = {
    { "folke/lazy.nvim",
        opts = {rocks = {enabled = false, hererocks = false }
        }
    },
    -- import plugin
    { import = "plugins.ui" }, -- IMPORTANT: load ui components first, otherwise logging using nvim-notify can be buggy 
    -- TODO: move plugins to dedicated folders based on type and priority
    { import = "plugins.lsp" },
    { import = "plugins.general" },
  }
})


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                          Other Neoteusz Specific Configurations                                          ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--
-- import plenary's async lib to avoid using callbacks
local async = require("plenary.async")
-- set "rcarriga/nvim-notify" as the may notification mechanism for neovim
local notify = require("notify")
vim.notify = notify

-- IMPORTANT: load core first and foremost
require("core")

-- NOTE: import remaining modules
require("vim-core")
-- load extensions like terminal ui apps (e.g. lazygit and k9s)
require("extensions")

-- welcome the user 
async.run(
  function()
    vim.notify(string.format("welcome %s ", os.getenv("USER")), vim.log.levels.INFO, {title = vim.g.neoteusz_name})
  end, function () end -- empty callback
)

