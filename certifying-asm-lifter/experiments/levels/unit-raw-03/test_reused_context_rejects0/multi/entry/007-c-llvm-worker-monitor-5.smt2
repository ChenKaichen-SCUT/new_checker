; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x36 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x20 (ite $x36 (_ bv1 1) (_ bv0 1))))
(let ((?x27 ((_ zero_extend 31) ?x20)))
(let (($x11 (= $x36 (and (distinct ?x27 (_ bv0 32)) true))))
(not $x11))))))
(check-sat)
