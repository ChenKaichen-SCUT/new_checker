; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x2534 (ite (and (distinct |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))))
(let (($x2810 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x2557 (and (distinct (ite $x2810 |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-1|) |pd-source-0:p1-open-rmw-3|) true)))
(let (($x1802 (= $x2557 (and (distinct ((_ zero_extend 31) ?x2534) (_ bv0 32)) true))))
(not $x1802))))))
(check-sat)
