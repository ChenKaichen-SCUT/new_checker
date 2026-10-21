; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x28 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x51 (ite $x28 (_ bv1 1) (_ bv0 1))))
(let ((?x68 ((_ zero_extend 31) ?x51)))
(let (($x26 (= $x28 (and (distinct ?x68 (_ bv0 32)) true))))
(not $x26))))))
(check-sat)
