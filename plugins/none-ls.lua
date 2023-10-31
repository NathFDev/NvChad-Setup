return {
  "nvimtools/none-ls.nvim",
  ft = {
    "go",
    "lua",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "vue",
    "astro",
    "svelte",
    "javascriptreact",
    "typescriptreact",
  },
  config = function()
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
      return
    end
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local null_ls_utils = require "null-ls.utils"

    null_ls.setup {
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.prettierd.with {
          extra_filetypes = { "svelte", "javascriptreact", "typescriptreact", "vue", "astro" },
        },
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.eslint_d.with { -- js/ts linter
          condition = function(utils)
            return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs" }
          end,
        },
        null_ls.builtins.diagnostics.ruff,
      },
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd({ "BufWritePre", "BufNewFile" }, {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}
