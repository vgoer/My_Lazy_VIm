-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 该文件由 plugins.core 自动加载
vim.g.mapleader = " " -- 设置全局 leader 键为空格
vim.g.maplocalleader = "\\" -- 设置局部 leader 键为反斜杠

-- LazyVim 自动格式化
vim.g.autoformat = true -- 自动格式化启用

-- LazyVim 选择器使用的工具
-- 可以是: telescope, fzf
-- 如果设置为 "auto"，则自动根据启用的 `:LazyExtras` 来选择
vim.g.lazyvim_picker = "auto"

-- LazyVim 根目录检测
-- 每一项可以是：
-- * 一个检测器函数的名称，例如 `lsp` 或 `cwd`
-- * 一个模式或模式数组，例如 `.git` 或 `lua`
-- * 一个函数，函数签名为 `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- LazyVim 自动配置 lazygit:
-- * 根据活动的颜色主题自动设置主题
-- * 将 editPreset 设置为 nvim-remote
-- * 启用 nerd 字体图标
-- 设置为 false 可以禁用
-- 你可以在 `~/.config/lazygit/custom.yml` 中覆盖选项
-- 注意: 如果在 Windows 上，可能需要将 `editPreset` 设置为 `"nvim"`，由于此问题：https://github.com/jesseduffield/lazygit/issues/3467
vim.g.lazygit_config = true

-- LazyVim 状态栏列选项
vim.g.lazyvim_statuscolumn = {
  folds_open = false, -- 折叠时显示符号
  folds_githl = false, -- 使用 Git 符号颜色高亮折叠符号
}

-- 可选的终端设置
-- 这会设置 `vim.o.shell` 并对如下进行额外配置：
-- * pwsh
-- * powershell
-- LazyVim.terminal.setup("pwsh")

-- 隐藏弃用警告
vim.g.deprecation_warnings = false

-- 对于大于 1.5 MB 的文件，设置文件类型为 `bigfile`
-- 仅启用 Vim 语法（并设置正确的文件类型）
-- LSP、treesitter 和其他文件类型插件将禁用
-- mini.animate 也将禁用
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- 在 lualine 中显示 Trouble 插件的当前文档符号位置
-- 你可以通过设置 `vim.b.trouble_lualine = false` 禁用该功能
vim.g.trouble_lualine = true

local opt = vim.opt

opt.autowrite = true -- 启用自动保存
-- 如果不是在 SSH 下，则设置系统剪贴板同步，确保 OSC 52 集成自动生效。需要 Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- 同步系统剪贴板
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- 隐藏 * 加粗和斜体的标记，但保留替换符号的标记
opt.confirm = true -- 退出修改缓冲区前确认保存
opt.cursorline = true -- 启用当前行高亮
opt.expandtab = true -- 使用空格代替 Tab
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- 忽略大小写
opt.inccommand = "nosplit" -- 增量替换预览
opt.jumpoptions = "view"
opt.laststatus = 3 -- 全局状态栏
opt.linebreak = true -- 在合适的位置换行
opt.list = true -- 显示某些不可见字符（例如 Tab）
opt.mouse = "a" -- 启用鼠标模式
opt.number = true -- 显示行号
opt.pumblend = 10 -- 弹出窗口混合度
opt.pumheight = 10 -- 弹出窗口最多显示 10 条条目
opt.relativenumber = true -- 显示相对行号
opt.scrolloff = 4 -- 上下滚动时留 4 行缓冲
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- 将缩进取整
opt.shiftwidth = 4 -- 缩进的大小
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- 不显示模式，因为我们有状态栏
opt.sidescrolloff = 8 -- 左右滚动时留 8 列缓冲
opt.signcolumn = "yes" -- 始终显示符号栏，否则每次切换时文本会移动
opt.smartcase = true -- 在有大写字母时不忽略大小写
opt.smartindent = true -- 自动插入缩进
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")
opt.splitbelow = true -- 新窗口在当前窗口下方打开
opt.splitkeep = "screen"
opt.splitright = true -- 新窗口在当前窗口右侧打开
opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
opt.tabstop = 4 -- Tab 键的空格数
opt.termguicolors = true -- 启用真彩色支持
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- 设置按键超时，低于默认值 (1000) 以快速触发 which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- 保存交换文件并触发 CursorHold 事件
opt.virtualedit = "block" -- 在可视块模式中允许光标移动到无文本的地方
opt.wildmode = "longest:full,full" -- 命令行补全模式
opt.winminwidth = 5 -- 最小窗口宽度
opt.wrap = false -- 禁用自动换行

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- 修正 markdown 缩进设置
vim.g.markdown_recommended_style = 0
