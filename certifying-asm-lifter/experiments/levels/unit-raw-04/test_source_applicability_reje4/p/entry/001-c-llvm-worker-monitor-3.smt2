; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x19 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x91 (ite $x19 (_ bv1 1) (_ bv0 1))))
(let ((?x20 ((_ zero_extend 31) ?x91)))
(let (($x61 (= $x19 (and (distinct ?x20 (_ bv0 32)) true))))
(not $x61))))))
(check-sat)
