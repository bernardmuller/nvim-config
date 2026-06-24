-- NixOS: the formatter binaries must be on $PATH (stylua, clang-format,
-- prettierd/prettier, zig). Install via nix.

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { cpp = true }
    return {
      timeout_ms = 500,
      lsp_format = disable_filetypes[vim.bo[bufnr].filetype] and 'never' or 'fallback',
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    c = { 'clang-format' },
    zig = { 'zigfmt' }, -- conform builtin (runs `zig fmt`); was your bare 'zig fmt'
    -- Current syntax for "first available wins" (replaces the old nested table):
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
  },
}
