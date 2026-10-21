; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct |source-create-1:p1-open-rmw-1| |source-create-1:p1-open-rmw-3|) true)))
(let ((?x10 (ite $x21 (_ bv1 1) (_ bv0 1))))
(let ((?x51 ((_ zero_extend 31) ?x10)))
(let (($x35 (= $x21 (and (distinct ?x51 (_ bv0 32)) true))))
(not $x35))))))
(check-sat)
