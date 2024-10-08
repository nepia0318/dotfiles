local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')
require('jetpack.paq') {
    {'tani/vim-jetpack'}, -- bootstrap
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
    {'EdenEast/nightfox.nvim'},
    {'previm/previm'},
}

