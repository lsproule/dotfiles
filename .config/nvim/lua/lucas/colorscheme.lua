--vim.cmd("colorscheme tokyonight-storm")
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
--vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
--vim.cmd("hi CurSearch guibg=#ff0000 guifg=#e6e6e6")
--require("notify").setup({
--  background_colour = "#000000",
--})
local theme = {}

-- Define the color palette
local colors = {
    bg = "#252525",
    fg = "#f5f5f5",
    red = "#d3494e",
    light_red = "#fc595f",
    accent = "#00d6c9",
    faded_red = "#df9395",
    muted_red = "#ba8586",
    select = "#2f394a",
    gray = "#5d6f71",
}

-- Apply the colors to highlight groups
theme.setup = function()
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.g.colors_name = "custom_palette"

    local hl = function(group, fg, bg, style)
        local cmd = "highlight " .. group .. " guifg=" .. (fg or "NONE") .. " guibg=" .. (bg or "NONE")
        if style then
            cmd = cmd .. " gui=" .. style
        end
        vim.cmd(cmd)
    end

    -- UI Elements
    hl("Normal", colors.fg, colors.bg)
    hl("Comment", colors.gray, nil, "italic")
    hl("Error", colors.light_red, nil, "bold")
    hl("String", colors.faded_red)
    hl("Keyword", colors.red, nil, "bold")
    hl("Directory", colors.accent, nil, "bold")
    hl("Function", colors.accent, nil, "bold")
    hl("Type", colors.muted_red, nil, "bold")
    hl("Constant", colors.faded_red)
    hl("Identifier", colors.light_red)
    hl("Statement", colors.red, nil, "bold")
    hl("PreProc", colors.accent)
    hl("Special", colors.red)
    hl("CursorLine", nil, colors.gray)
    hl("Visual", nil, colors.select)
    hl("CursorLine", nil, colors.select)
    hl("Pmenu", colors.fg, colors.gray)
    hl("PmenuSel", colors.bg, colors.accent)
    hl("StatusLine", colors.bg, colors.red)
    hl("StatusLineNC", colors.gray, colors.bg)
    hl("VertSplit", colors.accent, colors.bg)
end
theme.setup()

