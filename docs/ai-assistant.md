# 🤖 AI Assistant

If you would like use the `jackMort/ChatGPT.nvim` plugin to integrate Neovim with the OpenAI's ChatGPT, there are a couple of prerequisites:
    1) You will need a valid OpenAI API Key
    2) You will have to securely store the API key
    3) Enable the plugin, please see [Neoteusz config documentation](/docs/neoteusz-config.md)

>[!NOTE]
> How you choose to store and access the OpenAI API key will dictate if you will have to update the `chatgpt` setup config.

If you would like to leverage an enviornment variable, create one named `OPENAI_API_KEY` in your respective shell's `.rc` (i.e. Run Commands) file.
```shell 
# env var entry in ~/.bashrc file
export OPENAI_API_KEY={SECRET_KEY}
```

**_OTHERWISE_**, you can leverage a more secure method via the use of a password manager or keystore. The `chatgpt` plugin is able to retrieve secrets from secret stores via the use of shell commands.
- If you decide to go down this route, you will need to update the `chatgpt` setup config to invoke a command under the `api_key_cmd` config field.

  The following configuration uses the `1Passwordi's` CLI, `op`, to fetch the API key from the `credential` field of the `OpenAI` entry.

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

