if has('nvim-0.6.0')
lua << EOF
    local dashboard = require 'alpha.themes.dashboard' 
    local function footer()
        local installed_plugins = vim.g.plugs
        local len = 0
        for k, v in  pairs(installed_plugins) do
            len = len + 1
        end 
        return "Neovim loaded "..len.." plugins"
    end
    --menu
    dashboard.section.buttons.val = { 
        dashboard.button('e', '  Create empy buffer', ':ene <CR>'),
        dashboard.button('f', ' Find files', ':Telescope find_files<CR>'),
        dashboard.button('u', 'ﰵ Update plugins', 'PlugUpdate<CR>'),
        dashboard.button('q', ' Quit', ':qa<CR>'),
    }
    --footer
    dashboard.section.footer.val = footer()
    require'alpha'.setup(dashboard.opts)
EOF
endif
