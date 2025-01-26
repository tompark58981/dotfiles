return {
  "neovim/nvim-lspconfig",
  ft = { "cpp", "rust", "python", "lua", "typescript", "javascript", "java" },

  config = function()
    -- load defaults i.e lua_lsp
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"

    -- EXAMPLE
    local servers = { "html", "clangd", "cssls", "eslint", "lua_ls", "ts_ls", "pylsp", "jdtls" }
    local nvlsp = require "nvchad.configs.lspconfig"

    -- lsps with default config
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end

    -- Add border to the diagnostic popup window
    vim.diagnostic.config {
      virtual_text = {
        prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
      },
      float = { border = "rounded" },
    }

    -- configuring single server, example: typescript
    -- lspconfig.tsserver.setup {
    --   on_attach = nvlsp.on_attach,
    --   on_init = nvlsp.on_init,
    --   capabilities = nvlsp.capabilities,
    -- }
    local win = require "lspconfig.ui.windows"
    win.default_options = { border = "rounded" }
    vim.diagnostic.config { float = { border = "rounded" } }
  end,
}
