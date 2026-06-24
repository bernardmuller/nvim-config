-- mason must set up (and prepend its bin dir to PATH) before we enable servers.
require 'custom.plugins.mason'

-- IMPORTANT (NixOS): with mason disabled, every server binary must be on $PATH.
-- Install them via nix (see the note at the bottom for the package list).

local servers = {
  pyright = {},
  rust_analyzer = {},
  ts_ls = {
    settings = {
      preferences = { disableSuggestions = true },
    },
  },
  zls = {},
  clangd = {},
  html = {},
  cssls = {},
  tailwindcss = {},
  eslint = {},
}

for name, cfg in pairs(servers) do
  vim.lsp.config(name, cfg)
  vim.lsp.enable(name)
end

-- Your lua_ls tweak. vim.lsp.config() MERGES into the existing named config,
-- so this layers callSnippet onto kickstart's lua_ls (its on_init / format
-- disable stay intact). lua_ls is already enabled by stock, so no re-enable.
vim.lsp.config('lua_ls', {
  settings = { Lua = { completion = { callSnippet = 'Replace' } } },
})

-- NOTE: stock init also lists `stylua` in its servers table (for mason to
-- install). With mason gone it just no-ops as a non-existent LSP — harmless.
-- stylua is used as a *formatter* via conform instead (see conform.lua).

--[[ nix packages providing the above binaries:
  lua-language-server, pyright, rust-analyzer,
  typescript-language-server (ts_ls), zls, clang-tools (clangd),
  vscode-langservers-extracted (html, cssls, eslint),
  tailwindcss-language-server
]]
