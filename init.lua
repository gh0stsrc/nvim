---
---  ███╗   ██╗███████╗ ██████╗ ████████╗███████╗██╗   ██╗███████╗███████╗
---  ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██║   ██║██╔════╝╚══███╔╝
---  ██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║███████╗  ███╔╝ 
---  ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║╚════██║ ███╔╝  
---  ██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝███████║███████╗
---  ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝╚══════╝
---
--- version : v2.0.0-rc0
--- NOTE    : Comments have been extended by the use of `folke/todo-comments.nvim`. commitged comments are enriched with color highlighting, distinct icons and are searchable via commands and key-bindings, throughout open buffers and
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
--?                                               Packer Setup & Bootstrapping                                               ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- import helper functions
local Helpers = require("utils.helpers")

-- Bootstrap lazy.nvim
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


--! --------------------------------------------------------------------- !--
--?   Lazy Startup Configuration - Including Bootstrapping of Plugins     ?--
--! --------------------------------------------------------------------- !--
require("lazy").setup({
  spec = {
    --* -------------------------------------------------------------- --*
    --   NOTE: place plugins which you desire packer to install below
    --* -------------------------------------------------------------- --*


    { "folke/lazy.nvim",
        opts = {rocks = {enabled = false, hererocks = false }
        }
    },

    -- import plugins and desired configurations
    -- IMPORTANT: currently the directory structure and references of plugins is not inline with lazy.nvim requirements, importing plugins via the lazy setup function is not possible until plugins are structure as depicted here -> https://www.lazyvim.org/configuration/plugins
    { import = "plugins" },

    -- The Gruvbox color scheme is known for its warm and retro-inspired color palette, which many developers find visually pleasing and comfortable for coding. It often includes variations for different languages and file types to make syntax highlighting more readable and aesthetically pleasing
    {
      "ellisonleao/gruvbox.nvim",
      commit = "477c62493c82684ed510c4f70eaf83802e398898"
    },

    -- plugin to integrate the treesitter parsing lib into neovim
    {
      "nvim-treesitter/nvim-treesitter",
      commit = "6f2ef910c2c320f27cf988cf4e688746f16f4f75",
      build = ":TSUpdate"
    },

    -- highly extendable fuzzy finder
    {
      "nvim-telescope/telescope.nvim", tag = "nvim-0.6",                                -- IMPORTANT: telescope was previously hard tagged to `nvim-0.6`, testing with the latest verison; revert if you encounter issues
      dependencies = {
        { "nvim-lua/plenary.nvim", commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" },  -- Required  -- neovim library that provides lua functions required for the development and use of various neovim plugins
        { "BurntSushi/ripgrep", commit = "7099e174acbcbd940f57e4ab4913fee4040c826e" },     -- Required  -- line-oriented search tool that recursively searches your current directory for a regex pattern
        { "sharkdp/fd", commit = "a11f8426d4e88ccc3745cc27b700aeb5ede39013" }              -- Optional  -- fast and user-friendly alternative to the traditional find command that comes with Unix and Linux operating systems
      }
    },

    -- neovim statusline plugin written in Lua 
    {
      "nvim-lualine/lualine.nvim",
      commit = "2248ef254d0a1488a72041cfb45ca9caada6d994",
      dependencies = {
        {"nvim-tree/nvim-web-devicons", commit = "f0267921c845c42685968401bc49aa65e18d3e09" }  -- Required  -- `lualine` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
      }                                                                                         -- IMPORTANT: `nvim-web-devicons` dependencies a patched font to function on most terminals; see plugin config section for details
    },

    -- go language integration plugin for vim
    { "fatih/vim-go", commit = "1401b576c6ac382529188d3d26cff866139f2f9a" },

    -- neovim User Interface (UI) plugin for the neovim Debug Adapter Protocol (DAP)
    { "rcarriga/nvim-dap-ui",
      commit = "34160a7ce6072ef332f350ae1d4a6a501daf0159",
      dependencies = {
        { "mfussenegger/nvim-dap", commit = "92dc531eea2c9a3ef504a5c8ac0decd1fa59a6a3" }, -- Required  -- neovim DAP plugin
        { "folke/neodev.nvim", commit = "b094a663ccb71733543d8254b988e6bebdbdaca4" },     -- Required  -- setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
        { "nvim-neotest/nvim-nio" },
        { "mortepau/codicons.nvim", commit = "1b06e16e799809d886f9dda8e93f12133e18e392" } -- Required  -- `nvim-dap-ui` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `codicons.nvim` to map the fonts (default or custom)
                                                       -- IMPORTANT: this font dependencies to be patched to be properly processed by most terminals; see plugin configuration section
      }
    },

    -- plugin designed to integrate Go (the programming language) debugging capabilities with Neovim, leveraging the `nvim-dap` framework
    {
      "leoluz/nvim-dap-go",
      commit = "a5cc8dcad43f0732585d4793deb02a25c4afb766"
    },

    -- a collection of functions that will help you setup Neovim's LSP client, so you can get IDE-like features with minimum effort
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v4.x", -- IMPORTANT: currently testing `v4.x`; may have to revert back to `v3.x` if issues arise 
      dependencies = {
        { "williamboman/mason.nvim", commit = "cd7835b15f5a4204fc37e0aa739347472121a54c" },           -- Optional  -- is a neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface
        { "williamboman/mason-lspconfig.nvim", commit = "09be3766669bfbabbe2863c624749d8da392c916" }, -- Optional  -- bridges `mason.nvim` with the `lspconfig` plugin, making it easier to use both plugins together
        { "neovim/nvim-lspconfig", commit = "38da5bbe1eaab2394056109e48c7e195bdb8fdfe" },             -- Required  -- a configuration utility for the built-in Language Server Protocol (LSP) client for neovim
        { "hrsh7th/nvim-cmp", commit = "d3a3056204e1a9dbb7c7fe36c114dc43b681768c" },                  -- Required  -- a neovim plugin that provides a powerful and extensible auto-completion framework for neovim (e.g. LSP auto-completion)
        { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" },              -- Required  -- is a source (or completion provider) for the `nvim-cmp` completion framework, specifically designed to integrate with Neovim's built-in LSP client
        { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },                -- Optional  -- another source plugin for the `nvim-cmp` completion framework. While `cmp-nvim-lsp` provides completion suggestions from neovim’s built-in LSP client, cmp-buffer provides completion suggestions from the content of currently open buffers
        { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" },                  -- Optional  -- another source plugin for the `nvim-cmp` completion framework. `cmp-path` provides completion suggestions for file paths
        { "saadparwaiz1/cmp_luasnip", commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" },          -- Optional  -- another source plugin for the `nvim-cmp` completion framework. This plugin integrates `Luasnip` with `nvim-cmp`, allowing `Luasnip` snippets to be provided as completion items
        { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" },              -- Optional  -- another source plugin for the `nvim-cmp` completion framework. As the name suggests, `cmp-nvim-lua` provides Lua-specific completions
        { "L3MON4D3/LuaSnip", commit = "80a8528f084a97b624ae443a6f50ff8074ba486b" },                  -- Required  -- a snippet engine plugin for neovim. `LuaSnip` is Lua-based, fast, and extensible snippet solution that allows you to define and insert snippets of text quickly, enhancing coding efficiency.
        { "rafamadriz/friendly-snippets", commit = "43727c2ff84240e55d4069ec3e6158d74cb534b6" },      -- Optional  -- a collection of snippets that are meant to be used with snippet engines available for Neovim, like `L3MON4D3/Luasnip`, `hrsh7th/vim-vsnip`, and others
      }
    },

    -- a plugin designed to help manage terminal windows within neovim. The plugin allows users to toggle neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping
    {
      "akinsho/toggleterm.nvim",
      tag = "v2.8.0"
    },

    -- a plugin which provides an easy and efficient way to comment out lines of code in multiple programming languages.
    {
      "numToStr/Comment.nvim",
      commit = "0236521ea582747b58869cb72f70ccfa967d2e89"
    },

    -- plugin to enrich neovim with git signs (e.g. + for new lines)
    {
      "lewis6991/gitsigns.nvim",
      commit = "5a9a6ac29a7805c4783cda21b80a1e361964b3f2"
    },

    -- plugin that provides a side-by-side diff viewer for Git differences right inside Neovim. Offering a convenient way to visualize and navigate through changes in your Git repository without leaving your editor
    {
      "sindrets/diffview.nvim",
      commit = "d38c1b5266850f77f75e006bcc26213684e1e141",
      dependencies = {
        { "nvim-tree/nvim-web-devicons", commit = "f0267921c845c42685968401bc49aa65e18d3e09" }  -- Required  -- `diffview` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
                                                          -- IMPORTANT: `nvim-web-devicons` dependencies a patched font to function on most terminals; see plugin configuration section for details
      }
    },

    {
      "jackMort/ChatGPT.nvim",
      branch = "main",
      dependencies = {
        { "MunifTanjim/nui.nvim", commit="c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32" },    -- Required  -- a plugin with a highly customizable UI component framework based on Lua
        { "nvim-lua/plenary.nvim", commit= "50012918b2fc8357b87cff2a7f7f0446e47da174" },  -- Required  -- neovim library that provides lua functions required for the development and use of various neovim plugins
        { "nvim-telescope/telescope.nvim", tag = "nvim-0.6" }                             -- Required  -- `ChatGPT` levarages Telescope's fuzzy finder windows and previews - IMPORTANT: already installed explicitly
      },
      -- check if the env var `NVIM_ENABLE_GPT` is set to true; if so include the chatgpt plugin as part of the packer setup
      cond = "Helpers.to_boolean(os.getenv('NVIM_ENABLE_GPT')) == true"
    },

    -- todo-comments provide enriched comments experience with color highlighting, distinct icons and are searchable via commands and key-bindings, throughout open buffers and the entire project workspace
    {
      "folke/todo-comments.nvim",
      commit = "3094ead8edfa9040de2421deddec55d3762f64d1",
      dependencies = {
        { "nvim-lua/plenary.nvim", commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" }, -- Optional  -- required along with ripgrep for searching
        { "folke/trouble.nvim", commit = "f1168feada93c0154ede4d1fe9183bf69bac54ea" },    -- Optional  -- required for the displaying of todo versions via telescope and nvims quickfix and location lists
        { "nvim-telescope/telescope.nvim", tag = "nvim-0.6" },                            -- Optional  -- required for this neovim config, as I configured `todo-comments` to be used with Telescope's fuzzy finder windows and previews - IMPORTANT: already installed explicitly
      }
    },

    -- programmable splash screen/dashboard for neovim
    {
        "goolord/alpha-nvim",  -- Required -- required to display spalsh screen
        commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },

    -- a clipboard manager for neovim inspired by clipmenu. It records everything that gets yanked in your vim session (up to a condifgurable limit), 
    -- you can then select an entry in the history using telescope or fzf-lua which then gets populated in a register of your choice.
    {
      "AckslD/nvim-neoclip.lua",
      commit = "4e406ae0f759262518731538f2585abb9d269bac",
      dependencies = {
        { "kkharji/sqlite.lua", commit = "b7e28c8463254c46a8e61c52d27d6a2040492fc3", module = "sqlite" }, -- Required  -- SQLite/LuaJIT binding and a highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite databases
        { "nvim-telescope/telescope.nvim", tag = "nvim-0.6" },                                            -- Required  -- required for this neovim config, as I configured `neoclip` to be used with Telescope's fuzzy finder windows and previews - IMPORTANT: already installed explicitly
        { "ibhagwan/fzf-lua", commit = "293e9086f9c546ba50f48a5966b95d450bffa94f" },                      -- Optional  -- fuzzy finder, which is NOT required of you are using `Telescope`
      }
    },

    -- plugin that provides a configurable and feature-rich buffer/tabline for managing open buffers.
    {
      "akinsho/bufferline.nvim",
      commit = "357cc8f8eeb64702e6fcf2995e3b9becee99a5d3",
      dependencies = { "nvim-tree/nvim-web-devicons", commit = "f0267921c845c42685968401bc49aa65e18d3e09" } -- Required  -- `bufferline` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
      -- IMPORTANT: `nvim-web-devicons` dependencies a patched font to function on most terminals; see plugin configuration section for details
    },

    -- fancy, configurable, notification manager for NeoVim
    { "rcarriga/nvim-notify", commit = "e4a2022f4fec2d5ebc79afa612f96d8b11c627b3" },

    -- marking buffers and blazingly fast navigation of buffers
    {
      "ThePrimeagen/harpoon",
      branch = "master",
      commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a",
      dependencies = {
        { "nvim-lua/plenary.nvim", commit= "50012918b2fc8357b87cff2a7f7f0446e47da174" },  -- Required  -- neovim library that provides lua functions required for the development and use of various neovim plugins
        { "nvim-telescope/telescope.nvim", tag = "nvim-0.6" }                             -- Required  -- considered required for this neovim config, as I configured `harpoon` to be used with Telescope's fuzzy finder windows and previews - IMPORTANT: already installed explicitly
      }
    },

    -- blazingly fast search-based navigation within buffers
    { "folke/flash.nvim", commit = "48817af25f51c0590653bbc290866e4890fe1cbe" },

    -- autocompletion of paired symbols (e.g. {},(),[], ...)
    { "windwp/nvim-autopairs", commit = "0f04d78619cce9a5af4f355968040f7d675854a1" },

    -- toggable navigation pane plugin to explore project file structures 
    {
      "nvim-tree/nvim-tree.lua",
      commit = "7e3c0bee7b246ca835d5f7453db6fa19de359bab",
      dependencies = { "nvim-tree/nvim-web-devicons", commit = "f0267921c845c42685968401bc49aa65e18d3e09" }  -- Required  -- `nvim-tree` uses patched fonts, if want to see icons you must have a set of patched fonts installed and use `nvim-web-devicons` to map the fonts (default or custom)
      -- IMPORTANT: `nvim-web-devicons` dependencies a patched font to function on most terminals; see plugin configuration section for details
    },

    -- plugin to enhance the visibility of indentation levels
    {
      "lukas-reineke/indent-blankline.nvim",
      commit = "29be0919b91fb59eca9e90690d76014233392bef",
      dependencies = {
        { "nvim-treesitter/nvim-treesitter", commit = "6f2ef910c2c320f27cf988cf4e688746f16f4f75" }  -- Required  -- `nvim-treesitter` is required for language context-aware scope highlighting
      }
    },

  }
})


--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                               Plugin Specific Configurations                                             ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--

-- import async logger 
local Logger = require("utils.logger")

-- import plenary's async lib to avoid using callbacks
local async = require("plenary.async")

-- IMPORTANT: load core first and foremost
require("core")

-- IMPORTANT: load plugins first before vim-core and extensions
require("plugins2")

-- welcome the user 
async.run(
  function()
    Logger.info(string.format("[ welcome %s ]", os.getenv("USER")))
  end
)

-- NOTE: import remaining modules
require("vim-core")
require("extensions")


--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--?                                                             [Plugin Inventory]                                                            ?--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--!                                                                                                                                           !--
--?                      PLEASE REFER TO THE README FILE FOR AN ACCURATE INVENTORY OF PLUGINS AND THEIR PURPOSES                              ?--
--!                                                                                                                                           !--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--


--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--?                                                [Language Severs, LSPs, Linters & Formatters]                                              ?--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--!                                                                                                                                           !--
--?                  PLEASE REFER TO THE README FILE FOR AN ACCURATE INVENTORY OF LANGUAGE SEVERS, LSPS, LINTERS & FORMATTERS                 ?--
--!                                                                                                                                           !--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--


--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--?                                                                [References]                                                               ?--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--
--!                                                                                                                                           !--
--?                                              PLEASE REFER TO THE README FILE FOR AN REFERENCES                                            ?--
--!                                                                                                                                           !--
--! ----------------------------------------------------------------------------------------------------------------------------------------- !--

