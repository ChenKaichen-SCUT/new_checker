; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x108 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x34 (ite $x108 (_ bv1 1) (_ bv0 1))))
(let ((?x12 ((_ zero_extend 31) ?x34)))
(let (($x53 (= $x108 (and (distinct ?x12 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
