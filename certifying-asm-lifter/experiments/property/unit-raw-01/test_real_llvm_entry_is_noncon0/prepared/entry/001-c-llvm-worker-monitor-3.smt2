; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x49 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x47 (ite $x49 (_ bv1 1) (_ bv0 1))))
(let ((?x26 ((_ zero_extend 31) ?x47)))
(let (($x55 (= $x49 (and (distinct ?x26 (_ bv0 32)) true))))
(not $x55))))))
(check-sat)
