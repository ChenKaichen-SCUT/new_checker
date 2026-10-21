; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x9 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x10 (ite $x9 (_ bv1 1) (_ bv0 1))))
(let ((?x15 ((_ zero_extend 31) ?x10)))
(let (($x13 (= $x9 (and (distinct ?x15 (_ bv0 32)) true))))
(not $x13))))))
(check-sat)
