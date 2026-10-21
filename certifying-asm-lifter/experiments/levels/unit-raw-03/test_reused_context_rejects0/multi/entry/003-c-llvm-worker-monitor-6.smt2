; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x61 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x67 (ite $x61 (_ bv1 1) (_ bv0 1))))
(let ((?x34 ((_ zero_extend 31) ?x67)))
(let (($x43 (= $x61 (and (distinct ?x34 (_ bv0 32)) true))))
(not $x43))))))
(check-sat)
