```
    ███╗   ██╗███████╗ ██████╗ ████████╗███████╗██╗   ██╗███████╗███████╗
    ████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██║   ██║██╔════╝╚══███╔╝
    ██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║███████╗  ███╔╝ 
    ██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║╚════██║ ███╔╝  
    ██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝███████║███████╗
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝╚══════╝
```

A simple and powerful setup for neovim.

>[!NOTE]
>Version `1.x.x` leveraged [packer.nvim](https://github.com/wbthomason/packer.nvim) as the package manager; however, packer is no longer actively maintained. `v2.x.x` and beyond will leverage [lazy.nvim](https://github.com/folke/lazy.nvim/tree/stable) as the defacto package manager (unless stated otherwise).
>
> In addition, it should be noted that this configuration and the instructions outlined, were implemented on a `Ubuntu 24.04 LTS (Noble Numbat)` system using a `v0.9.4` neovim app image; instructions may need to be tailored for other linux distributions or neovim versions.

Thank you for stopping and have fun!

---
### Plugin Inventory

- [lazy.nvim](https://github.com/folke/lazy.nvim):
    - `lazy.nvim` is a modern plugin manager for Neovim.

- [gruvbox](https://github.com/morhetz/gruvbox)
  - `gruvbox`, the color scheme is known for its warm and retro-inspired color palette, which many developers find visually pleasing and comfortable for coding. It often includes variations for different languages and file types to make syntax highlighting more readable and aesthetically pleasing.

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
  - `alpha` a fast and fully programmable dashbboard plugin for neovim
 
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
  - `bufferline` is a popular Neovim plugin that provides a customizable and feature-rich buffer/tabline for managing open buffers in Neovim. It enhances the visual representation of buffers in Neovim, making it easier to navigate and manage multiple open files.
  - **Features:**
    - **_Tabline Replacement_**: It replaces Neovim's default tabline with a more informative and visually appealing bufferline. This bufferline can display icons, buffer names, and other metadata for each open buffer.
    - **_Buffer Sorting_**: You can configure how buffers are sorted within the bufferline, whether it's based on the order of creation, file name, or other criteria.
    - **_Buffer Icons_**: bufferline.nvim supports displaying file icons next to buffer names, making it easier to identify file types.
    - **_Close Buttons_**: It allows you to add close buttons to individual buffers in the bufferline for easy buffer closing.
    - **_Customization_**: The plugin is highly customizable, allowing you to tailor the appearance and behavior of the bufferline to your preferences.
    - **_Integration with Other Plugins_**: It can integrate with other Neovim plugins, such as nvim-web-devicons for file icons and nvim-bufferline.lua for enhanced functionality.

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - `indent-blankline.nvim` is a plugin is designed to enhance the visibility of indentation levels within your code or text documents.
  - **Features:**
    - Displaying vertical lines at each indentation level for improved readability.
    - Customizable appearance: You can adjust the color, style, and behavior of the indentation lines according to your preferences.
    - Support for various types of indentation, including spaces and tabs.
    - Compatibility with other Neovim features and plugins.

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - `treesitter` is a parser generator tool and an incremental parsing library
    It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited
  - **_nvim-treesitter is required for IDE functionality such as parsing, syntax highlighting, code analysis and incremental selection_**

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - `telescope` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core
  - <code style="color : red"><b>Dependencies</b></code> 
    - `plenary`
    - `codicons`
    - `nvim-tree/nvim-web-devicons`
    - `ripgrep`
    - `fd` _(optionally)_

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
  - `harpoon` is a productivity plugin for Neovim that aims to help developers quickly navigate between files, terminals, and marks within their development environment. It provides a way to create shortcuts to frequently accessed resources, making it faster and more convenient to switch between different parts of a project.
  - **Features:**
    - **_File Navigation_**: Quickly jump between a predefined set of files.
    - **_Terminal Integration_**: Access and manage multiple terminals within Neovim.
    - **_Marks_**: Set marks in files for rapid navigation.
    - **_Ease of Use_**: Intuitive commands and shortcuts to improve workflow.

- [folke/flash.nvim](https://github.com/folke/flash.nvim)
  - `flash` lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.
  - **Features:**
    - Search Integration: integrate flash.nvim with your regular search using / or ?. Labels appear next to the matches, allowing you to quickly jump to any location. Labels are guaranteed not to exist as a continuation of the search pattern.
    - type as many characters as you want before using a jump label.
    - Enhanced `f`, `t`, `F`, `T` motions
    - Treesitter Integration: all parents of the Treesitter node under your cursor are highlighted with a label for quick selection of a specific Treesitter node.
    - Jump Mode: a standalone jumping mode similar to search
    - Search Modes: `exact`, `search` (regex), and `fuzzy` search modes
    - Multi Window jumping
    - Remote Actions: perform motions in remote locations
    - dot-repeatable jumps
    - highly extensible: check the [examples](https://github.com/folke/flash.nvim#-examples)

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
  - `ripgrep`, also known as rg, is a line-oriented search tool that recursively searches your current directory for a regex pattern. It is developed by Andrew Gallant (also known by his GitHub handle BurntSushi) and is written in Rust. `ripgrep` is similar to other search tools like ack and ag (The Silver Searcher), but it is typically faster.
  - **Features:**
    - **_Speed_**: It is incredibly fast, owing to the efficient use of Rust's performance and safe regex library.
    - **_Respects your ignore type files_**: By default, `ripgrep` will respect your `.gitignore` and `.ignore` files, which means it won't search through the files and directories listed in those files.
    - **_Unicode Aware_**: It can handle Unicode characters and searches UTF-8 encoded files.
    - **_Supports a variety of file types_**: It can search through specific file types and exclude others.
    - **_Colorized Output_**: Provides colorized terminal output for better readability of results.
    - **_customization_**: Offers numerous flags to customize your searches.
  - <code style="color : red"><b>IMPORTANT</b></code> 
    - <code style="color : red">`ripgrep` is a telescope.nvim dependency. Depending on results from the `:checkhealth (nvim)` command, you may need to create a symbolic link for `rg`, where lazy has installed it in a directory accessible via `$PATH`</code>

- [sharkdp/fd](https://github.com/sharkdp/fd)
  - `fd` is a fast and user-friendly alternative to the traditional find command that comes with Unix and Linux operating systems. Developed by David Peter (sharkdp), it's written in Rust, making it highly efficient and fast.
  - **Features:**
    - **_Simplicity_**: The syntax is simple and doesn’t require unnecessary flags by default.
    - **_Speed_**: Typically faster than the traditional find command, especially for larger searches.
    - **_User-friendly_**: Results are colorized by default, and it uses smart case search.
    - **_Respects your ignore type files_**: Just like `ripgrep`, `fd` respects `.gitignore` files, which helps in excluding unwanted files and directories from the search.
    - **_Regex Support_**: Supports regular expression searches.
    - **_Unicode Support_**: It handles Unicode characters well.
    - **_Customizable_**: Provides various options and flags for customization.
  - <code style="color : red"><b>IMPORTANT</b></code> 
    - <code style="color : red">`fd` is a telescope.nvim dependency.</code>
      - <code style="color : red">Depending on results from the `:checkhealth` command (nvim), you may need to install `fd-find` globally. This can be done via `sudo apt install fd-find` and creation of a symbolic link to shadow existing implementations of `fd`, via `ln -s $(which fdfind) ~/.local/bin/fd`.</code>
      - <code style="color : red">Ensure that `$HOME/.local/bin` is in your `$PATH`.</code>

- [jackMort/ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim)
  - `ChatGPT` is a Neovim plugin that allows you to effortlessly utilize the OpenAI ChatGPT API, empowering you to generate natural language responses from OpenAI's ChatGPT directly within the editor in response to your inquiries.
  - **Features:**
    - **_Interactive Q&A_**: Engage in interactive question-and-answer sessions with the powerful gpt model (ChatGPT) using an intuitive interface.
    - **_Persona-based Conversations_**: Explore various perspectives and have conversations with different personas by selecting prompts from Awesome ChatGPT Prompts.
    - Code Editing Assistance: Enhance your coding experience with an interactive editing window powered by the gpt model, offering instructions tailored for coding tasks.
    - **_Code Completion_**: Enjoy the convenience of code completion similar to GitHub Copilot, leveraging the capabilities of the gpt model to suggest code snippets and completions based on context and programming patterns.
    - **_Customizable Actions_**: Execute a range of actions utilizing the gpt model, such as grammar correction, translation, keyword generation, docstring creation, test addition, code optimization, summarization, bug fixing, code explanation, Roxygen editing, and code readability analysis. Additionally, you can define your own custom actions using a JSON file.
  - <code style="color : red"><b>Dependencies</b></code> 
      - `plenary`
      - `telescope`
      - `nui`
      - <code style="color : red">Patched Fonts (e.g. Nerd Fonts); PLEASE REFER TO [REFERENCES SECTION](#references) TO SEE HOW TO PATCH A FONT</code>

- [MunifTanjim/nui.nvim"](https://github.com/MunifTanjim/nui.nvim)
  - `nui` is a plugin for Neovim, and it's a highly customizable UI component framework based on Lua. This plugin aims to provide developers with components such as prompts, menus, and dialogs to help build interactive user interfaces within Neovim.

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - `plenary` is a neovim library that provides lua functions required for the development and use of various neovim plugins.

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - `lualine` is a blazing fast and easy to configure neovim statusline written in Lua.
  - <code style="color : red"><b>Dependencies</b></code> 
    - `nvim-web-devicons`

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - `nvim-web-devicons` is a lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.

- [fatih/vim-go](https://github.com/fatih/vim-go)
  -`vim-go` is a plugin for the Vim text editor, specifically aimed at providing an enhanced environment for developing Go.
    the plugin is developed to augment Vim with Go development features and tools, enabling a powerful and integrated workflow for Go development within the Vim environment.

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - `nvim-dap` is a generic protocol for neovim that will interface with various debuggers. dap allows you to:
    - launch an application to debug
    - attach to running applications and debug them
    - set breakpoints and step through code
    - inspect the state of the application

- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
  - `dapui` is a User Interface (UI) for nvim-dap which provides a good out of the box configuration.
  - <code style="color : red"><b>Dependencies</b></code> 
    - `neodev`
    - `codicons`
    - <code style="color : red">Patched Codicons Font; PLEASE REFER TO [REFERENCES SECTION](#references)TO SEE HOW TO PATCH THIS FONT</code>
    
- [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
  - `nvim-dap-go` is an extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.

- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
  - `neodev` setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  - It is highly recommended to use neodev to enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions.

- [mortepau/codicons.nvim](https://github.com/mortepau/codicons.nvim)
  - `codicons` is a small library containing the codicons from VS Code and some functions to simplify the usage of them.

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - `nvim-lspconfig` is a configuration utility for the built-in Language Server Protocol (LSP) client for neovim. 
  - the Language Server Protocol is a standard for implementing programming language smart features, such as autocompletion, go to definition, and find references, by using language servers that communicate with development environment editors and IDEs.

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - `mason` is a neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - `mason-lspconfig` bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
  - `mason-lspconfig`.nvim closes some gaps that exist between `mason` and `lspconfig`. 
  - `mason-lspconfig`'s main responsibilities are to:
    - register a setup hook with lspconfig that ensures servers installed with mason.nvim are set up with the necessary configuration
    - provide extra convenience APIs such as the :LspInstall command
    - allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
    - translate between lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)

  - <code style="color : red"><b>IMPORTANT</b></code>  <code style="color : red">this plugin uses the lspconfig server names in the APIs it exposes - not mason.nvim package names. [See this table for a complete mapping](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md)</code>

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - `nvim-cmp` is a Neovim plugin developed by hrsh7th that provides a powerful and extensible auto-completion framework for Neovim. it is designed to be a completion engine for Neovim and is part of the Neovim ecosystem that has grown around its native support for the Language Server Protocol (LSP).

- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  - `cmp-nvim-lsp` is a source (or completion provider) for the `hrsh7th/nvim-cmp` completion framework, specifically designed to integrate with Neovim's built-in LSP (Language Server Protocol) client. The LSP client communicates with language servers to provide intelligent code completion, diagnostics, and other language features.
  - `cmp-nvim-lsp` allows nvim-cmp to provide completion suggestions based on the information provided by the LSP, like variable names, methods, functions, and more relevant to the programming language you are working with.

- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
  - `cmp-buffer` is another source for the hrsh7th/nvim-cmp completion framework. While hrsh7th/cmp-nvim-lsp provides completion suggestions from Neovim’s built-in Language Server Protocol (LSP) client, cmp-buffer provides completion suggestions from the content of the currently open buffers.
  - This means that cmp-buffer will suggest words and phrases that exist in your currently open buffers, regardless of whether they are recognized as symbols or identifiers by a language server. This can be useful when working with any kind of text, not just code, as it can suggest completions based on what you have already typed or have open in another buffer.

- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
  - `cmp-nvim-lua` is another source plugin for the `hrsh7th/nvim-cmp` auto-completion framework for Neovim. As the name suggests, cmp-nvim-lua provides Lua-specific completions, likely based on the Lua runtime and libraries available within the Neovim environment.
  - This means that when you're writing Lua code, particularly when you're working with your Neovim configuration (which is commonly written in Lua), this source will provide autocompletion suggestions relevant to the Lua language and Neovim’s Lua API.

- [L3MON4D3/Luasnip](https://github.com/L3MON4D3/LuaSnip)
  - `Luasnip` is a snippet engine plugin for Neovim. It's a Lua-based, fast, and extensible snippet solution for Neovim that allows you to define and insert snippets of text quickly, enhancing coding efficiency. Snippets are small pieces of reusable code or text that you can insert into your files, and they often have placeholders that you can jump between and fill out.

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - `autopairs` is designed to automatically close pairs of characters like parentheses, brackets, and quotes as you type, providing a smoother and faster coding experience.
  - **Features:**
    - **_Auto Closing_**: Automatically insert the closing character when you type an opening character (e.g., typing ( results in () with the cursor placed between the parentheses).
    - **_Auto Jumping_**: If the cursor is next to a closing character, typing that closing character will move the cursor to the right of it, instead of inserting another closing character.
    - **_Fast Wrap_**: Allows you to quickly wrap existing text with pairs of characters.
    - **_Intelligent Deletion_**: Helps with deleting pairs of characters intelligently to avoid leaving behind orphaned characters.
    - **_Support for Multiple File Types_**: The plugin can be configured to work with various programming languages and file types, respecting their unique syntax and characteristics.
    - **_Integration with Other Plugins_**: nvim-autopairs can be integrated with other Neovim plugins like completion plugins, providing a seamless coding experience.

- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - `toggleterm` is a Neovim plugin written in Lua, designed to help manage terminal windows within Neovim. The plugin allows users to toggle Neovim's built-in terminal easily, meaning you can show or hide the terminal window with a single command or key mapping.
  - **Features:**
    - **_Toggle Mechanism_**: Allows you to easily toggle between the terminal and your regular Neovim window
    - **_Multiple Terminals_**: Supports managing multiple terminals and provides commands to navigate between them
    - **_Persistent Layout_**: Terminals can maintain their size and layout between toggles
    - **_Customization_**: It can be customized to fit your needs, including custom commands, size, and direction preferences
    - **_Integration_**: Works well with other Neovim plugins and follows Neovim's conventions for terminal windows

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - `Comment.nvim` is a Neovim plugin written in Lua, which provides an easy and efficient way to comment out lines of code in multiple programming languages. Commenting is a common task in coding, and this plugin helps automate and streamline the process. 
  - **Features:**
    - Supports treesitter. [Read more](https://github.com/numToStr/Comment.nvim#treesitter)
    - Supports `commentstring`. Read `:h comment.commentstring`
    - Supports line (`//`) and block (`/* */`) comments
    - Dot (`.`) repeat support for gcc, gbc and friends
    - Count support for `[count]gcc` and `[count]gbc`
    - Left-right (`gcw` `gc$`) and Up-Down (`gc2j` `gc4`k) motions
    - Use with text-objects (`gci{` `gbat`)
    - Supports pre and post hooks
    - Ignore certain lines, powered by Lua regex 

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - `gitsigns` is a Neovim plugin designed to enhance the user's experience when working with Git repositories by providing signs in the 'signcolumn' (the area just left of the line numbers). These signs indicate changes relative to the Git index (staged changes). The plugin is written in Lua and is optimized for performance, making it a popular choice among Neovim users.
  - **Features:**
    - **_Change Indicators_**: It shows added, modified, and removed lines using different signs.
    - **_Inline Blame_**: It can display Git blame information directly within the editor.
    - **_Staging/Unstaging_**: The plugin allows you to stage or unstage hunks of changes directly from Neovim.
    - **_Navigation_**: You can navigate between different hunks of changes easily using provided key mappings.
    - **_Customizable_**: gitsigns.nvim offers a variety of customization options. You can adjust the signs' appearance, choose the colors, or change the key mappings.
    - **_Integration with Native LSP_**: Some functionalities of the plugin can benefit from the integration with Neovim's built-in LSP (Language Server Protocol), if available.
    - **_Preview Hunks_**: gitsigns.nvim also provides a way to preview the differences in a hunk without navigating to them, which can be helpful to get a quick glance at the changes.

- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - `fzf` is a Neovim plugin that provides a Lua interface to the popular fzf fuzzy finder. fzf is a command-line tool that allows for interactive searching and filtering of lists, and it has been integrated into many editors and shells to provide enhanced fuzzy searching capabilities.
  - **Features:**
    - **_Rich Features_**: fzf-lua provides a range of features to make the most of fzf within Neovim, such as:
      - Fuzzy finding files, buffers, Git files, and more.
      - Searching for text with ripgrep (or other tools) and viewing results in fzf.
      - Browsing Neovim's help system.
      - Integrations with LSP (Language Server Protocol) for actions like finding references, document symbols, workspace symbols, and more.
      - Preview window with customizable rendering, including tree-like file browsing and colored syntax highlighting.
    - **_Customizable_**: The plugin offers a wide range of customization options, from visual appearance to underlying tools and commands. For instance, while it defaults to using ripgrep for text searches, you can configure it to use other tools if you prefer.
    - **_Performance_**: fzf-lua is designed to be fast and efficient, offering the power of fzf without unnecessary overhead.
    **_Integrated Experience_**: One of the main goals of the plugin is to offer a seamless and integrated fzf experience within Neovim, making common tasks quicker and more intuitive.

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - `nvim-tree` is a popular file explorer plugin for Neovim, written in Lua. It provides a visual tree-like structure to navigate your file system, making it easier to browse, open, and manage files and directories directly from Neovim. This plugin is designed to be highly customizable and extendable, fitting seamlessly into a modern Neovim setup that utilizes Lua for configuration and plugins.
  - **Features:**
    - **_File Browsing_**: Navigate through your file system, open files, and directories.
    - **_Git Integration_**: Show git status of files (added, modified, untracked, etc.).
    - **_Customizable_**: Customize its appearance and behavior to suit your workflow.
    - **_Actions_**: Perform various actions on files/directories like copy, paste, rename, delete, etc.
    - **_Icons and Colors_**: Supports file icons and color highlighting based on file type or status.
    - **_Integration with Other Plugins_**: Can be integrated with other popular Neovim plugins and tools.
    - **_LSP_**: Supports LSP (Language Server Protocol) for various file operations.
    - **_File Operations_**: Perform operations like create, delete, rename, and move on files and directories.
    - **_Search_**: Quickly search and jump to files or directories.
    - **_Keybindings_**: Comes with default keybindings, but allows for full customization.

---
### Language Severs, LSPs, Linters & Formatters

- [bash-language-server (bashls)](https://github.com/bash-lsp/bash-language-server)
  - `bash-language-server` is a language server for Bash, implemented by the bash-lsp project.

- [dockerfile-language-server (dockerls)](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
  -  `dockerfile-language-server` is a language server implementation for Dockerfiles, written in TypeScript.
  
- eslint-lsp (eslint)
  - `eslint-lsp` refers to the integration of ESLint with Language Server Protocol (LSP). ESLint is a widely-used tool in the JavaScript (and TypeScript) community for identifying and fixing problems in your code, and it’s commonly integrated into development workflows to improve code quality and maintain coding standards

- [gopls](https://github.com/golang/tools/tree/master/gopls)
  - `gopls` (pronounced "go please") is the official language server for the Go programming language. It's developed by the Go team, and it provides IDE-like features to text editors and integrated development environments (IDEs) that support the Language Server Protocol (LSP).

- [helm-ls (helm_ls)](https://github.com/mrjosh/helm-ls)
  - `helm-ls` is an implementation of a Language Server Protocol (LSP) for the Helm templating language.
    
- [pyright](https://github.com/microsoft/pyright)
  - `pyright` is a static type checker and LSP for Python, developed by Microsoft. It is designed to address Python’s dynamic typing by using static type annotations, allowing developers to catch type errors before runtime, improve code quality, and enhance developer productivity. It is written in TypeScript and runs on Node.js.

- [terraform-ls (terraformls)](https://github.com/hashicorp/terraform-ls)
  - `terraform-ls` is the official Language Server Protocol (LSP) implementation for Terraform, developed by HashiCorp.

- [typescript-language-server (tsserver)](https://github.com/typescript-language-server/typescript-language-server)
  - `typescript-language-server` is an implementation of the Language Server Protocol (LSP) for TypeScript. It's built on top of the TypeScript compiler to provide rich language features, like auto-completions and diagnostics, to editors and Integrated Development Environments (IDEs) that support the LSP.

- [rust-analyzer (rust_analyzer)](https://github.com/rust-lang/rust-analyzer)
  - `rust-analyzer` is an implementation of a Language Server Protocol (LSP) for the Rust programming language. It is developed by the Rust community with the intention of making it the official Rust language server, eventually replacing the Rust Language Server (RLS).

- [lua-language-server](https://github.com/LuaLS/lua-language-server)
  - `lua-language-server` (lua_ls) is a language server for the Lua programming language. Using the LSP protocol it provides completion, goto definition, find references, rename refactoring, diagnostics, and more.

- [marksman](https://github.com/artempyanykh/marksman)
  - `marksman` is a program that integrates with your editor to assist you in writing and maintaining your Markdown documents. Using the LSP protocol it provides completion, goto definition, find references, rename refactoring, diagnostics, and more.

---
### Terminal UI (TUI) Extensions

- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)
  - `lazygit` is a **_NOT_** a Neovim plugin, but rather a simple terminal UI for Git commands, built with Go. It offers a more visual and interactive way to manage and visualize Git repositories directly from the terminal, without needing to remember or type out individual Git commands.
  - **Features:**
    - **_Interactive UI_**: lazygit provides a visual interface in the terminal, where you can see the status of your repository, such as changed files, branches, commits, and stashes.
    - **_Key Bindings_**: It offers various key bindings for common Git tasks. For example, you can stage files, commit changes, switch branches, and more, all with a few key presses.
    - **_Commit Visualization_**: lazygit allows you to view a detailed log of commits, where you can navigate through your commit history interactively.
    - **_File Diff_**: It shows a side-by-side diff of the changes in your files, making it easier to understand what has been modified.
    - **_Stashing_**: You can quickly stash your changes and apply or pop stashes directly from the interface.
    - **_Merge Conflict Resolution_**: lazygit provides tools for resolving merge conflicts, showing the conflicting changes and allowing you to choose which changes to accept.
    - **_Customization_**: lazygit offers a range of configuration options, including custom key bindings, themes, and other preferences.

- [derailed/k9s](https://github.com/derailed/k9s)
  - `k9s` is a popular open-source terminal-based console (TUI) for managing and interacting with Kubernetes clusters. It provides a powerful and convenient way to view, navigate, and manipulate Kubernetes resources and clusters directly from your terminal. K9s is designed to simplify Kubernetes administration tasks and provide real-time insights into your cluster.
  - **Features:**
    - **_Interactive User Interface_**: K9s offers an interactive, ncurses-based user interface that displays your cluster's resources in a tabular format, making it easy to browse and manage them.
    - **_Resource Navigation_**: You can navigate through various Kubernetes resources, including pods, services, deployments, configmaps, and more, using keyboard shortcuts.
    - **_Resource Details_**: K9s provides detailed information about selected resources, including logs, events, and YAML manifests.
    - **_Resource Operations_**: You can perform actions on resources, such as deleting, scaling, and editing, directly from the K9s interface.
    - **_Context and Namespace Switching_**: K9s allows you to switch between different Kubernetes contexts and namespaces, making it convenient for managing multiple clusters or namespaces.
    - **_Search and Filter_**: You can search for specific resources and filter them based on different criteria.
    - **_Customization_**: K9s is highly customizable and supports configuration files, allowing you to tailor it to your needs.

---
### Nvim Config Environment Variables
 - `NVIM_LOG_LVL`: by setting this environment variable to either ["TRACE" | "DEBUG" | "INFO" | "WARN" | "ERROR" | "OFF" ], the [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify) plugin will be configured to display notifications upto the desired log level. If the env var `NVIM_LOG_LVL` is not set, the log level is deafult to `INFO`.

 Neovim will open with debugging info, such as the compatible clipboard providers that have been detected, etc.
by setting this environment variable to `true`, Neovim will open with debugging info, such as the compatible clipboard providers that have been detected, etc.
</br>
 
 - `NVIM_SKIP_CLIP`: by setting this environment variable to `true`, you are choosing to skip the configuration of prefered clipboard providers (xclip, xsel, tmux, termux, etc...) and dismiss related errors.
</br>
 
 - `NVIM_CLIP`: Depending on your preference of clipboard provider for Neovim and your currently installed clipboard providers on your system, Neovim may implicitly select a provider and connect the respective registers. If you prefer not to leverage a clipboard like `xclip` or do not have a display (i.e. headless server), you can explictly select `tmux` as your prefered clipboard provider. 

   - To do so, set the `NVIM_CLIP` environment variable to `tmux`. This will configure `tmux` to be your preferred clipboard provider, connect the appropriate registers and set the `<leader> + y`, `<leader> + p` key bindings for copying and pasting, respectively.
 
   - <code style="color : green"><b>Note</b></code>**:** To see more information about clipboard configurations, please see the `Nvim Clipboard Provider Related` subsection of [Nvim Config Installation Prerequisites](#nvim-config-installation-prerequisites).
</br>
 
 - `NVIM_ENABLE_GPT`: by setting this environment variable to `true`, the `jackMort/ChatGPT.nvim` plugin will be able to be installed via `Lazy` upon Neovim restart. In addition, the respective key bindings outlined in the [Noteworthy Key Bindings](#noteworthy-key-bindings) section of this document will be bound.

    - <code style="color : green"><b>Note</b></code>**:** For more information regarding the `ChatGPT` plugin and its installation requirements, please see the respective subsection within [Nvim Config Installation Prerequisites](nvim-config-installation-prerequisites).
    </br>

- `NVIM_DISABLE_MATCHING_HL`: by setting this environment variable to `true`, you will be disabling all symbol match highlighting (e.g. matching open and closing brackets/braces). 
</br>

- `NVIM_ENABLE_BACKUP_COMMENT_COLOR`: This environment variable should **_ONLY_** be used when you are encountering issues with either treesitter or LSPs, where comments are no longer being rendered in green text.

  - To manually override the `gruvbox` colorscheme to render comments in green text, when either treesitter or LSPs are **_NON_**-FUNCTIONAL, set the environment variable to `true`.


---
### Nvim Config Installation Prerequisites

**Terminal Font Related**
  The configuration file `init.lua` explictly references a number of Patched fonts and plugins like `nvim-dap-ui`, `diffview` and `ChatGPT.nvim` leverage implictly do aswell. 
  
  If you do not either patch or get the required patched fonts, `Nerd Fonts` (e.g. Ubuntu Nerd Font) and `Codicons`, you will see _unknown symbols_ and/or warnings from the aforementioned plugins.

  To see how to patch fonts, refer to the [References Section](#references)  

**Lazy Git**
  See the `lazygit` extension subsection in [Terminal UI (TUI) Extensions](#terminal-ui-tui-extensions), to learn more about this git worklfow tool and how it works **_amazingly well_** with `toggleterm`.

  If you decide to join the dark side, all you need to do is simply install `lazygit` on your system ([follow their installation guide](https://github.com/jesseduffield/lazygit/tree/master#installation)) and the neovim config will automatically bootstrap `toggleterm` with `lazygit` for you. A dedicated floating terminal window will be available to toggle using the keybindings outlined in the [Noteworthy Key Bindings](#noteworthy-key-bindings) section of this document.

**k9s**
  See the `k9s` extension subsection in [Terminal UI (TUI) Extensions](#terminal-ui-tui-extensions), to learn more about this amazing TUI for interacting with k8s clusters. Its time to leave the plain jane `kubectl` cli in the dust!

  Simply install `k9s` on your system ([follow their installation guide](https://github.com/derailed/k9s#installation)) and the neovim config will automatically bootstrap `toggleterm` with `k9s` for you. A dedicated floating terminal window will be available to toggle using the keybindings outlined in the [Noteworthy Key Bindings](#noteworthy-key-bindings) section of this document.

**Nvim Clipboard Provider Related**

  Neovim has no direct connection to the system clipboard. Instead it depends on a _provider_ which transparently uses shell commands to communicate with the system clipboard or any other clipboard backend 

  - The clipboard experience varies depending on if you are using a headless version of a linux distribution or one that supports a GUI.
    - **`XServer/GUI`:**
      - if you are using a linux distro that has a GUI compoment, you can leverage a more robust and user friendly clipboard provider like `xclip` or `xsel`.
      - The presence of a working clipboard tool such as  `xclip` or `xsel` will implictly enable the `+` and `*` registers. Basically just install xclip and neovim will automatically boostrap the clipboard provider allowing for automatiic integration.
      
    - **`Headless Linux Server`:**
      -  ATM the current config really only supports `tmux` as a clipboard provider for headless linux distros. Clipboard providers such as `xclip` and `xsel` will not function as there is no 'display' to hook into (XServer is not present), thus are not viable options.
      - if you are feeling savy, feel free into into other supported clipboard providers, which can support SSH forwarding and other functionality for headless
      linux servers.

  - It should be noted that the default behavior for `neovim` when it is invoked within a tmux session is to use the `tmux` _clipboard proivder_, unless a more suitable _provider_ is already installed (e.g. `xclip`, `xsel`).
    - If you want to use `tmux` as the clipboard provider regardless if you already have another clipboard provider installed, you can set the `NVIM_CLIP` environment variable to `tmux` in your respective rc file.
      ```bash
      # entry in your repsective rc file (e.g. ~/.bashrc)
      export NVIM_CLIP="tmux"
      ```

  - If you want nothing to do with the clipboard setup, ignore related config errors and allow neovim to implicitly handle things (which also could mean doing nothing), simply set the `NVIM_SKIP_CLIP` env var to `true` in your respective rc file.
    ```bash
    # entry in your repsective rc file (e.g. ~/.bashrc)
    export NVIM_SKIP_CLIP=true
    ```

  - to see more details regarding how neovim clipboard providers integrate with neovim and their respective functions, issue the `:help g:clipboard` command 

**Python Related**
  - If you will be using the Python LSP, you may notice a number of warnings related to Python when you execute the `:checkhealth` command in neovim. These warnings should be recommend optional resolutions; however, if the issues no longer are optional or if you encounter issues with the Python env or LSP, Install the follow modules globally and address any other issues raised:
    - **`pythonX-pip`:**
      ```bash
      # install pip module for python3 at the system level
      sudo apt install python3_pip
      ```

**ChatGPT Nvim Plugin Related**
  - If you would like use the `jackMort/ChatGPT.nvim` plugin to integrate neovim with the OpenAI's ChatGPT, there are a couple of prerequisites
    - you will need a valid OpenAI API Key
    - you will have to securely store said key - this will dictate how you configure the `chatgpt` setup config
      - if you would like to leverage an enviornment variable (env var), create an env var named `OPENAI_API_KEY` in your respective shell's _rc_ (i.e. Run Commands) file.
        - e.g.) `export OPENAI_API_KEY={SECRET_KEY}`
      - **_OTHERWISE_**, you can leverage password manager or keystore to store the API key and have the `chatgpt` plugin retrieve it a system command.
        - if you decide to go down this route, you will need to update the `chatgpt` setup config to invoke a command under the `api_key_cmd` config field. Examples below: <br /><br />

          The following configuration would use 1Passwords CLI, `op`, to fetch the API key from the `credential` field of the `OpenAI` entry.

          ```lua
          require("chatgpt").setup({
            -- example using the 1Password Secret Store CLI
            api_key_cmd = "op read op://private/OpenAI/credential --no-newline"
          })
          ```
          The following configuration would use `GPG` to decrypt a local file containing the
          API key.

          ```lua
          local home = vim.fn.expand("$HOME")
          require("chatgpt").setup({
              -- example using GPG
              api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg"
          })
          ```

---
### Nvim Config Validation

After addressing [Nvim Config Installation Prerequisites](#nvim-config-installation-prerequisites), you should check the overall status of your neovim setup by excuting the `:checkhealth` command
The `:checkhealth` command runs a series of diagnostic tests to check the health of your Neovim installation. If it uncovers any problems, it usually offers suggestions on how to fix them, or where to go to learn more.
If you find and relvant `Warnings` which may impact your nvim setup or experience, OR any `Errors`, follow the guidance provide and address their resolution accordingly.


---
### Noteworthy Key Bindings

>[!NOTE]
> by default the leader key binding is set to the `<space>` key, feel free to change it ;)

# Which Key

which-key is used to ... 

**Leader Bound Key Bindings**
All keybindings tied to the leader key, are grouped into categories to help provide an intuitive navigation experience. I encourage you to explore the key bindings using `which-key` to get a better understanding of the custom key bindings that have been made available to you.
![leader-keybindings](/assets/which-key_leader-keybinding.png)


**Window Manipulation & Navigation**
Key bindings related to windows within nvim can still be observed using `which-key`, simply enter <C-w> (i.e. <ctrl> + b) and `which-key` will display all window related keybindings that are currently registered.
![window-keybindings](/assets/which-key_window-bindings.png)


**Auto-Completion**
To allow for a seamless experience with auto-completion, related keys were not registered with `which-key`.

LIST HERE!

---
### References

- [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol)

- [Neovim LSP client configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- [Nerd Fonts](https://www.nerdfonts.com/)
  - plugins such as `diffview`, `ChatGPT.nvim` are configured to use [Patched Fonts](https://github.com/ryanoasis/nerd-fonts#patched-fonts) for rendering icons within the terminal and ultimately Neovim.
  - [Github](https://github.com/ryanoasis/nerd-fonts)

- [Codicons](https://github.com/microsoft/vscode-codicons)
  - plugin(s) such as `nvim-dap-ui` are configured to use the `codicons` Font, as part of the UI's debugger pane.
  - the `codicons` font will required to be patched by tools like nerd-fonts' font-patcher; possibly in conjunction with fontforge. See the `How to Patch Fonts` subsection within `References` for details on how to deal with Font Patching.

- **_How to Patch Fonts_**:
    - Manually Patching a Font
      - [Font Patching Procedure](https://github.com/ryanoasis/nerd-fonts#option-9-patch-your-own-font)
      - Once a font is patched, move the respective `.ttf` file to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`
    - Using already Patched Fonts
      - Dowload a patched font from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
      - Move the respective `.ttf` file(s) to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`)
