; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x51 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x15 (ite $x51 (_ bv1 1) (_ bv0 1))))
(let ((?x73 ((_ zero_extend 31) ?x15)))
(let (($x101 (= $x51 (and (distinct ?x73 (_ bv0 32)) true))))
(not $x101))))))
(check-sat)
