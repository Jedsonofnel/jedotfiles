;; some nvim-paredit config

(local paredit (require :nvim-paredit))

(local keys {;; Defaults are automatically included
             ;; Wrap compound form
             :<localleader>i [(fn []
                                (paredit.api.wrap_enclosing_form_under_cursor {:opener "("
                                                                               :closer ")"}))
                              "Wrap form with ()"]
             "<localleader>[" [(fn []
                                 (paredit.api.wrap_enclosing_form_under_cursor {:opener "["
                                                                                :closer "]"}))
                               "Wrap form with []"]
             "<localleader>{" [(fn []
                                 (paredit.api.wrap_enclosing_form_under_cursor {:opener "{"
                                                                                :closer "}"}))
                               "Wrap form with {}"]
             ;; Wrap element
             :<localleader>w [(fn []
                                (paredit.api.wrap_element_under_cursor {:opener "("
                                                                        :closer ")"}))
                              "Wrap element with ()"]
             "<localleader>e[" [(fn []
                                  (paredit.api.wrap_element_under_cursor {:opener "["
                                                                          :closer "]"}))
                                "Wrap element with []"]
             "<localleader>e{" [(fn []
                                  (paredit.api.wrap_element_under_cursor {:opener "{"
                                                                          :closer "}"}))
                                "Wrap element with {}"]
             ;; M-hjkl drag bindings
             :<M-l> [paredit.api.drag_element_forwards "Drag element right"]
             :<M-h> [paredit.api.drag_element_backwards "Drag element left"]
             :<M-k> [paredit.api.drag_form_forwards "Drag form right"]
             :<M-j> [paredit.api.drag_form_backwards "Drag form left"]
             ;; M-S-hjkl slurp/barf (vim-sexp style)
             :<M-S-l> [paredit.api.slurp_forwards "Slurp forwards"]
             :<M-S-h> [paredit.api.barf_forwards "Barf forwards"]
             :<M-S-k> [paredit.api.slurp_backwards "Slurp backwards"]
             :<M-S-j> [paredit.api.barf_backwards "Barf backwards"]
             ;; Insert in form
             :<localleader>^ [(fn [] (paredit.api.move_to_parent_form_start)
                                (vim.api.nvim_feedkeys :a :n false))
                              "Insert at form head"]
             :<localleader>$ [(fn [] (paredit.api.move_to_parent_form_end)
                                (vim.cmd :startinsert))
                              "Insert at form tail"]})

(paredit.setup {:use_default_keys true : keys})
