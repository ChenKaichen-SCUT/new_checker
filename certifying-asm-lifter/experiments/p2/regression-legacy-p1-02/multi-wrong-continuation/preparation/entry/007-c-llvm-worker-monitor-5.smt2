; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x44 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x55 (ite $x44 (_ bv1 1) (_ bv0 1))))
(let ((?x25 ((_ zero_extend 31) ?x55)))
(let (($x41 (= $x44 (and (distinct ?x25 (_ bv0 32)) true))))
(not $x41))))))
(check-sat)
