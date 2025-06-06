return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,

    config = function()
      local dap = require "dap"
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          setupCommands = {
            {
              description = "Enable pretty-printing",
              text = "-enable-pretty-printing",
              ignoreFailures = false,
            },
          },
        },
      }
    end,
  },
}
