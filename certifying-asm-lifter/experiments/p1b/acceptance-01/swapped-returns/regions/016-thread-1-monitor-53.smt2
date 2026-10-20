; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |activation-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct (_ bv0 32) |activation-1:p1-open-rmw-3|) true)))
(let (($x18 (= (and (distinct (_ bv0 32) |activation-1:p1-open-rmw-1|) true) $x21)))
(not $x18))))
(check-sat)
