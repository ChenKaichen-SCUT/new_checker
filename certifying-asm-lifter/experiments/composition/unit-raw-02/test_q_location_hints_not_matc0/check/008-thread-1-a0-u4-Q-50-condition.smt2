; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x125 (and (distinct |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-3|) true)))
(let (($x76 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x79 (and (distinct (ite $x76 |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-1|) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x51 (= $x79 $x125)))
(not $x51))))))
(check-sat)
