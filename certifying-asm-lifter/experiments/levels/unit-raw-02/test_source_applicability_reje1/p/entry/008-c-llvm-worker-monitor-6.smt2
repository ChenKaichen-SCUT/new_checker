; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x30 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x55 ((_ zero_extend 31) ?x30)))
(let (($x22 (= $x24 (and (distinct ?x55 (_ bv0 32)) true))))
(not $x22))))))
(check-sat)
