; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x5 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x70 (ite $x5 (_ bv1 1) (_ bv0 1))))
(let ((?x23 ((_ zero_extend 31) ?x70)))
(let (($x53 (= $x5 (and (distinct ?x23 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
