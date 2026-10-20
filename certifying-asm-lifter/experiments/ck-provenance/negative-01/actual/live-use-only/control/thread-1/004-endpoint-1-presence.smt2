; benchmark generated from python API
(set-info :status unknown)
(assert
 (let (($x20 (or true)))
(let (($x40 (or $x20)))
(let (($x41 (= true $x40)))
(not $x41)))))
(check-sat)
