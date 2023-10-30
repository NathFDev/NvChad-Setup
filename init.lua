local opt = vim.opt
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "syntax")

-- Toggle number
opt.relativenumber = true
opt.number = true

-- Tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- Indent
opt.smartindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true

-- Timeoutlen
opt.timeoutlen = 100

-- Scroll
opt.scrolloff = 8

-- Update time
opt.updatetime = 50
