; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x338 (and (distinct |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-3|) true)))
(let (($x28 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x356 (and (distinct (ite $x28 |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-1|) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x332 (= $x356 $x338)))
(not $x332))))))
(check-sat)
