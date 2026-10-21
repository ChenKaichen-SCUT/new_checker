; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x20 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x59 (ite $x20 (_ bv1 1) (_ bv0 1))))
(let ((?x60 ((_ zero_extend 31) ?x59)))
(let (($x10 (= $x20 (and (distinct ?x60 (_ bv0 32)) true))))
(not $x10))))))
(check-sat)
