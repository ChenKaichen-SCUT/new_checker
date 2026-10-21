; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x51 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x61 (ite $x51 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x61)))
(let (($x22 (= $x51 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x22))))))
(check-sat)
