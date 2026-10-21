; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x29 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x27 (ite $x29 (_ bv1 1) (_ bv0 1))))
(let ((?x61 ((_ zero_extend 31) ?x27)))
(let (($x58 (= $x29 (and (distinct ?x61 (_ bv0 32)) true))))
(not $x58))))))
(check-sat)
