; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x27 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x45 (ite $x27 (_ bv1 1) (_ bv0 1))))
(let ((?x39 ((_ zero_extend 31) ?x45)))
(let (($x19 (= $x27 (and (distinct ?x39 (_ bv0 32)) true))))
(not $x19))))))
(check-sat)
