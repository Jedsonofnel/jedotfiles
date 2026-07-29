;;; JEDN nvim config in fennel!

;; Helpers
(fn setopt [optname val]
  (tset vim.opt optname val))

(fn setkmap [modestr key mapping]
  (vim.keymap.set modestr key mapping))

(fn setkmap-n [key mapping]
  (setkmap :n key mapping))

(fn codeberg [name]
  {:src (.. "https://codeberg.org/" name)})

(fn github [name]
  {:src (.. "https://github.com/" name)})

;; leader keys
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; options
(setopt :winborder :single)
(setopt :number true)
(setopt :relativenumber true)
(setopt :signcolumn :yes)
(setopt :cursorline true)
(setopt :termguicolors true)
(setopt :wrap false)
(setopt :clipboard :unnamedplus)
(setopt :scrollof 8)
(setopt :incsearch true)
(setopt :smartcase true)

(setopt :tabstop 4)
(setopt :expandtab true)
(setopt :shiftwidth 0)

;; Basic mappings
(setkmap-n :<leader>e #(vim.cmd.edit (vim.fn.expand "%:p:h")))
(setkmap-n :<leader>sc ":nohl<CR>")
(setkmap-n :<leader><leader> :<c-6>)

;; package addition
(vim.pack.add [(codeberg :comfysage/artio.nvim)
               (github :nvim-mini/mini.icons)
               (github :nvim-mini/mini.base16)
               (github :stevearc/conform.nvim)
               (github :neovim/nvim-lspconfig)
               (github :romus204/tree-sitter-manager.nvim)
               (github :lukas-reineke/indent-blankline.nvim)
               (github :windwp/nvim-autopairs)
               ;; lisp stuff
               (github :jpalardy/vim-slime)
               (github :julienvincent/nvim-paredit)
               (github :olical/conjure)
               (github :olical/nfnl)])

;; enable UI2
(let [ui2 (require :vim._core.ui2)]
  (ui2.enable {:enable true :msg {:target :msg}}))

;; artio config
(let [artio (require :artio)]
  (artio.setup {:opts {:promptprefix ">" :pointer ">"}
                :win {:height 10}
                :mappings {:<down> :down
                           :<up> :up
                           :<c-n> :up
                           :<c-p> :up
                           :<cr> :accept
                           :<esc> :cancel
                           :<tab> :mark
                           :<c-g> :togglelive
                           :<c-l> :togglepreview
                           :<c-q> :setqflist
                           :<m-q> :setqflistmark}})
  (set vim.ui.select artio.select))

(setkmap-n :<c-p> "<Plug>(artio-files)")
(setkmap-n :<leader>ff "<Plug>(artio-smart)")
(setkmap-n :<leader>fg "<Plug>(artio-grep)")
(setkmap-n :<leader>fb "<Plug>(artio-buffers)")
(setkmap-n :<leader>fo "<Plug>(artio-oldfiles)")

;; LSP

(vim.lsp.enable [:clangd
                 :lua_ls
                 :biome
                 :gopls
                 :html
                 :ruby_lsp
                 :pyright
                 :fennel_ls
                 :zig])

(vim.config :lua_ls
            {:root_markers [:.nfnl.fnl
                            :.luarc.json
                            :.luarc.jsonc
                            :.luacheckrc
                            :.stylua.toml
                            :.git]
             :settings {:Lua {:diagnostics {:globals [:vim]}
                              :workspace {:checkThirdParty false
                                          :library [vim.env.VIMRUNTIME]}}}})

(setkmap-n :<leader>d vim.diagnostic.open_float)
(setkmap-n :<leader>lr ":lsp restart<CR>")
(setkmap-n :<leader>lf
           (fn []
             (let [conform (require :conform)]
               (conform.format {:timeout_ms 1000}))))
