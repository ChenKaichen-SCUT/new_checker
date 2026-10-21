; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x8 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x59 (ite $x8 (_ bv1 1) (_ bv0 1))))
(let ((?x66 ((_ zero_extend 31) ?x59)))
(let (($x7 (= $x8 (and (distinct ?x66 (_ bv0 32)) true))))
(not $x7))))))
(check-sat)
