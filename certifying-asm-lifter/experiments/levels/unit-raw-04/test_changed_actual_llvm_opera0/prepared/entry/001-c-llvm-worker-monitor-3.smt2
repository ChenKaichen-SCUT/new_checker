; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x48 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x61 (ite $x48 (_ bv1 1) (_ bv0 1))))
(let ((?x5 ((_ zero_extend 31) ?x61)))
(let (($x21 (= $x48 (and (distinct ?x5 (_ bv0 32)) true))))
(not $x21))))))
(check-sat)
