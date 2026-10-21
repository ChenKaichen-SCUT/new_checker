; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x62 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x19 (ite $x62 (_ bv1 1) (_ bv0 1))))
(let ((?x8 ((_ zero_extend 31) ?x19)))
(let (($x32 (= $x62 (and (distinct ?x8 (_ bv0 32)) true))))
(not $x32))))))
(check-sat)
