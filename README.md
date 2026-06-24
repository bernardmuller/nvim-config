# neovim

On `24 June 2026` I decided to update my nvim configs to fit my new needs.

Kickstart (`vim.pack` version) + my stuff in `lua/custom/plugins/`.

## Updating to Kickstart latest
1. Copy the `init.lua` file from the Kickstart Repo — make sure all files match the `kickstart.plugins.*`
2. Make the two `init.lua` edits below.

## init.lua edit 1 — disable mason (Section 6, ~ln 743)
Comment the mason plugins + the whole `mason`/`mason-tool-installer` setup block.
**Keep** `nvim-lspconfig` and the `for name, server in pairs(servers)` loop (that's
what enables the LSPs).

```lua
vim.pack.add {
  gh 'neovim/nvim-lspconfig',
  -- gh 'mason-org/mason.nvim',
  -- gh 'mason-org/mason-lspconfig.nvim',
  -- gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
}
-- require('mason').setup {}
-- local ensure_installed = vim.tbl_keys(servers or {})
-- vim.list_extend(ensure_installed, {})
-- require('mason-tool-installer').setup { ensure_installed = ensure_installed }
for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
```

Mason stays disabled in `init.lua` on **both** machines. Binaries come from:
- **macOS** → `lua/custom/plugins/mason.lua` (gated on `has('mac')`, installs them)
- **NixOS** → system PATH (nix), so you need to make sure they are being installed on the machine

## init.lua edit 2 — Section 10
Enable the kickstart plugins I use + load custom:
```lua
require 'kickstart.plugins.lint'
require 'kickstart.plugins.autopairs'
require 'kickstart.plugins.gitsigns'
require 'custom.plugins'
```

## Binaries to install
**NixOS** (system packages):
```
lua-language-server 
pyright 
rust-analyzer 
typescript-language-server 
zls
clang-tools 
vscode-langservers-extracted 
tailwindcss-language-server 
stylua
prettierd 
zig
```
(+ any linters `lint` pulls in)

**macOS**: mason installs the above automatically. Exceptions to do by hand:
`brew install zig` (zig isn't a mason package).  -- if you still need zig ofc

## custom dir notes
- `custom/plugins/init.lua` auto-loads every `.lua` in the folder → add a plugin =
  add a file, nothing else to wire.
- No load-order guarantee from the loader. `lsp.lua` `require`s `mason.lua` directly
  to force order. Don't rely on filenames for ordering.
- It loads **everything** in the folder — no scratch/`test.lua` files left lying around.
- in `custom/plugins/lsp.lua` we require `mason` at the top of the file to ensure it's loaded before the lsps.

## First launch (Mac)
Mason installs async — LSPs won't attach until installs finish. Let `:Mason` churn,
then reopen the file / restart.
