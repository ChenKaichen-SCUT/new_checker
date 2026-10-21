; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x41 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x69 (ite $x41 (_ bv1 1) (_ bv0 1))))
(let ((?x61 ((_ zero_extend 31) ?x69)))
(let (($x51 (= $x41 (and (distinct ?x61 (_ bv0 32)) true))))
(not $x51))))))
(check-sat)
