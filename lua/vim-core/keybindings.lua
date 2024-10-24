--* ------------------------------------------------------------------------------------------------------------------------ *--
--?                                                       Key Bindings                                                       ?--
--* ------------------------------------------------------------------------------------------------------------------------ *--
--* Note: for a better understanding of all keybindings, see the README for comprehensive details.

--* --------------------------------------------------------------- *--
--?                         LEADER Key Bindings                     ?--
--* --------------------------------------------------------------- *--

-- set the default leader for key mappings
vim.g.mapleader = " " -- IMPORTANT: leader is the <space> key
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"


--* --------------------------------------------------------------- *--
--?                         Generic Key Bindings                    ?--
--* --------------------------------------------------------------- *--

--* go back
vim.keymap.set("n", "<M-b>", ":Ex<CR>")

--* insert mode cancelation
vim.keymap.set("i", "jj", "<Esc>")


-- lazy loaded plugin groups - the group will not be displayed unless the plugin is loaded 
-- thus the group creation is done outside the respective plugins 
local wk = require("which-key")
wk.add({
  { "<leader>h", group = "harpoon", icon = { icon = "", color = "red", }},
  { "<leader>k", group = "ai assistant", icon = { icon = "󰯉", color = "green", }},
  { "<leader>d", group = "debugger", }, -- using default icon
  { "<leader>e", group = "extensions", icon = { icon = "", color = "purple", }},
})

-- NOTE: all window related key binds are accessible via which-key under ctrl w

-- vim.keymap.set("t", "jj", "<Esc>")

--* split screen and navigation
-- vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true, desc = "split current window" })
-- vim.keymap.set("n", "<leader>h", ":split<CR><C-w>l", { noremap = true, desc = "split current window" })
-- vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
--* alt leader counterpart for split screen and navigation
-- vim.keymap.set("n", "<M-v>", ":vsplit<CR><C-w>l", { noremap = true })
-- vim.keymap.set("n", "<M-h>", ":wincmd h<CR>", { noremap = true })
-- vim.keymap.set("n", "<M-l>", ":wincmd l<CR>", { noremap = true })



--* --------------------------------------------------------------- *--
--?                       telescope Key Bindings                    ?--
--* --------------------------------------------------------------- *--
--* See `:help telescope.builtin`

--* telescope related key bindings
-- vim.keymap.set("n", "<leader>?",       require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
-- vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
-- vim.keymap.set("n", "<M-f>",           function()
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
--     winblend = 10,
--       previewer = false,
--   })
-- end, { desc = "[alt -f] Fuzzily search in current buffer" })

-- vim.keymap.set("n", "<leader>p",  require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
-- vim.keymap.set("n", "<M-p>",      require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" }) -- same command as above just also mapped to <alt>-p
-- vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
-- vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
-- vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })



--* --------------------------------------------------------------- *--
--?                           ChatGPT Bindings                      ?--
--* --------------------------------------------------------------- *--
--* Note: Only functions exposed by the ChatGPT plugin have been mapped to keys explictly and can be seen below. Refer to the README for more details pertaining to

-- vim.keymap.set("n", "gpt",  "<cmd>ChatGPT<cr>")                       -- open general interactive window
-- vim.keymap.set("n", "gpta", "<cmd>ChatGPTActAs<cr>")                 -- open a prompt prepared window (adopting a persona)
-- vim.keymap.set("n", "gpte", "<cmd>ChatGPTEditWithInstructions<cr>")  -- open an interactive window where ChatGPT will edit a copy of the current buffer
-- vim.keymap.set("n", "gptr", "<cmd>ChatGPTRun<cr>")                   -- execute ChatGPT commands
-- vim.keymap.set("n", "gptc", "<cmd>ChatGPTCompleteCode<cr>")          -- comeplete code recommendations


--* --------------------------------------------------------------- *--
--?                        bufferline Bindings                      ?--
--* --------------------------------------------------------------- *--

-- buffer deletion
-- vim.keymap.set("n", "<M-c>", "<cmd>bdelete!<cr>")                                    -- delete current buffer




-- vim.keymap.set("n", "cl",    "<cmd>BufferLineCloseLeft<cr>")
-- vim.keymap.set("n", "cr",    "<cmd>BufferLineCloseRight<cr>")
-- vim.keymap.set("n", "co",    "<cmd>BufferLineCloseOthers<cr>")

-- shift buffers in the bufferline
-- vim.keymap.set("n", "nn", "<cmd>BufferLineMoveNext<cr>")                             -- move the current buffer 1 position to the left
-- vim.keymap.set("n", "pp", "<cmd>BufferLineMovePrev<cr>")                             -- move the current buffer 1 potiion to the right

