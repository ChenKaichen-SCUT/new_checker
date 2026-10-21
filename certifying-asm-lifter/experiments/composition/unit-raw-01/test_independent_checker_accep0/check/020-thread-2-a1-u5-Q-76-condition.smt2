; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x88 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x85 (= $x88 $x88)))
(not $x85))))
(check-sat)
