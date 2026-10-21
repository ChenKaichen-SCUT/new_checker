; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x49 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x121 (ite $x49 (_ bv1 1) (_ bv0 1))))
(let ((?x45 ((_ zero_extend 31) ?x121)))
(let (($x23 (= $x49 (and (distinct ?x45 (_ bv0 32)) true))))
(not $x23))))))
(check-sat)
