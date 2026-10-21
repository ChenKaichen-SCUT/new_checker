; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x42 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x23 (ite $x42 (_ bv1 1) (_ bv0 1))))
(let ((?x108 ((_ zero_extend 31) ?x23)))
(let (($x17 (= $x42 (and (distinct ?x108 (_ bv0 32)) true))))
(not $x17))))))
(check-sat)
