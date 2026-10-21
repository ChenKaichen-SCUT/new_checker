; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x60 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x106 (ite $x60 (_ bv1 1) (_ bv0 1))))
(let ((?x59 ((_ zero_extend 31) ?x106)))
(let (($x43 (= $x60 (and (distinct ?x59 (_ bv0 32)) true))))
(not $x43))))))
(check-sat)
