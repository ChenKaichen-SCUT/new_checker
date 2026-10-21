; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x23 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x7 (ite $x23 (_ bv1 1) (_ bv0 1))))
(let ((?x24 ((_ zero_extend 31) ?x7)))
(let (($x11 (= $x23 (and (distinct ?x24 (_ bv0 32)) true))))
(not $x11))))))
(check-sat)
