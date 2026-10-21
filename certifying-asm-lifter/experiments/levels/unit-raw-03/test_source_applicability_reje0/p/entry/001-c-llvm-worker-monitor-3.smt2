; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x52 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x36 (ite $x52 (_ bv1 1) (_ bv0 1))))
(let ((?x61 ((_ zero_extend 31) ?x36)))
(let (($x34 (= $x52 (and (distinct ?x61 (_ bv0 32)) true))))
(not $x34))))))
(check-sat)
