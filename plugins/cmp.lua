return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local M = require "plugins.configs.cmp"
    table.insert(M.sources, { name = "crates" })
    table.insert(M.sources, { name = "copilot" })
    return M
  end,
  dependencies = {
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
  },
}
