; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x180 (and (distinct |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-3|) true)))
(let (($x153 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x359 (and (distinct (ite $x153 |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x179 (= $x359 $x180)))
(not $x179))))))
(check-sat)
