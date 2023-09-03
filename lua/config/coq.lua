local coq = require "coq"
local lsp = require "lspconfig"
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by coq_nvim
local servers = { 'clangd', 'tsserver','texlab', 'sumneko_lua', 'pyright', 'jedi_language_server'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end

