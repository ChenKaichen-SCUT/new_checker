; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x53 (and (distinct (_ bv0 32) |pd-source-1:p1-open-rmw-1|) true)))
(let (($x17 (= $x53 $x53)))
(not $x17))))
(check-sat)
