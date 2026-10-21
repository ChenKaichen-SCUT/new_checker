; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x54 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x44 (ite $x54 (_ bv1 1) (_ bv0 1))))
(let ((?x14 ((_ zero_extend 31) ?x44)))
(let (($x41 (= $x54 (and (distinct ?x14 (_ bv0 32)) true))))
(not $x41))))))
(check-sat)
