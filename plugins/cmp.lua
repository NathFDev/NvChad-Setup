return {
  "hrsh7th/nvim-cmp",
  opts = {
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- snippets
      { name = "buffer" }, -- text within current buffer
      { name = "crates" },
      { name = "path" }, -- file system paths
    },
  },
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
  },
}
