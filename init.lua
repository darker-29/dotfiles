-- Bootstrap lazy.nvim
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
      'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    'karb94/neoscroll.nvim',
    'neoclide/coc.nvim',
    'preservim/nerdtree',
    'Xuyuanp/nerdtree-git-plugin',
    'tiagofumo/vim-nerdtree-syntax-highlight',
    'nvim-tree/nvim-tree.lua',
    'ryanoasis/vim-devicons',
    'previm/previm',
    'dhruvasagar/vim-table-mode',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'tomasr/molokai',
    'ltlollo/diokai',
    'morhetz/gruvbox',
    'ervandew/supertab',
    'thinca/vim-quickrun',
    'lewis6991/gitsigns.nvim',
    'scrooloose/syntastic',
    'tpope/vim-fugitive',
    'terryma/vim-expand-region',
    'tpope/vim-surround',
    'jiangmiao/auto-pairs',
    'fatih/vim-go',
    'AndrewRadev/splitjoin.vim',
    'easymotion/vim-easymotion',
    'phpactor/phpactor',
    'hashivim/vim-terraform',
    'aklt/plantuml-syntax',
    'tyru/open-browser.vim',
    'xavierchow/vim-swagger-preview',
    'preservim/vim-indent-guides',
    'bronson/vim-trailing-whitespace',
    'juliosueiras/vim-terraform-completion',
    'petertriho/nvim-scrollbar',
    'folke/tokyonight.nvim',
    'shellRaining/hlchunk.nvim',
    {
      'Bekaboo/dropbar.nvim',
      -- optional, but required for fuzzy finder support
      dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
      config = function()
        local dropbar_api = require('dropbar.api')
        vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
        vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
        vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
      end
    },
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- set this if you want to always pull the latest change
      opts = {
        -- add any opts here
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

require('avante_lib').load()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
        text = " ",
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color = nil,
        color_nr = nil, -- cterm
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 6,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "dropbar_menu",
        "dropbar_menu_fzf",
        "DressingInput",
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
})
--require("scrollbar").setup({
--    handle = {
--        color = colors.bg_highlight,
--    },
--    marks = {
--        Search = { color = colors.orange },
--        Error = { color = colors.error },
--        Warn = { color = colors.warning },
--        Info = { color = colors.info },
--        Hint = { color = colors.hint },
--        Misc = { color = colors.purple },
--    }
--})
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'vv', 'v$')
vim.keymap.set('n', 'vy', 'v$y')
vim.keymap.set('n', 'vyp', 'v$yP')
vim.keymap.set('n', 'm', '0')
vim.keymap.set('n', ',', 'A')
vim.keymap.set('n', ';', 'I')
vim.keymap.set('n', '?', 'O')
vim.keymap.set('n', '<C-j>', ':bnext<CR>')
vim.keymap.set('n', '<C-k>', ':bprev<CR>')
vim.keymap.set('n', '<C-c>', ':NvimTreeToggle<CR>')
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('i', '<silent> <C-j><C-j>', '<ESC>:wq<Enter>', { silent = true })
vim.keymap.set('i', '<silent> <Space>nn', ':wq<Enter>', { silent = true })
vim.keymap.set('n', '<Space>vs', ':vs<Enter>', { silent = true })
vim.keymap.set('n', '<Space>sp', ':sp<Enter>', { silent = true })

vim.cmd("inoremap jj <Esc>")
vim.cmd[[colorscheme gruvbox]]
vim.g.mapleader = "<Space>"

-- NerdTree Enter2回
vim.keymap.set('n', '<Enter><Enter>', ':NERDTreeToggle<Enter>', { silent = true })


vim.opt.cursorcolumn=true -- カーソル列のハイライト表示 ←カーソル遅くなる原因
vim.opt.cursorline=true -- カーソル行のハイライト表示 ←カーソル遅くなる原因
vim.opt.number=true -- 行数を表示
vim.opt.showmatch=true -- 対応する記号を強調して表示
vim.opt.laststatus=2 -- ステータス行を2行表示
vim.opt.scrolloff=20 -- 常に20行目がセンターに来るよう移動表示
vim.opt.autoread=true -- 他でファイルに変更があった場合に読み込み
vim.opt.hidden=true -- 保存されていないファイルがあっても別のファイルを表示可能
vim.opt.showcmd=true
vim.opt.visualbell=true -- ピープ音の無効化
vim.opt.belloff=all
-- vim.opt.ambiwidth=double
-- vim.opt.splitbelow
-- vim.opt.splitright
-- vim.opt.expandtab "タブを入力したとき半角スペースの入力に置き換える
-- vim.opt.tabstop=4 "tab押下時のタブ幅
-- vim.opt.autoindent "改行時に前の行のインデントを継続するか
-- vim.opt.smartindent "改行時前の行の構文をチェックし次のインデントを増減するか否か
-- vim.opt.shiftwidth=4 "smartindentの増減幅
-- vim.opt.clipboard=unnamed "unnamed指定でヤンク時にクリップボードに保存、autoselectはヤンク前にクリップボードに保存
-- vim.opt.ignorecase "検索パターンに大文字小文字の区別をしない
-- vim.opt.incsearch "インクリメンタルサーチ、入力された1文字毎に検索を実行
-- vim.opt.hlsearch "検索結果をハイライト表示する"
-- vim.opt.nowrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
-- vim.opt.list
-- vim.opt.listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
-- vim.opt.backspace=eol,indent,start
-- vim.opt.wildmode=list:longest
-- vim.opt.nrformats=""


