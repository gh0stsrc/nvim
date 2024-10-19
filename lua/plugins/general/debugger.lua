--* --------------------------------------------------------------- *--
--?                          Debugger Setup                         ?--
--* --------------------------------------------------------------- *--

-- NOTE: 
--           - dap (nvim-dap) is a generic protocol for neovim that will interface with various debuggers
--           - simply integrate the debugger of your choice for the language of use and configure their respective setup configurations, reference dap-go below


local command_exists = require("utils.helpers").command_exists
-- local Logger  = require("utils.logger")
-- local notify = require("notify").async
local async = require("plenary.async")
local enableNvimDapGo = false

-- BUG: need to investigate why the logger utility cannot be used here without displaying `overlapping` messages using nvim-notify,
--      this may be related to the order in which plugins are loaded and when the logger utility is loaded.
-- TODO: fix above mentioned bug
vim.notify = require("notify") -- NOTE: related to the above bug, need to set default vim notifications to use nvim-notify

-- if the dlv debugger is not present on the system, inform the user via a notification 
if not command_exists("dlv") then
  async.run(function ()
    vim.notify("The delve debugger aka `dlv`, was NOT found on your system. `dlv` is required by `nvim-dap-go`. The `nvim-dap-go` plugin will not be loaded until `dlv` is present on your system", vim.log.levels.WARN, {title = "neotuesz"})
  end)
-- otherwise, set the flag to enable nvim-dap-go and allow it to be lazy loaded once the respective keybidings have been invoked
else
  enableNvimDapGo = true
  async.run(function ()
    vim.notify("The delve debugger `dlv`, was found on your system. `nvim-dap-go` will be loaded once a respective keybinding is invoked", vim.log.levels.INFO, {title = "neoteusz"})
  end)
end


return {
  --* ------------------------------------ *--
  --?             nvim-dap-go              ?--
  --* ------------------------------------ *--
  {
    "leoluz/nvim-dap-go",
    enabled = enableNvimDapGo, -- NOTE: nvim-dap-go will only be installed if dlv installed on the system
    opts = {
      -- Additional dap configurations can be added.
      -- dap_configurations accepts a list of tables where each entry
      -- represents a dap configuration. For more details do:
      -- :help dap-configuration
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the dlv executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
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
        "<leader>dl",
        function () require("dap").run_last() end,
        mode = "n",
        desc = "Debugger run last"
      },
      {
        "<leader>dl",
        function () require("dap").repl.toggle() end,
        mode = "n",
        desc = "Debugger toggle repl"
      },
    }
  },
  --* ------------------------------------ *--
  --?                neodev                ?--
  --* ------------------------------------ *--
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    }
  },
  --* ------------------------------------ *--
  --?                 dapui                ?--
  --* ------------------------------------ *--
  {
    "rcarriga/nvim-dap-ui",
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
