; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x10 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x20 (ite $x10 (_ bv1 1) (_ bv0 1))))
(let ((?x103 ((_ zero_extend 31) ?x20)))
(let (($x34 (= $x10 (and (distinct ?x103 (_ bv0 32)) true))))
(not $x34))))))
(check-sat)
