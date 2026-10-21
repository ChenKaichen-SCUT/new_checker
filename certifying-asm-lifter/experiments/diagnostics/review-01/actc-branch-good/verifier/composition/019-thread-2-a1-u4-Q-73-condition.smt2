; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x87 (and (distinct |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-3|) true)))
(let (($x110 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x93 (and (distinct (ite $x110 |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x140 (= $x93 $x87)))
(not $x140))))))
(check-sat)
