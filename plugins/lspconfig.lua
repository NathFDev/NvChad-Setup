return {
  "neovim/nvim-lspconfig",
  config = function()
    require "plugins.configs.lspconfig"
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities
    local lspconfig = require "lspconfig"
    local util = require "lspconfig/util"

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      }
      vim.lsp.buf.execute_command(params)
    end

    lspconfig["gopls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }

    lspconfig["tsserver"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      },
    }

    lspconfig["pyright"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "python" },
    }

    lspconfig["cssls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["tailwindcss"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = util.root_pattern(
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "postcss.config.ts"
      ),
    }

    lspconfig["custom_elements_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["volar"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["jsonls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["astro"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["sqlls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["dockerls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["html"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html" },
    }

    lspconfig["svelte"].setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    }

    lspconfig["emmet_language_server"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
        "vue",
        "astro",
      },
    }

    lspconfig["graphql"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    }

    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }
  end,
}
