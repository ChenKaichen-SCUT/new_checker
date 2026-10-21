; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x29 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x50 (ite $x29 (_ bv1 1) (_ bv0 1))))
(let ((?x18 ((_ zero_extend 31) ?x50)))
(let (($x53 (= $x29 (and (distinct ?x18 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
