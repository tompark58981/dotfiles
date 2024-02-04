local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = { border = "rounded" },
      documentation = { bordef = "rounded" },
    },
  },

  keys = {
    -- { "<C-j>", "<C-f>" },
    -- { "<C-k>", "<C-b>" },
  },
}
