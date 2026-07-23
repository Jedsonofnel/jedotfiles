;;; nvim package manager for jnl*

(fn clean []
  (let [installed (vim.pack.get)
        unused []]
    (each [_ plugin (ipairs installed)]
      (when (not plugin.active)
        (table.insert unused plugin.spec.name)))
    (if (= (length unused) 0)
        (print "No unused plugins.")
        (let [msg (.. "Remove unused plugins?\n" (table.concat unused "\n"))]
          (when (= (vim.fn.confirm msg "&Yes\n&No" 2) 1)
            (vim.pack.del unused))))))

(vim.cmd :redraw)
(clean)

(vim.fn.setqflist)

{: clean}
