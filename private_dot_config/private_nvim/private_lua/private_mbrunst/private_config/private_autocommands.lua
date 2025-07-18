-- change colors of the line numbers
vim.cmd([[
    augroup highlight_line_numbers
        autocmd!
        autocmd ColorScheme * highlight LineNr guifg=#5081c0
    augroup END
]])

-- Highlight text that you yanked using movement commands
vim.cmd([[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
    augroup END
]])

-- remove trailing whitespace
vim.cmd([[
    augroup remove_trailing_whitespace
        autocmd!
        autocmd BufWritePre * %s/\s\+$//e
    augroup END
]])

-- remove trailing newline
vim.cmd([[
    augroup remove_trailing_newline
        autocmd!
        autocmd BufWritePre * %s/\n\+\%$//e
    augroup END
]])

-- Put diagnostics into loclist on write
vim.cmd([[
    augroup diagnostic_setloclist
        autocmd!
        autocmd BufRead,InsertLeave,BufWritePost * :lua vim.diagnostic.setloclist({open=false})
    augroup END
]])

-- Check if buffers were changed outside of vim and provide warning
vim.cmd([[
    augroup checktime_file_changes
        autocmd!
        let filetypesToIgnore = ['vim']
        autocmd CursorHold,CursorHoldI,FocusGained * if index(filetypesToIgnore, &ft) < 0 | :checktime
    augroup END
]])

-- open help pages in a vertical split by default
vim.cmd([[
    augroup help_pages_vertical_split
        autocmd!
        autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
    augroup END
]])
