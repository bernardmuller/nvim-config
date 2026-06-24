-- Cross-machine binary management.
--   macOS : use mason to install the LSP servers + formatters below.
--   NixOS : this file early-returns (binaries come from nix), and init.lua keeps
--           mason commented out. So init.lua is identical on both machines and
--           this one file decides whether mason runs.
--
-- This loads from the custom dir (after init.lua), so the install list lives
-- next to your server list (lsp-servers.lua) instead of in init's stock table.

if vim.fn.has 'mac' ~= 1 then
  return -- not macOS → do nothing; rely on $PATH (nix)
end

vim.pack.add {
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

-- mason prepends its bin dir to PATH for the nvim session, so vim.lsp.enable()
-- (in lsp-servers.lua) finds these without any extra wiring.
require('mason').setup {}

require('mason-tool-installer').setup {
  -- These are mason REGISTRY package names, not lspconfig names. Using registry
  -- names means we don't need mason-lspconfig for translation. If one fails to
  -- install, run :Mason and search to confirm the exact current package name.
  ensure_installed = {
    -- LSP servers (mirror lsp-servers.lua)
    'lua-language-server', -- lua_ls
    'pyright',
    'rust-analyzer', -- rust_analyzer
    'typescript-language-server', -- ts_ls
    'zls',
    'clangd',
    'html-lsp', -- html
    'css-lsp', -- cssls
    'tailwindcss-language-server', -- tailwindcss
    'eslint-lsp', -- eslint

    -- Formatters (mirror conform.lua)
    'stylua',
    'prettierd',
    'prettier',
    'clang-format',
    -- NOTE: zig (for zigfmt / `zig fmt`) is NOT a mason package. Install the zig
    -- toolchain separately on macOS: `brew install zig`.
  },
}
