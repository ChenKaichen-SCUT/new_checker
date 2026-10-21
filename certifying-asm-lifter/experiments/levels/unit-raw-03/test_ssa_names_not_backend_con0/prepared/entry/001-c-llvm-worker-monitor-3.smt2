; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x26 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x6 (ite $x26 (_ bv1 1) (_ bv0 1))))
(let ((?x22 ((_ zero_extend 31) ?x6)))
(let (($x62 (= $x26 (and (distinct ?x22 (_ bv0 32)) true))))
(not $x62))))))
(check-sat)
