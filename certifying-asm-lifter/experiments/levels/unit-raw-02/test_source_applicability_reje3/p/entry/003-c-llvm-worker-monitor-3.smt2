; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x46 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x48 (ite $x46 (_ bv1 1) (_ bv0 1))))
(let ((?x56 ((_ zero_extend 31) ?x48)))
(let (($x36 (= $x46 (and (distinct ?x56 (_ bv0 32)) true))))
(not $x36))))))
(check-sat)
