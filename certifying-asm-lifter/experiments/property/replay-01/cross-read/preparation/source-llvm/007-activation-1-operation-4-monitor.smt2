; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x384 (ite (and (distinct |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))))
(let (($x2583 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x404 (and (distinct (ite $x2583 |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x1496 (= $x404 (and (distinct ((_ zero_extend 31) ?x384) (_ bv0 32)) true))))
(not $x1496))))))
(check-sat)
