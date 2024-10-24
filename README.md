<img src="/assets/neoteusz.png" alt="neoteusz">

## Neoteusz - Get S#@% done with Neovim!

Neoteusz is a streamlined yet powerful Neovim configuration designed for developers who value speed and efficiency, this configuration offers a blazingly-fast, responsive developer experience. Instantly navigate large codebases, run complex commands, and interact seamlessly with Neovim; all while maintaining a low resource footprint.

Whether you're working on large projects or quick scripts, this setup helps your workflow remain smooth and distraction free, empowering you to focus on building the things that you enjoy.

Thank you for stopping by and have fun!


## 📋 Note

Version `1.x.x` of Neoteusz leveraged [packer.nvim](https://github.com/wbthomason/packer.nvim) as the package manager; however, packer is no longer actively maintained. `v2.x.x` and beyond will leverage [lazy.nvim](https://github.com/folke/lazy.nvim/tree/stable) as the defacto package manager (unless stated otherwise).

In addition, it should be noted that this configuration and the instructions outlined, were implemented on a `Ubuntu 24.04 LTS (Noble Numbat)` system using a `v0.9.4` neovim app image; instructions may need to be tailored for other linux distributions or neovim versions.


## 🛠️ Requirements

### Required

- Neovim >= 0.9.4
- Git >= 2.19.0 (for partial clones support)
- A patched Nerd Font - To see how to patch fonts, refer to the [References Section](#references)

### Optional ###

- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)

- [derailed/k9s](https://github.com/derailed/k9s)

- **ChatGPT Nvim Plugin Related**
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


## 🚀 Installation

Include install steps


## 🔌 Plugin Inventory

For a comprehensive overiew of all included plugins, please see our [plugins documentation](docs/plugins.md)


## 🔎 Key Bindings - Which Key
>[!NOTE]
> by default the leader key binding is set to the `<space>` key, feel free to change it ;)

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


## 🚀 Language Severs, LSPs, Linters & Formatters

For an overiew of how language severs, LSPs, linters and formatters are integrated with Neoteusz, please see our [lsp documentation](docs/lsp.md)


## 💻 Terminal UI (TUI) Integration - Extensions

Neoteusz comes baked with `toggleterm` ready implmentations for a couple of TUI apps. The respective TUI key bindings will only function if the underlying apps are installed. Once installed, simply use [which-key](#-key-bindings---which-key) to discover the appropriate key bindings and have fun with TUIs.

>[!TIP]
> The pattern used for the integration of TUIs with Neovim can be followed to add additional TUIs as desired. You may need to tweak things a little bit depending on how the TUI behaves; however, it shouldn't be too tricky.

- [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)
  - `lazygit` is a **_NOT_** a Neovim plugin, but rather a simple terminal UI for Git commands, built with Go. It offers a more visual and interactive way to manage and visualize Git repositories directly from the terminal, without needing to remember or type out individual Git commands.

- [derailed/k9s](https://github.com/derailed/k9s)
  - `k9s` is a popular open-source terminal-based console (TUI) for managing and interacting with Kubernetes clusters. It provides a powerful and convenient way to view, navigate, and manipulate Kubernetes resources and clusters directly from your terminal. K9s is designed to simplify Kubernetes administration tasks and provide real-time insights into your cluster.


## 📦 Nvim Config Environment Variables

 
 WHY do we have them???


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

## 📋 Nvim Config Validation

After addressing [Nvim Config Installation Prerequisites](#nvim-config-installation-prerequisites), you should check the overall status of your neovim setup by excuting the `:checkhealth` command

The `:checkhealth` command runs a series of diagnostic tests to check the health of your Neovim installation. If it uncovers any problems, it usually offers suggestions on how to fix them, or where to go to learn more.
If you find and relvant *Warnings* which may impact your nvim setup or experience, OR any *Errors*, follow the guidance provide and address their resolution accordingly.



## 📚 References

- [Nerd Fonts](https://www.nerdfonts.com/)
  - a number of Neoteusz's plugins are configured to use [Patched Fonts](https://github.com/ryanoasis/nerd-fonts#patched-fonts) for rendering icons within the terminal and ultimately Neovim.
  - [Github](https://github.com/ryanoasis/nerd-fonts)

- **_How to Patch Fonts_**:
    - Manually Patching a Font
      - [Font Patching Procedure](https://github.com/ryanoasis/nerd-fonts#option-9-patch-your-own-font)
      - Once a font is patched, move the respective `.ttf` file to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`
    - Using already Patched Fonts
      - Dowload a patched font from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
      - Move the respective `.ttf` file(s) to the running user's font dir (e.g. `~/.local/share/fonts/FontName.ttf`) or in a well named subdirectory (e.g. `~/.local/share/fonts/Ubuntu/FontName.ttf`)

