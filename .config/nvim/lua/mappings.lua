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

map("n", "<leader>b[", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "move buffer to left" })

map("n", "<leader>b]", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "move buffer to right" })

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

-- buffer
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", { silent = true })
map("n", "<leader>|", "<cmd>vs<cr>", { silent = true })
map("n", "<leader>-", "<cmd>split<cr>", { silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- copilot
map("i", "<C-e>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- aider
map("n", "<leader>Ao", ":AiderOpen --no-auto-commits<CR>")

-- terminal
map("t", "jk", [[<C-\><C-n>]])

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Use buffer-local terminal mode mappings
    local function tmap(lhs, rhs)
      vim.api.nvim_buf_set_keymap(0, "t", lhs, rhs, { noremap = true, silent = true })
    end

    tmap("<C-h>", [[<C-\><C-n><cmd>TmuxNavigateLeft<CR>]])
    tmap("<C-j>", [[<C-\><C-n><cmd>TmuxNavigateDown<CR>]])
    tmap("<C-k>", [[<C-\><C-n><cmd>TmuxNavigateUp<CR>]])
    tmap("<C-l>", [[<C-\><C-n><cmd>TmuxNavigateRight<CR>]])
  end,
})
