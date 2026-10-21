; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x55 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x39 (ite $x55 (_ bv1 1) (_ bv0 1))))
(let ((?x26 ((_ zero_extend 31) ?x39)))
(let (($x28 (= $x55 (and (distinct ?x26 (_ bv0 32)) true))))
(not $x28))))))
(check-sat)
