; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x40 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x44 (ite $x40 (_ bv1 1) (_ bv0 1))))
(let ((?x21 ((_ zero_extend 31) ?x44)))
(let (($x50 (= $x40 (and (distinct ?x21 (_ bv0 32)) true))))
(not $x50))))))
(check-sat)
