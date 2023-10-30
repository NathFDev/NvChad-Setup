return {
  "zbirenbaum/copilot.lua",
  event = "BufEnter",
  cmd = "Copilot",
  config = function()
    require("copilot").setup()
  end,
}
