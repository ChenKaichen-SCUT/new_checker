; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x26 (and (distinct (_ bv0 32) |activation-2:p1-open-rmw-3|) true)))
(let (($x51 (= $x26 $x26)))
(not $x51))))
(check-sat)
