; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x59 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x103 (ite $x59 (_ bv1 1) (_ bv0 1))))
(let ((?x10 ((_ zero_extend 31) ?x103)))
(let (($x30 (= $x59 (and (distinct ?x10 (_ bv0 32)) true))))
(not $x30))))))
(check-sat)
