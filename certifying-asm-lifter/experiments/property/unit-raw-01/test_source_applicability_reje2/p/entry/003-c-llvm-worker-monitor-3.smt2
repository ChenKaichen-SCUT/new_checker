; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x84 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x106 (ite $x84 (_ bv1 1) (_ bv0 1))))
(let ((?x12 ((_ zero_extend 31) ?x106)))
(let (($x58 (= $x84 (and (distinct ?x12 (_ bv0 32)) true))))
(not $x58))))))
(check-sat)
