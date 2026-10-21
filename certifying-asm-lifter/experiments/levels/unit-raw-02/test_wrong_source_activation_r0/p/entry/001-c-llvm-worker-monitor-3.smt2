; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x29 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x65 (ite $x29 (_ bv1 1) (_ bv0 1))))
(let ((?x49 ((_ zero_extend 31) ?x65)))
(let (($x30 (= $x29 (and (distinct ?x49 (_ bv0 32)) true))))
(not $x30))))))
(check-sat)
