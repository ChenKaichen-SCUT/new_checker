; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x31 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x70 (ite $x31 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x70)))
(let (($x57 (= $x31 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x57))))))
(check-sat)
