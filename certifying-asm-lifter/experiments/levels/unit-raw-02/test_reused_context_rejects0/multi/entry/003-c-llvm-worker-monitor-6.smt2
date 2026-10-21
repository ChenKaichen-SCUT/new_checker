; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x58 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x33 (ite $x58 (_ bv1 1) (_ bv0 1))))
(let ((?x31 ((_ zero_extend 31) ?x33)))
(let (($x13 (= $x58 (and (distinct ?x31 (_ bv0 32)) true))))
(not $x13))))))
(check-sat)
