--* --------------------------------------------------------------- *--
--?                      Neoteusz Colorscheme                       ?--
--* --------------------------------------------------------------- *--

--* ------------------------------------ *--
--?   custom colorscheme vim overrides   ?--
--* ------------------------------------ *--
-- desired generic overrides for gruvbox
local gruvbox_overrides = {
  -- use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
  ["@comment"] = { fg = "#2ea542" }
}

-- default palette overrides for gruvbox - defaults to nil as palette overrides will only be leveragd if issues with an LSP arise
local gruvbox_palette_overrides

--* ------------------------------------ *--
--?     lazy.nvim config for gruvbox     ?--
--* ------------------------------------ *--
return {
  {
    "ellisonleao/gruvbox.nvim",
    tag = "2.0.0",
    lazy = false,
    priority = 999,
    setup = true,
    config = function ()
      --* ------------------------------------ *--
      --?             gruvbox setup            ?--
      --* ------------------------------------ *--
      require("gruvbox").setup({
        -- set gruvbox to present a harderd contrast, preferred option when using Dark Mode
        contrast = "hard",
        --* if the env `NVIM_ENABLE_BACKUP_COMMENT_COLOR` is NOT set, `overrides` will be set the initial value set of the local var `gruvbox_overrides`; otherwise it will be set to nil
        --* use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
        overrides = gruvbox_overrides,
        --* if the env `NVIM_ENABLE_BACKUP_COMMENT_COLOR` IS  set, `palette_overrides` will be set to the value by the respective conditonal control flow; otherwise it will remain as nil
        --* NOTE: this should only be used when the treesitter group/LSP semantic override to force the colour of comments is NON functional
        palette_overrides = gruvbox_palette_overrides, -- default value is nil 
      })
      --* ------------------------------------ *--
      --?       colourscheme final setup       ?--
      --* ------------------------------------ *--
      -- set the vim background to Dark Mode -- IMPORTANT: these colorscheme overrides must occur after the primary gruvbox setup
      vim.o.background = "dark"
      -- set colorscheme to gruvbox, AFTER setting all configurations
      vim.cmd("colorscheme gruvbox")
    end
  },
}

