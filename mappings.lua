local M = {}

M.general = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "Scroll down half a page and center the cursor" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up half a page and center the cursor" },
    ["n"] = { "nzzzv", "Move to the next search result and center the cursor" },
    ["N"] = { "Nzzzv", "Move to the previous search result and center the cursor" },
    ["<leader>y"] = { '"+y', "Yank to system clipboard" },
    ["<leader>s"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Search and replace word under cursor",
    },
    ["<leader><leader>"] = { ":so<CR>", "Source current file" },
  },
  v = {
    ["<leader>y"] = { '"+y', "Yank selection to system clipboard" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected lines down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected lines up" },
  },
}

M.typescript = {
  n = {
    ["<leader>td"] = {
      "<cmd> TSLspOrganize <CR>",
      "Organize imports",
    },
    ["<leader>ti"] = {
      "<cmd> TSLspImportAll <CR>",
      "Import all",
    },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "Run python test method",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

return M
