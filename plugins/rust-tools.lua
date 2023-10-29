return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = "neovim/nvim-lspconfig",
  config = function()
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities

    require("rust-tools").setup {
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
}
