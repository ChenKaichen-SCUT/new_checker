; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x15 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x7 (ite $x15 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x7)))
(let (($x36 (= $x15 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x36))))))
(check-sat)
