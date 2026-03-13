
-- MATCH TERMINAL BACKGROUND --
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
]]

-- CURSOR --
vim.opt.guicursor =
  "n:block-blinkon500-blinkoff500," ..
  "i:ver25-blinkon500-blinkoff500," ..
  "v:block-blinkon500-blinkoff500," ..
  "c:hor20-blinkon500-blinkoff500," ..
  "r:hor20-blinkon500-blinkoff500"
