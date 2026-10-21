; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x10 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x115 (ite $x10 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x115)))
(let (($x12 (= $x10 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x12))))))
(check-sat)
