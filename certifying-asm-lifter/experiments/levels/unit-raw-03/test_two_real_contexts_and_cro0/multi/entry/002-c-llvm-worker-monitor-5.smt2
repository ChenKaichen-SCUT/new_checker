; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x23 (and (distinct |source-create-0:p1-open-rmw-1| |source-create-0:p1-open-rmw-3|) true)))
(let ((?x27 (ite $x23 (_ bv1 1) (_ bv0 1))))
(let ((?x58 ((_ zero_extend 31) ?x27)))
(let (($x8 (= $x23 (and (distinct ?x58 (_ bv0 32)) true))))
(not $x8))))))
(check-sat)
