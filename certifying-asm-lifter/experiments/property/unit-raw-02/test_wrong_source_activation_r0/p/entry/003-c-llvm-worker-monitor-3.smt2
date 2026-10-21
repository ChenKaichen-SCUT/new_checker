; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x30 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x14 (ite $x30 (_ bv1 1) (_ bv0 1))))
(let ((?x20 ((_ zero_extend 31) ?x14)))
(let (($x73 (= $x30 (and (distinct ?x20 (_ bv0 32)) true))))
(not $x73))))))
(check-sat)
