; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x16 (ite $x21 (_ bv1 1) (_ bv0 1))))
(let ((?x54 ((_ zero_extend 31) ?x16)))
(let (($x44 (= $x21 (and (distinct ?x54 (_ bv0 32)) true))))
(not $x44))))))
(check-sat)
