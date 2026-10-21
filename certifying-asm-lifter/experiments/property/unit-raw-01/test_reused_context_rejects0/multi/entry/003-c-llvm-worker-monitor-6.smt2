; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x54 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x26 (ite $x54 (_ bv1 1) (_ bv0 1))))
(let ((?x11 ((_ zero_extend 31) ?x26)))
(let (($x27 (= $x54 (and (distinct ?x11 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
