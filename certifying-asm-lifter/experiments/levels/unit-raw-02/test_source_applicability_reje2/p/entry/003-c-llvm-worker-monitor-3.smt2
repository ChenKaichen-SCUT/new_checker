; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x68 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x67 (ite $x68 (_ bv1 1) (_ bv0 1))))
(let ((?x10 ((_ zero_extend 31) ?x67)))
(let (($x27 (= $x68 (and (distinct ?x10 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
