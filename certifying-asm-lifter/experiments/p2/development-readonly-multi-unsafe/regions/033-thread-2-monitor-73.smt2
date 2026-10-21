; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x452 (and (distinct |activation-2:p1-open-rmw-1| |activation-2:p1-open-rmw-3|) true)))
(let (($x1188 (= $x452 $x452)))
(not $x1188))))
(check-sat)
