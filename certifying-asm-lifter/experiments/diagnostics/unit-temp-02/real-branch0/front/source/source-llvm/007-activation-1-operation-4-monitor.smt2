; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x270 (ite (and (distinct |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))))
(let (($x170 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x38 (and (distinct (ite $x170 |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x172 (= $x38 (and (distinct ((_ zero_extend 31) ?x270) (_ bv0 32)) true))))
(not $x172))))))
(check-sat)
