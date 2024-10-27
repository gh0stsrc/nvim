--* --------------------------------------------------------------- *--
--?                      Neoteusz Colorscheme                       ?--
--* --------------------------------------------------------------- *--

-- desired generic overrides for gruvbox
local gruvbox_overrides = {
  -- use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
  ["@comment"] = { fg = "#2ea542" }
}

-- default palette overrides for gruvbox - defaults to nil as palette overrides will only be leveragd if issues with an LSP arise
local gruvbox_palette_overrides

return {
  {
    "ellisonleao/gruvbox.nvim",
    tag = "2.0.0",
    lazy = false,
    priority = 999,
    setup = true,
    config = function ()
      require("gruvbox").setup({
        -- set gruvbox to present a harderd contrast, preferred option when using Dark Mode
        contrast = "hard",
        --* use a treesitter group/LSP semantic override to force the colour of comments to green (supported for all installed LSPs)
        overrides = gruvbox_overrides,
        palette_overrides = gruvbox_palette_overrides,
      })
      --* ------------------------------------ *--
      --?      colourscheme finalization       ?--
      --* ------------------------------------ *--
      -- set the vim background to Dark Mode -- IMPORTANT: these colorscheme overrides must occur after the primary gruvbox setup
      vim.o.background = "dark"
      -- set colorscheme to gruvbox, AFTER setting all configurations
      vim.cmd("colorscheme gruvbox")
    end
  },
}

