; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x17 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x44 (ite $x17 (_ bv1 1) (_ bv0 1))))
(let ((?x6 ((_ zero_extend 31) ?x44)))
(let (($x21 (= $x17 (and (distinct ?x6 (_ bv0 32)) true))))
(not $x21))))))
(check-sat)
