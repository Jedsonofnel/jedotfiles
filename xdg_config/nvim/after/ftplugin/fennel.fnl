;; fennel wants 2 spaces rather than 4
(set vim.opt.tabstop 2)

(local {: api} (require :nvim-paredit))
(local opts {:buffer true :silent true})

(each [key fn* (pairs {:<M-w> api.move_to_next_element_head
                       :<M-b> api.move_to_prev_element_head
                       :<M-e> api.move_to_next_element_tail
                       :<M-u> api.move_to_parent_form_start
                       :<M-U> api.move_to_parent_form_end})]
  (vim.keymap.set [:n :i :x :v] key fn* opts))

(vim.keymap.set :n :<M-l> api.drag_element_forwards
                (vim.tbl_extend :force opts {:desc "Drag element right"}))

(vim.keymap.set :n :<M-h> api.drag_element_backwards
                (vim.tbl_extend :force opts {:desc "Drag element left"}))

(vim.keymap.set :n :<M-k> api.drag_form_forwards
                (vim.tbl_extend :force opts {:desc "Drag form right"}))

(vim.keymap.set :n :<M-j> api.drag_form_backwards
                (vim.tbl_extend :force opts {:desc "Drag form left"}))
