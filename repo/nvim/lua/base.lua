vim.opt.number = true -- 行番号を表示
vim.opt.termguicolors = true -- True Colorでのシンタックスハイライト
vim.opt.cursorline = true -- カーソルが存在する行にハイライト
vim.opt.ambiwidth = 'single' -- 全角記号が重なる問題対策
vim.opt.clipboard:append{'unnamedplus'}

-- インデントの設定
vim.opt.autoindent = true
vim.opt.smartindent = true

-- タブのサイズ
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- ファイルエンコード
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8', cp932

-- プラグイン用
vim.api.nvim_set_var('previm_open_cmd', 'wsl-open')
-- vim.api.nvim_set_var('previm_open_cmd', '/mnt/c/Program Files/Google/Chrome/Application/chrome.exe') -- パスは合ってるはず
-- vim.api.nvim_set_var('previm_wsl_mode', 1) -- うまくいってない？

-- ウィンドウの見た目
-- vim.opt.winblend = 0
-- vim.opt.pumblend = 0
-- vim.api.nvim_set_hl(0, "Normal", { ctermbg = none })
-- vim.cmd[[colorscheme vim]]
vim.cmd[[ colorscheme carbonfox ]]
vim.api.nvim_set_hl(0, "Normal", { ctermbg = none})   

