; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x43 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x33 (ite $x43 (_ bv1 1) (_ bv0 1))))
(let ((?x61 ((_ zero_extend 31) ?x33)))
(let (($x39 (= $x43 (and (distinct ?x61 (_ bv0 32)) true))))
(not $x39))))))
(check-sat)
