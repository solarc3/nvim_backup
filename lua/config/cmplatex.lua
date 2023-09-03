require "cmp".setup {
    sources = {
        -- The cache option is used to determine whether to generate the list
        -- of symbols every time you start Neovim, or if it should be stored in
        -- a cache file to save time. I strongly do not advise changing this
        -- option because the data used for this plugin has not been updated
        -- since 2011.
        { name = "lua-latex-symbols", option = { cache = true } }
    }
}
require "cmp".setup.filetype({ "tex", "plaintex" }, {
    sources = {
        { name = "lua-latex-symbols"}
    }
})