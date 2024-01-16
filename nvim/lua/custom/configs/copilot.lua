local copilot = require("copilot")

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },

  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<C-a>",
      next = "<A-]>",
      prev = "<A-[>",
      dismiss = "<A-'>",
    },
  },

  filetypes = {
    cpp = true,
    python = true,
    lua = true,
    ["*"] = false,
  },

  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
