; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |activation-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x51 (and (distinct |activation-1:p1-open-rmw-1| |activation-1:p1-open-rmw-3|) true)))
(let (($x48 (= $x51 $x51)))
(not $x48))))
(check-sat)
