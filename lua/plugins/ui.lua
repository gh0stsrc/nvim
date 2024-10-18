--* --------------------------------------------------------------- *--
--?                             UI Setup                            ?--
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
  --?           nvim-web-devicons          ?--
  --* ------------------------------------ *--
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    -- NOTE: override icons based on patched Ubuntu Nerd Fonts
    opts = {
      override = {
        go = {
            icon = "󰟓"
          },
          md = {
          icon = "󰽛"
        },
        python = {
            icon = "󰌠"
        },
          rs = {
            icon = ""
        },
        tf = {
          icon = "󱁢"
        },
        tfvars = {
          icon = "󱁢"
        },
        ts = {
            icon = "󰛦"
        },
        lua = {
            icon = "󰢱"
        },
        yaml = {
            icon = ""
        },
        license = {
            icon = "󰿃"
        },
        makefile = {
            icon = "󰛕"
        },
      },

      override_by_filename = {
        [".gitignore"] = {
          icon = "󰊢"
        },
        [".gitconfig"] = {
          icon = "󰊢"
        },
        [".gitcommit"] = {
          icon = "󰊢"
        },
        [".gitattributes"] = {
          icon = "󰊢"
        },
        [".bashrc"] = {
          icon = ""
        },
        [".bash_profile"] = {
          icon = ""
        },
      },

      override_by_extension = {
        ["sh"] = {
          icon = ""
        },
        ["git"] = {
            icon = "󰊢"
          },
        ["Dockerfile"] = {
            icon = ""
          },
      };
    }
  },
  --* ------------------------------------ *--
  --?               codicons               ?--
  --* ------------------------------------ *--
  {
    "mortepau/codicons.nvim", -- NOTE: codicons is a dependency of dapui, which leverages codicons as part of the UI's debugger pane
    lazy = false,
  },
  --* ------------------------------------ *--
  --?               nvim-tree              ?--
  --* ------------------------------------ *--
  {
    "nvim-tree/nvim-tree.lua",
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
    end
  },
  --* ------------------------------------ *--
  --?               lualine                ?--
  --* ------------------------------------ *--
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "onedark",
        section_separators = { left = '', right = '' }, -- IMPORTANT: to be able to load these semi-circle fonts you will need a Patched `Nerd Fonts` installed and your temrinal configured to default to them
        component_separators = '|',
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 }, -- omit the separator for the left side of section `A`
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 }, -- omit the separator for the right side of section `Z`
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
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
    opts = {
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
    }
  },
  --* ------------------------------------ *--
  --?            indent-blankline          ?--
  --* ------------------------------------ *--
  {
    "lukas-reineke/indent-blankline.nvim",
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