-- buffer selection 
-- vim.keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<cr>")                     -- move focus to the next buffer to the left of the currently opened buffer
-- vim.keymap.set("n", "<leader>[", "<cmd>BufferLineCyclePrev<cr>")                     -- move focus to the next buffer to the right of the currently opened buffer

-- relative buffer selection
-- vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")                  -- move the focus to the 1st visible buffer in the bufferline (relative positioning)
-- vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")                  -- 2nd
-- vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")                  -- 3rd
-- vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")                  -- 4th
-- vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")                  -- 5th
-- vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")                  -- 6th
-- vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>")                  -- 7th
-- vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>")                  -- 8th
-- vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>")                  -- 9th
-- vim.keymap.set("n", "<leader>0", "<cmd>BufferLineGoToBuffer -1<cr>")                 -- move the focus to the last visible buffer in the bufferline (relative positioning)

-- absolute buffer selection
-- NOTE: using the function notation as the lua command notation will break when using a dot accessor
-- vim.keymap.set("n", "<M-1>", function() require("bufferline").go_to(1, true) end)  -- move the focus to the 1st buffer in the bufferline (absolute positioning)
-- vim.keymap.set("n", "<M-2>", function() require("bufferline").go_to(2, true) end)  -- 2nd
-- vim.keymap.set("n", "<M-3>", function() require("bufferline").go_to(3, true) end)  -- 3rd
-- vim.keymap.set("n", "<M-4>", function() require("bufferline").go_to(4, true) end)  -- 4th
-- vim.keymap.set("n", "<M-5>", function() require("bufferline").go_to(5, true) end)  -- 5th
-- vim.keymap.set("n", "<M-6>", function() require("bufferline").go_to(6, true) end)  -- 6th
-- vim.keymap.set("n", "<M-7>", function() require("bufferline").go_to(7, true) end)  -- 7th
-- vim.keymap.set("n", "<M-8>", function() require("bufferline").go_to(8, true) end)  -- 8th
-- vim.keymap.set("n", "<M-9>", function() require("bufferline").go_to(9, true) end)  -- move the focus to the 9th buffer in the bufferline (absolute positioning)


--* --------------------------------------------------------------- *--
--?                       neoclip Bindings                          ?--
--* --------------------------------------------------------------- *--

-- open clipboard selection window using telescope
-- vim.keymap.set("n", "<leader>c", "<cmd>Telescope neoclip<cr>")


--* --------------------------------------------------------------- *--
--?                         notify Bindings                         ?--
--* --------------------------------------------------------------- *--

-- open notification history in telescope
-- vim.keymap.set("n", "nh", "<cmd>Telescope notify<cr>")


--* --------------------------------------------------------------- *--
--?                         harpoon Bindings                        ?--
--* --------------------------------------------------------------- *--

-- mark the file within the current buffer 
-- vim.keymap.set("n", "hx", require('harpoon.mark').add_file)
-- remove the mark for the file within the current buffer
-- vim.keymap.set("n", "hr", require('harpoon.mark').rm_file)
-- navigate to the next maked (harpooned) buffer
-- vim.keymap.set("n", "hn", require('harpoon.ui').nav_next)
-- navigate to the previous marked (harpooned) buffer
-- vim.keymap.set("n", "hp", require('harpoon.ui').nav_prev)
-- open window with all marked (harpooned) buffers using telescope
-- vim.keymap.set("n", "hm", "<cmd>Telescope harpoon marks<cr>")


--* --------------------------------------------------------------- *--
--?                          flash Bindings                         ?--
--* --------------------------------------------------------------- *--

-- open flash search
-- vim.keymap.set({"n", "x", "o"}, "<leader>s", function() require("flash").jump() end )
-- open flash search in treesitter mode
-- vim.keymap.set({"n", "x", "o"}, "<leader>t", function() require("flash").treesitter_search() end )
-- open flash in remote mode
-- vim.keymap.set("o", "<leader>r", function() require("flash").remote() end )


--* --------------------------------------------------------------- *--
--?                       nvim-tree Key Bindings                    ?--
--* --------------------------------------------------------------- *--

-- toggle the nvim-tree file explorer pane
-- vim.keymap.set("n", "<M-n>", "<cmd>NvimTreeToggle<cr>")
-- -- open nvim-tree file explorer pane, if not opened and set focus
-- vim.keymap.set("n", "``", "<cmd>NvimTreeFocus<cr>")

