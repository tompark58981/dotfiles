return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup({
        compile_command = {
          cpp = { exec = "g++", args = { "-std=c++20", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        testcases_directory = "./testcase",
        testcases_input_file_format = "input$(TCNUM).txt",
        testcases_output_file_format = "output$(TCNUM).txt",
      })
    end,
  },
}
