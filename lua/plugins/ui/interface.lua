--* --------------------------------------------------------------- *--
--?                         User Interface                          ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: all fonts are required to be patched to be able to be rendered by the terminal, already patched fonts are available at https://github.com/gh0stsrc/.fonts
-- TODO: move UI components to other files to reduce the overall size of this file

-- NOTE: inform neovim to treat the `Netrw` plugin as if it was already loaded, preventing it from actually being loaded when launching neovim; required to load nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- get the desired log level set by the `NVIM_LOG_LVL` environment variable, if not set the log lvl will default to `INFO`
local log_lvl_nm = string.upper(os.getenv("NVIM_LOG_LVL") or "INFO")

-- map of log level names to vim log levels
local log_lvl_map = {
  TRACE = vim.log.levels.TRACE,
  DEBUG = vim.log.levels.DEBUG,
  INFO  = vim.log.levels.INFO,
  WARN  = vim.log.levels.WARN,
  ERROR = vim.log.levels.ERROR,
  OFF   = vim.log.levels.OFF
}

return {
  --* ------------------------------------ *--
  --?               nvim-tree              ?--
  --* ------------------------------------ *--
  {
    "nvim-tree/nvim-tree.lua",
    tag = "v1.7.1",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
    config = function () -- IMPORTANT: nvim-tree requires explicit initialization, otherwise lazy loading will break
      require("nvim-tree").setup({
        view = {
          side = "left",
          width = 30,
        },
        renderer = {
          highlight_git = true,
        },
      })
    end,
    keys = {
      {
        "<M-n>",
        "<cmd>NvimTreeToggle<cr>",
        mode = "n",
        desc = "open nvim-tree file explorer pane"
      },
      {
        "``",
        "<cmd>NvimTreeFocus<cr>",
        mode = "n",
        desc = "open nvim-tree file explorer pane, if not opened and set focus"
      }
    }
  },
  --* ------------------------------------ *--
  --?               nvim-notify            ?--
  --* ------------------------------------ *--
  {
    "rcarriga/nvim-notify", -- WARN: nvim-notify is set as the default noftication mechanism for all plugins that use the vim.notify function (see core.lua for the override)
    commit = "e4a2022f4fec2d5ebc79afa612f96d8b11c627b3",
    priority = 1000,
    lazy = false,
    config = function ()
      -- load notify as a telescope extension
      require("telescope").load_extension("notify")

      -- configure the notify plugin
      require("notify").setup({
          level = log_lvl_map[log_lvl_nm],
          icons = {
            ERROR   = "󰚌 ",
            WARN    = "󱡝 ",
            INFO    = "󰇥 ",
            DEBUG   = "󰻕 ",
            TRACE   = "󰛤 ",
        }
      })
      -- NOTE: other plugins can use notification windows by setting the nvim-notify plugin as your default notify function
      vim.notify = require("notify")
      Logger = require("utils.logger")
    end,
    keys = {
      {
        "<leader>sn",
        function () vim.cmd("Telescope notify") end,
        mode = "n",
        desc = "[S]earch [N]otifications"
      },
    }
  },
  --* ------------------------------------ *--
  --?               lualine                ?--
  --* ------------------------------------ *--
  {
    "nvim-lualine/lualine.nvim",
    commit = "2248ef254d0a1488a72041cfb45ca9caada6d994",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" }
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = "onedark",
        section_separators = { left = "", right = "" }, -- IMPORTANT: to be able to load these semi-circle fonts you will need a Patched `Nerd Fonts` installed and your temrinal configured to default to them
        component_separators = "|",
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 }, -- omit the separator for the left side of section `A`
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "fileformat" },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 }, -- omit the separator for the right side of section `Z`
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    }
  },
  --* ------------------------------------ *--
  --?              bufferline              ?--
  --* ------------------------------------ *--
  {
    "akinsho/bufferline.nvim",
    commit = "357cc8f8eeb64702e6fcf2995e3b9becee99a5d3",
    lazy = false,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "folke/which-key.nvim" },
    },
    config = function ()
      require("bufferline").setup({
        options = {
          modified_icon = "󱙄 ",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          --diagnostics_update_in_insert = true,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
             return " " .. icon .. count
          end
        }
      })
      -- add group name for the root of <leader> b and <leader> bc
      require("which-key").add({
        { "<leader>b", group = "bufferline", icon = { icon = "", color = "orange" }},
        { "<leader>bc", group = "close", icon = { icon = "󰅚", color = "red"}},
      })
    end,
    opts = {
    },
    keys = {
      {
        "<leader>bcl",
        function () vim.cmd("BufferLineCloseLeft") end,
        mode = "n",
        desc = "[C]lose buffer to the [L]eft",
      },
      {
        "<leader>bcr",
        function () vim.cmd("BufferLineCloseRight") end,
        mode = "n",
        desc = "[C]lose buffer to the [R]ight",
      },
      {
        "<leader>bcc",
        function () vim.cmd("bdelete!") end,
        mode = "n",
        desc = "[C]lose current buffer",
      },
      {
        "<leader>bco",
        function () vim.cmd("BufferLineCloseOthers") end,
        mode = "n",
        desc = "[C]lose all buffers [O]ther than the current buffer",
      },
      {
        "<leader>b]",
        function () vim.cmd("BufferLineCycleNext") end,
        mode = "n",
        desc = "Move to the next open buffer",
      },
      {
        "<leader>b[",
        function () vim.cmd("BufferLineCyclePrev") end,
        mode = "n",
        desc = "Move to the previous open buffer",
      },
      {
        "<leader>m",
        function ()
          local bufferNum = vim.v.count ~= 0 and vim.v.count or 1 -- if the keybindind is not prefaced with a number, default to 1
          require("bufferline").go_to(bufferNum, false)
        end,
        mode = "n",
        desc = "Move to the nth visible buffer (relative)",
      },
      {
        "<leader>M",
        function ()
          local bufferNum = vim.v.count ~= 0 and vim.v.count or 1 -- if the keybindind is not prefaced with a number, default to 1
          require("bufferline").go_to(bufferNum, true)
        end,
        mode = "n",
        desc = "Move to the nth buffer (absolute)",
      },
    },
  },
  --* ------------------------------------ *--
  --?            indent-blankline          ?--
  --* ------------------------------------ *--
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "29be0919b91fb59eca9e90690d76014233392bef",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function ()
      require("ibl").setup({
        scope = {
          show_exact_scope = true, -- requires treesitter
        },
        indent = {
          -- replace default char to a slimmer pipe
          char = "│",
        }
      })
    end
  },
}

