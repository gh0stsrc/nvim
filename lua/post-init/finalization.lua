--* --------------------------------------------------------------- *--
--?                      	     Post Init                            ?--
--* --------------------------------------------------------------- *--

local async = require("plenary.async")
-- welcome the user
async.run(
  function()
    vim.notify(string.format("welcome %s ", os.getenv("USER")), vim.log.levels.INFO, {title = vim.g.neoteusz_name})
  end, function () end -- empty callback
)

-- NOTE:lazy loaded plugin groups - the group will not be displayed unless the plugin is loaded
-- thus the group creation is done outside the respective plugins and even which-key's setup
local wk = require("which-key")
wk.add({
  { "<leader>h", group = "harpoon", icon = { icon = "", color = "red", }},
  { "<leader>k", group = "ai assistant", icon = { icon = "󰯉", color = "green", }},
  { "<leader>d", group = "debugger", }, -- using default icon
  { "<leader>e", group = "extensions", icon = { icon = "", color = "purple", }},
  { "<leader>x", group = "explorer", icon = { icon = "󰙅", color = "blue", }},
})

-- clipboard bootstrapping
require("post-init.clipboard")

