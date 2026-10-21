; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x79 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x108 (ite $x79 (_ bv1 1) (_ bv0 1))))
(let ((?x7 ((_ zero_extend 31) ?x108)))
(let (($x101 (= $x79 (and (distinct ?x7 (_ bv0 32)) true))))
(not $x101))))))
(check-sat)
