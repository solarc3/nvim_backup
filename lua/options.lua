local api = vim.api
vim.cmd([[let g:transparent_enabled = v:false]]) --transparent toggle
vim.o.encoding = 'utf-8'
vim.o.syntax = 'on'
vim.o.number = true
vim.g.mapleader = ','
vim.g.coq_settings = { 
  auto_start = 'shut-up',
  keymap = { recommended = false} } 
vim.cmd([[colorscheme oxocarbon]])
-- Highlight on yank
local TermGrp = api.nvim_create_augroup("TermOpen", { clear = true })
api.nvim_create_autocmd("TermOpen", {
  command = "silent! setlocal nonu",
  group = TermGrp,
})
-- Options
vim.o.history=150
vim.o.termguicolors=true
vim.o.scrolloff=10
vim.o.backspace='indent,eol,start'
vim.o.cmdheight=1
vim.o.hidden = true
--autopairs defaults coq
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })


-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
-- Options
vim.o.syntax='on'
vim.o.mouse='a'

  -- Sets numberline
vim.o.number=true

  -- Tab related settings
vim.o.autoindent=true
vim.o.expandtab=true
vim.o.tabstop=4
vim.o.smarttab=true
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.shiftround=true

  -- Shows last used command in status line
vim.o.showcmd=true

  -- Use highlighting when doing a search
vim.o.showmatch=true
  -- Highlight while searching
vim.o.hlsearch=true
  -- Ignores capitalisation while searching
vim.o.ignorecase=true
  -- Incremental search that shows partial matches
vim.o.incsearch=true
  -- Automatically switch search to case-sensitive when search query contains an uppercase letter
vim.o.smartcase=true

  -- Always try to show a paragraph’s last line.
vim.opt.display = vim.opt.display + 'lastline'

-- vimtex stuff
vim.cmd([[
    filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexrun'
nmap <leader>w :w!<CR>
imap <leader>w <esc>:w<CR>
nmap <leader>l :VimtexCompile<CR>
nmap <leader>t :CHADopen<cr>
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:vert ter python3 "%"<CR>
]])

-- keybind

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end