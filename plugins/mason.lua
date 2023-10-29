return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_null_ls = require "mason-null-ls"
    mason.setup() -- no options yet

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "jsonls",
        "emmet_language_server",
        "volar",
        "astro",
        "custom_elements_ls",
        "dockerls",
        "pyright",
        "gopls",
        "rust_analyzer",
        "sqlls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    }

    mason_null_ls.setup {
      ensure_installed = {
        "prettierd", -- prettier formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "gofumpt", -- go formatter
        "golines", -- go formatter
        "goimports-reviser", -- go formatter
        "gospel", -- go linter
        "eslint_d", -- js linter
        "luacheck", -- lua linter
        "mypy", -- python linter
        "ruffle", -- python formatter
        "eslint_d", -- js linter
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    }
  end,
}
