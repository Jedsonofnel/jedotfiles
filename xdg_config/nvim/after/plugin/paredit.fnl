;; some nvim-paredit config

(local paredit (require :nvim-paredit))
(local {: api} paredit)

(fn wrap-parent [l-delim r-delim]
  "Creates function for wrapping form with delim"
  (fn []
    (api.wrap_enclosing_form_under_cursor {:opener l-delim :closer r-delim})))

(fn wrap-elem [l-delim r-delim]
  "Creates function for wrapping element with delim"
  (fn []
    (api.wrap_enclosing_form_under_cursor {:opener l-delim :closer r-delim})))

(local keys {;; Defaults are automatically included
             ;; Wrap compound form
             :<localleader>i [(wrap-parent "(" ")") "Wrap form with ()"]
             "<localleader>[" [(wrap-parent "[" "]") "Wrap form with []"]
             "<localleader>{" [(wrap-parent "{" "}") "Wrap form with {}"]
             ;; Wrap element
             :<localleader>w [(wrap-elem "(" ")") "Wrap element with ()"]
             "<localleader>e[" [(wrap-elem "[" "]") "Wrap element with []"]
             "<localleader>e{" [(wrap-elem "{" "}") "Wrap element with {}"]
             ;; M-hjkl drag bindings
             :<M-l> [api.drag_element_forwards "Drag element right"]
             :<M-h> [api.drag_element_backwards "Drag element left"]
             :<M-k> [api.drag_form_forwards "Drag form right"]
             :<M-j> [api.drag_form_backwards "Drag form left"]
             ;; M-S-hjkl slurp/barf (vim-sexp style)
             :<M-S-l> [api.slurp_forwards "Slurp forwards"]
             :<M-S-h> [api.barf_forwards "Barf forwards"]
             :<M-S-k> [api.slurp_backwards "Slurp backwards"]
             :<M-S-j> [api.barf_backwards "Barf backwards"]
             ;; Insert in form
             :<localleader>^ [(fn [] (api.move_to_parent_form_start)
                                (vim.api.nvim_feedkeys :a :n false))
                              "Insert at form head"]
             :<localleader>$ [(fn [] (api.move_to_parent_form_end)
                                (vim.cmd :startinsert))
                              "Insert at form tail"]})

(paredit.setup {:use_default_keys true : keys})
