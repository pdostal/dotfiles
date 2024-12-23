require("plugins")

vim.o.mouse = nil

vim.o.showtabline = 1 -- Show tab bar even for one tab

vim.o.encoding = 'UTF-8'
vim.o.fileencoding = 'UTF-8'
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = true -- Visually show what are you typing

vim.o.backspace = "indent,eol,start" -- allow backspacing over everything.

vim.o.expandtab = false -- Convert tabs to spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2

require('gitsigns').setup{
  signcolumn = false,
  numhl = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>'
}

require'nvim-lastplace'.setup {
  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
  lastplace_open_folds = true
}

-- Pyright
require('lspconfig').pyright.setup{}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'ayu_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

