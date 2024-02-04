local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- -- TODO: Setup Excluded Flolders
-- local dartExcludedFolders = {
--   vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
--   vim.fn.expand("$HOME/.pub-cache"),
--   vim.fn.expand("/opt/homebrew/"),
--   vim.fn.expand("$HOME/tools/flutter/"),
-- }

return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", false },
        },
      },
    },
  },

  -- require("lspconfig").dartls.setup({
  --   capabilities = capabilities,
  --   cmd = {
  --     "dart",
  --     "language-server",
  --     "--protocol=lsp",
  --     -- "--port=8123",
  --     -- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
  --   },
  --
  --   filetypes = { "dart" },
  --
  --   init_options = {
  --     onlyAnalyzeProjectsWithOpenFiles = false,
  --     suggestFromUnimportedLibraries = true,
  --     closingLabels = true,
  --     outline = false,
  --     flutterOutline = false,
  --   },
  --
  --   settings = {
  --     dart = {
  --       analysisExcludedFolders = dartExcludedFolders,
  --       updateImportsOnRename = true,
  --       completeFunctionCalls = true,
  --       showTodos = true,
  --     },
  --   },
  -- }),
}
