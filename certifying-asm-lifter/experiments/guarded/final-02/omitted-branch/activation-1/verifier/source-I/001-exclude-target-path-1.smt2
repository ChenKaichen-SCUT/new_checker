; benchmark generated from python API
(set-info :status unknown)
(assert
 (let (($x42 (and true true true true true true true true true true true true true true true true true true true true)))
(let (($x100 (and true (not (and (distinct (_ bv1 1) (_ bv0 1)) true)))))
(and $x100 $x42))))
(check-sat)
