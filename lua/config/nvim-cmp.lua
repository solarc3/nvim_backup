local present, cmp = pcall(require, "cmp")
if not present then
    return
end

cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
           require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
           behavior = cmp.ConfirmBehavior.Replace,
           select = true,
        },
        ["<Tab>"] = function(fallback)
           if cmp.visible() then
              cmp.select_next_item()
           elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
           else
              fallback()
           end
        end,
        ["<S-Tab>"] = function(fallback)
           if cmp.visible() then
              cmp.select_prev_item()
           elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
           else
              fallback()
           end
        end,
     },
     sources = {
        { name = "luasnip" },
        { name = "LuaSnip" },
        { name = "path" },
     },
}