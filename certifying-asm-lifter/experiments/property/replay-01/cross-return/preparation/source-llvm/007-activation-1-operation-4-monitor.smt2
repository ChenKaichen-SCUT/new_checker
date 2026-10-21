; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x413 (ite (and (distinct |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-3|) true) (_ bv1 1) (_ bv0 1))))
(let (($x2144 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x2583 (and (distinct (ite $x2144 |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-3|) true)))
(let (($x1368 (= $x2583 (and (distinct ((_ zero_extend 31) ?x413) (_ bv0 32)) true))))
(not $x1368))))))
(check-sat)
