; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x38 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x8 (ite $x38 (_ bv1 1) (_ bv0 1))))
(let ((?x69 ((_ zero_extend 31) ?x8)))
(let (($x50 (= $x38 (and (distinct ?x69 (_ bv0 32)) true))))
(not $x50))))))
(check-sat)
