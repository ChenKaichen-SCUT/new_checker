; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x1173 (and (distinct |activation-2:p1-open-rmw-1| |activation-2:p1-open-rmw-3|) true)))
(let (($x32 (= $x1173 $x1173)))
(not $x32))))
(check-sat)
