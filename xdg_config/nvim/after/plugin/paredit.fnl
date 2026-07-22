;; some nvim-paredit config

(local paredit (require :nvim-paredit))
(local {: api : cursor : wrap} paredit)

(local closing {"(" ")" "[" "]" "{" "}"})
(local placement-str {:inner_start :head :inner_end :tail})

(fn wrap-parent [delim placement]
  "Creates function for wrapping form with delim, insert at placement"
  (let [endelim (. closing delim)
        placement (or placement :inner_start)]
    [(fn []
       (cursor.place_cursor (wrap.wrap_enclosing_form_under_cursor delim
                                                                   endelim)
                            {: placement :mode :insert}))
     (string.format "Wrap form with %s%s, insert %s" delim endelim
                    (. placement-str placement))]))

(fn wrap-parent-tail [delim]
  (wrap-parent delim :inner_start))

(fn wrap-elem [delim placement]
  "Creates function for wrapping element with delim, insert at placement"
  (let [endelim (. closing delim)
        placement (or placement :inner_start)]
    [(fn []
       (cursor.place_cursor (wrap.wrap_element_under_cursor delim endelim)
                            {: placement :mode :insert}))
     (string.format "Wrap element with %s%s, insert %s" delim endelim
                    (. placement-str placement))]))

(fn wrap-elem-tail [delim]
  (wrap-elem delim :inner_end))

(local keys {;; Defaults are automatically included
             ;; Wrap compound form
             :<localleader>i (wrap-parent "(")
             :<localleader>I (wrap-parent-tail "(")
             "<localleader>[" (wrap-parent "[")
             "<localleader>]" (wrap-parent-tail "[")
             "<localleader>{" (wrap-parent "{")
             "<localleader>}" (wrap-parent-tail "{")
             ;; Wrap element
             :<localleader>w (wrap-elem "(")
             :<localleader>W (wrap-elem-tail "(")
             "<localleader>e[" (wrap-elem "[")
             "<localleader>e]" (wrap-elem-tail "[")
             "<localleader>e{" (wrap-elem "{" "}")
             "<localleader>e}" (wrap-elem-tail "{")
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
