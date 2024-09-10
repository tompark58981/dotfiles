require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>b")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- vim tmux navigator
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })

-- tabufline
map("n", "<s-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<s-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "close buffer" })

map("n", "<leader>bl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "close buffers on left" })

map("n", "<leader>br", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "close buffers on right" })

map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { silent = true })

-- nvchad.term
map({ "n", "t" }, "<c-_>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = {
      relative = "editor",
      row = 0.075,
      col = 0.14,
      width = 0.7,
      height = 0.8,
    },
  }
end, { desc = "terminal toggle floating term" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
