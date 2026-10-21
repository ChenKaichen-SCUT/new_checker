; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x176 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x302 (= $x176 $x176)))
(not $x302))))
(check-sat)
