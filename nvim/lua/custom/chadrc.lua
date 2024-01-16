---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"


M.ui = {
  theme = "chocolate",
  theme_toggle = { "chocolate", "one_light" },
  transparency = true,

  hl_override = highlights.override,
  hl_add = highlights.add,
}

vim.cmd([[
  augroup ts_cpp_indent
  autocmd!
  " autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  augroup END
  au BufNewFile,BufRead *.dart set filetype=dart
  set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
]])

vim.api.nvim_exec([[
  autocmd FileType dart setlocal shiftwidth=2 tabstop=2 expandtab
  autocmd FileType asm setlocal shiftwidth=4 tabstop=4 expandtab
]], false)

M.plugins = "custom.plugins"


-- check core.mappings for table structure
M.mappings = require "custom.mappings"

vim.opt.relativenumber = true

return M
