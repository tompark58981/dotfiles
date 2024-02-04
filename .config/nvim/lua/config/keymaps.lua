-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local unmap = vim.keymap.del
local map = vim.keymap.set

-- Default Keymaps
---- Insert Mode
map("i", "jk", "<esc>", { desc = "Exit Insert Mode" })

---- Normal Mode
map("n", ";", ":", { desc = "Enter Command Mode" })
map("n", "<c-n>", "<cmd>Neotree toggle<cr>", { desc = "Enter Command Mode" })
map("n", "<C-_>", function()
  require("lazyvim.util").terminal(nil, { border = "rounded", size = { width = 0.7, height = 0.7 } })
end, { desc = "Term with border" })

--For C++
map(
  "n",
  "<leader>cR",
  "<cmd>vsplit term://zsh -c 'g++ -std=c++20 % -o %< && ./%<' 2>&1 | read -p 'Press any key to exit...'<cr>",
  { desc = "Compile and Run .cpp" }
)

-- Vim-Tmux-Navigator
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
