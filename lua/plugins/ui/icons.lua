--* --------------------------------------------------------------- *--
--?                          Icons Setup                            ?--
--* --------------------------------------------------------------- *--

-- IMPORTANT: all fonts are required to be patched to be able to be rendered by the terminal, already patched fonts are available at https://github.com/gh0stsrc/.fonts

return {
  --* ------------------------------------ *--
  --?           nvim-web-devicons          ?--
  --* ------------------------------------ *--
  {
    "nvim-tree/nvim-web-devicons",
    priority = 1000,
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
    priority = 999,
    lazy = false,
  },
}
