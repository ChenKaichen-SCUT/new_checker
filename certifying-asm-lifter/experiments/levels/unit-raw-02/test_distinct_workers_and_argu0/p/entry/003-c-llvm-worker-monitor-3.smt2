; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x5 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x56 (ite $x5 (_ bv1 1) (_ bv0 1))))
(let ((?x20 ((_ zero_extend 31) ?x56)))
(let (($x24 (= $x5 (and (distinct ?x20 (_ bv0 32)) true))))
(not $x24))))))
(check-sat)
