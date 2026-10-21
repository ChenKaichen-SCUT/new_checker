; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x80 (and (distinct (_ bv0 32) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x116 (= $x80 $x80)))
(not $x116))))
(check-sat)
