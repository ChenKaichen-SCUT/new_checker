; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct (_ bv0 32) |activation-1:p1-open-rmw-3|) true)))
(let (($x54 (= $x21 $x21)))
(not $x54))))
(check-sat)
