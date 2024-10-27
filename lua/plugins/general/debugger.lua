--* --------------------------------------------------------------- *--
--?                            Debugging                            ?--
--* --------------------------------------------------------------- *--


local command_exists = require("utils.helpers").command_exists
local async = require("plenary.async")
local enableNvimDapGo = false
vim.notify = require("notify")

-- if the dlv debugger is not present on the system, inform the user via a notification
if not command_exists("dlv") then
  async.run(function ()
    vim.notify("The delve debugger aka `dlv`, was NOT found on your system. `dlv` is required by `nvim-dap-go`. The `nvim-dap-go` plugin will not be loaded until `dlv` is present on your system", vim.log.levels.WARN, {title = vim.g.neoteusz_name})
  end, function () end) -- empty callback
-- otherwise, set the flag to enable nvim-dap-go and allow it to be lazy loaded once the respective keybidings have been invoked
else
  enableNvimDapGo = true
  async.run(function ()
    vim.notify("The delve debugger `dlv`, was found on your system. `nvim-dap-go` will be loaded once a respective keybinding is invoked", vim.log.levels.DEBUG, {title = vim.g.neoteusz_name})
  end, function () end) -- empty callback
end


return {
  {
    "leoluz/nvim-dap-go",
    commit = "a5cc8dcad43f0732585d4793deb02a25c4afb766",
    enabled = enableNvimDapGo, -- NOTE: nvim-dap-go will only be installed if dlv installed on the system
    dependencies = {
      {
        { "mfussenegger/nvim-dap", commit = "92dc531eea2c9a3ef504a5c8ac0decd1fa59a6a3" },
        { "nvim-treesitter/nvim-treesitter", commit = "6f2ef910c2c320f27cf988cf4e688746f16f4f75" },
      },
    },
    opts = {
      -- dap_configurations accepts a list of tables where each entry represents a dap configuration
      -- for more details run :help dap-configuration
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      -- delve config
      delve = {
        -- the path to the executable dlv which will be used for debugging, by default, this is the dlv executable on your PATH
        path = "dlv",
        -- time to wait for delve to initialize the debug session, defaults to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger, defaults to string "${port}" which instructs nvim-dap to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve, defaults to an empty string, but can be used to provide flags such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example passing build flags using args is ineffective, as those are ignored by delve in dap mode
        build_flags = "",
      },
    },
    keys = {
      {
        "<leader>db",
        function () require("dap").toggle_breakpoint() end,
        mode = "n",
        desc = "Toggle breakpoint"
      },
      {
        "<leader>dc",
        function () require("dap").continue() end,
        mode = "n",
        desc = "Debugger continue"
      },
      {
        "<leader>do",
        function () require("dap").step_over() end,
        mode = "n",
        desc = "Debugger step over"
      },
      {
        "<leader>di",
        function () require("dap").step_into() end,
        mode = "n",
        desc = "Debugger step into"
      },
      {
        "<leader>d0",
        function () require("dap").step_out() end,
        mode = "n",
        desc = "Debugger step out"
      },
      {
        "<leader>dr",
        function () require("dap").run_last() end,
        mode = "n",
        desc = "Debugger run last"
      },
      {
        "<leader>d-",
        function () require("dap").repl.toggle() end,
        mode = "n",
        desc = "Toggle debugger repl"
      },
    }
  },
  {
    "folke/neodev.nvim",
    commit = "b094a663ccb71733543d8254b988e6bebdbdaca4",
    config = function ()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    commit = "34160a7ce6072ef332f350ae1d4a6a501daf0159",
    dependencies = {
      { "mfussenegger/nvim-dap", commit = "92dc531eea2c9a3ef504a5c8ac0decd1fa59a6a3" },
      { "folke/neodev.nvim", commit = "b094a663ccb71733543d8254b988e6bebdbdaca4" },
      { "nvim-neotest/nvim-nio" },
      { "mortepau/codicons.nvim", commit = "1b06e16e799809d886f9dda8e93f12133e18e392" }
    },
    config = function ()
      require("dapui").setup()
    end,
    keys = {
      {
        "<leader>du",
        function () require("dapui").toggle() end,
        mode = "n",
        desc = "Toggle DAP UI"
      }
    }
  },
}

