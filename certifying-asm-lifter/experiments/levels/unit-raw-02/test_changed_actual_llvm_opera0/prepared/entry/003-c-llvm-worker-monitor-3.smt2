; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x53 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x27 (ite $x53 (_ bv1 1) (_ bv0 1))))
(let ((?x55 ((_ zero_extend 31) ?x27)))
(let (($x57 (= $x53 (and (distinct ?x55 (_ bv0 32)) true))))
(not $x57))))))
(check-sat)
