; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x35 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x44 (ite $x35 (_ bv1 1) (_ bv0 1))))
(let ((?x58 ((_ zero_extend 31) ?x44)))
(let (($x31 (= $x35 (and (distinct ?x58 (_ bv0 32)) true))))
(not $x31))))))
(check-sat)
