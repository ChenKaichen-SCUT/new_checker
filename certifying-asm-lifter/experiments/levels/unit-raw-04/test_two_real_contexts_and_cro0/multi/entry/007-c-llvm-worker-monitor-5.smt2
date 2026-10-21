; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x26 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x30 (ite $x26 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x30)))
(let (($x49 (= $x26 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x49))))))
(check-sat)
