; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x98 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x101 (ite $x98 (_ bv1 1) (_ bv0 1))))
(let ((?x35 ((_ zero_extend 31) ?x101)))
(let (($x43 (= $x98 (and (distinct ?x35 (_ bv0 32)) true))))
(not $x43))))))
(check-sat)
