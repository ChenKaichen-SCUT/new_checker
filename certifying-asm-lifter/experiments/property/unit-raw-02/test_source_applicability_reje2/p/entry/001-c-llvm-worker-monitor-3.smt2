; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x34 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x15 (ite $x34 (_ bv1 1) (_ bv0 1))))
(let ((?x108 ((_ zero_extend 31) ?x15)))
(let (($x59 (= $x34 (and (distinct ?x108 (_ bv0 32)) true))))
(not $x59))))))
(check-sat)
