; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x6 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x19 (ite $x6 (_ bv1 1) (_ bv0 1))))
(let ((?x34 ((_ zero_extend 31) ?x19)))
(let (($x11 (= $x6 (and (distinct ?x34 (_ bv0 32)) true))))
(not $x11))))))
(check-sat)
