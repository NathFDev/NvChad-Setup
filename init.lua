local opt = vim.opt
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "syntax")

-- Toggle number
opt.relativenumber = true
opt.number = true

-- Tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
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
