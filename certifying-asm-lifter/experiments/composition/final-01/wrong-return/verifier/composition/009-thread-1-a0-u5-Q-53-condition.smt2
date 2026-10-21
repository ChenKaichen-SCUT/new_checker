; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x147 (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-1|) true)))
(let (($x80 (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x59 (= $x80 $x147)))
(not $x59)))))
(check-sat)
