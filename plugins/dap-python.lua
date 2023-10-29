return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function(_, opts)
    require("dap-python").setup(opts)
    require("core.utils").load_mappings "dap_python"
  end,
}
