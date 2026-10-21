; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x16 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x8 (ite $x16 (_ bv1 1) (_ bv0 1))))
(let ((?x13 ((_ zero_extend 31) ?x8)))
(let (($x10 (= $x16 (and (distinct ?x13 (_ bv0 32)) true))))
(not $x10))))))
(check-sat)
