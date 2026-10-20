; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x60 (and (distinct |activation-2:p1-open-rmw-1| |activation-2:p1-open-rmw-3|) true)))
(let (($x39 (= $x60 $x60)))
(not $x39))))
(check-sat)
