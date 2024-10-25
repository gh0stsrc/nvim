# 🧰 Neoteusz Config

## Overview

Provide and overview here!

## Logging

Neoteusz was configured to use the [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify) plugin as the defacto notification method for Neovim. You are able to configure what level of logging information you would like to recieve notifications for (i.e. `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `OFF`) by updating the value under the `logging.level` field within your `config.lua` file.


## Clipboard

Neoteusz attempts to help with the native Neovim clipboard experience by attaching a desired `clipboard provider` or setting a default provider if one is not given. To set your desired clipboard provider, update the value under the `clipboard.provider` field within your `config.lua` file.

If a clipbpard provider is not set, the default provider will be set to `tmux`, if installed on the system; otherwise none will be set. The assumption taken here is that in majority of cases users would most likely be running a headless server (i.e. does not have a display); however, if you are running a linux distro which can present a display, you can leverage a provider like `xclip` to natively bridge the clipboard between terminal emulation and other components (e.g. browser).

>[!NOTE]
> When the `clipboard provider` is default to `tmux`, the appropriate registers will be connected and the `<leader> + y`, `<leader> + p` key bindings will be set for copying and pasting, respectively.

Additionally, if you rather skip the clipboard bootstrapping entirely, you can set the value under the `clipboard.skip` field within your `config.lua` to `true`.


## AI Assistant

If you would like to leverage an AI assistant, particularly [ChatGPT](https://openai.com/chatgpt/overview/), Neoteusz can bootstrap the `jackMort/ChatGPT.nvim` plugin for you. All you have to do is set the value under the `ai.enabled` field within your `config.lua` file to `true` and integrate your OpenAI API key, as outlined in neoteusz [AI assistant documentation](/docs/ai-assistant.md).

