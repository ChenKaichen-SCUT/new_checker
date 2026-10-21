; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x33 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x10 (ite $x33 (_ bv1 1) (_ bv0 1))))
(let ((?x23 ((_ zero_extend 31) ?x10)))
(let (($x34 (= $x33 (and (distinct ?x23 (_ bv0 32)) true))))
(not $x34))))))
(check-sat)
