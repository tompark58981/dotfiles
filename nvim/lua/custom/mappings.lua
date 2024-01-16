---@type MappingsTable
local M = {}

M.general = {
  i = {
    jk = { "<Esc>", "Exit insert mode" },
  },

  n = {
    ["<leader>="] = {":vert res +10<CR>", "Increase Window Size"},
    ["<leader>-"] = {":vert res -10<CR>", "Decrease Window Size"},
    ["<leader>la"] = {":lua vim.lsp.buf.code_action()<CR>", "Toggle Code Actions"},
    ["<leader>vs"] = {":vs<CR>", "vertical split"},
    ["<leader>hs"] = {":sp<CR>", "horizontal split"},
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    -- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    -- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

    ["<leader>cg"] = { ":CMakeGenerate<CR>", "CMake generate"},
    ["<leader>cb"] = { ":CMakeBuild<CR>", "CMake build"},
    ["<leader>cc"] = { ":CMakeClose<CR>", "CMake build"  },

    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", "Move left the pane in tmux", opts = { silent = true } },
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", "Move down the pane in tmux", opts = { silent = true } },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", "Move up the pane in tmux", opts = { silent = true } },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", "Move right the pane in tmux", opts = { silent = true } },

    -- ["<leader>fc"] = { [[:vsplit term://zsh -c 'g++ -std=c++20 % -o %< && ./%<'<CR>]], "Compile and run C++ code with C++20" },
    -- ["<leader>fc"] = { [[:vsplit term://zsh -c 'g++ -std=c++11 % -o %< && ./%<' 2>&1 | read -p "Press any key to exit..."'<CR>]], "Compile and run C++ code with C++11" },
    ["<leader>fc"] = { [[:vsplit term://zsh -c 'g++ -std=c++20 % -o %< && ./%<' 2>&1 | read -p "Press any key to exit..."'<CR>]], "Compile and run C++ code with C++20" },
    ["<leader>fb"] = {
      [[:vsplit term://zsh -c 'find . -name *.cpp \| xargs g++ -std=c++20 -o output && ./output' 2>&1 | read -p "Press any key to exit..."'<CR>]],
      "Compile and run C++ code with C++20"
    },
    ["<leader>fa"] = { [[:silent! for file in split(glob('./*.cpp'), '\n') | execute 'vsplit term://zsh -c "g++ -std=c++11 '.fnameescape(file).' -o '.fnameescape(substitute(file, '\.cpp$', '', '')).' && '.substitute(file, '\.cpp$', '', '').'" 2>&1 | read -p \"Press any key to exit...\"'<CR>]], "Compile and run C++ code with C++11" },
    ["<leader>fp"] = { [[:vsplit term://zsh -c 'python3 %'<CR> | read -p "Press any key to exit..."]], "Run python file"},
    ["<leader>ss"] = { [[:luafile ~/.config/nvim/init.lua<CR>]], "Source init.lua" },
    ["<leader>ca"] = {":vertical terminal conda activate<CR>", "Activate Conda Environment"},
    ["<leader>cd"] = {":vertical terminal conda deactivate<CR>", "Deactivate Conda Environment"},
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },
  },
}


-- more keybinds!

return M
