; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x20 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x45 (ite $x20 (_ bv1 1) (_ bv0 1))))
(let ((?x47 ((_ zero_extend 31) ?x45)))
(let (($x53 (= $x20 (and (distinct ?x47 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
