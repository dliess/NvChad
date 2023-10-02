vim.opt.colorcolumn = "80"

vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Define a function to execute the build process
function build_and_compile()
    vim.cmd('wa') -- Save all open buffers
    vim.cmd('lcd build') -- Change directory to "build"
    vim.cmd('!cmake -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. ') -- Run CMake and build
    vim.cmd('compiler gcc') -- Set the compiler to "gcc"
    vim.cmd('make -j8') -- Start compilation
    vim.cmd('lcd ..') -- Start compilation
end

-- Create a key mapping for F5 to call the build_and_compile function
vim.api.nvim_set_keymap('n', '<F5>', ':lua build_and_compile()<CR>', { noremap = true, silent = true })

--require('leap').add_default_mappings()

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

vim.o.shell = 'zsh'

-- create a mapping to search for word under cursor
vim.api.nvim_set_keymap('n', '<leader>fc', [[:lua require('telescope.builtin').grep_string{ search = vim.fn.expand("<cword>")}<CR>]], { noremap = true, silent = true })

-- Go to the next quickfix entry
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>zz', { desc = "Forward qflist" })
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>zz', { desc = "Backward qflist" })


-- Go to the previous quickfix entry
--vim.api.nvim_set_keymap('n', '<leader>p', ':cprev<CR>', { noremap = true })

-- Open the quickfix entry under the cursor in a new window
--vim.api.nvim_set_keymap('n', '<leader>o', ':cc<CR>', { noremap = true })

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })
vim.keymap.set('v', 'kj', '<Esc>', { noremap = true })

vim.wo.relativenumber = true

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()' -- use treesitter for folding
vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.wo.fillchars = "fold: "
vim.wo.foldlevel = 99
