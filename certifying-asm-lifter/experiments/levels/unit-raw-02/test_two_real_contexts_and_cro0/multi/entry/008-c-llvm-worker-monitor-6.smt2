; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x62 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x20 (ite $x62 (_ bv1 1) (_ bv0 1))))
(let ((?x43 ((_ zero_extend 31) ?x20)))
(let (($x27 (= $x62 (and (distinct ?x43 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
