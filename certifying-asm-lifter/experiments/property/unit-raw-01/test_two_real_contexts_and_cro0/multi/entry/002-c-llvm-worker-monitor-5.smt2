; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x30 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x43 (ite $x30 (_ bv1 1) (_ bv0 1))))
(let ((?x38 ((_ zero_extend 31) ?x43)))
(let (($x42 (= $x30 (and (distinct ?x38 (_ bv0 32)) true))))
(not $x42))))))
(check-sat)
