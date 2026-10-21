; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x36 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x121 (ite $x36 (_ bv1 1) (_ bv0 1))))
(let ((?x5 ((_ zero_extend 31) ?x121)))
(let (($x14 (= $x36 (and (distinct ?x5 (_ bv0 32)) true))))
(not $x14))))))
(check-sat)
