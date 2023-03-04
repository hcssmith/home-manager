-- Initial load
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Functions
function SetColourScheme(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Nvim_create_autocmds(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function Exists(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      return true
    end
  end
  return ok, err
end

function Isdir(path)
  return Exists(path.."/")
end

function Mkdir()
  local dir = vim.api.nvim_buf_get_name(0)
  local d = dir:match("(.*/)")
  if Isdir(d)
    then
      return
  else
    print('Create missing directory? (y)')
    vim.api.nvim_command("let b:conf = nr2char(getchar())")
    local conf = vim.api.nvim_buf_get_var(0, 'conf')
    if conf == 'y' then os.execute('mkdir -p '..d) else return end
  end
end


-- autocommands
local autocmds = {
  saving = {
    {"BufWritePre",  "*",  ":lua Mkdir()"}
  }
}
Nvim_create_autocmds(autocmds)

--nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- keymaps
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Settings
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- split configurations
vim.keymap.set("n", "<C-h>", "<C-W><C-h>")
vim.keymap.set("n", "<C-j>", "<C-W><C-j>")
vim.keymap.set("n", "<C-k>", "<C-W><C-k>")
vim.keymap.set("n", "<C-l>", "<C-W><C-l>")
vim.keymap.set("n", "<C-Left>", "<C-W><C-h>")
vim.keymap.set("n", "<C-Down>", "<C-W><C-j>")
vim.keymap.set("n", "<C-Up>", "<C-W><C-k>")
vim.keymap.set("n", "<C-Right>", "<C-W><C-l>")
vim.cmd.set("splitbelow")
vim.cmd.set("splitright")
