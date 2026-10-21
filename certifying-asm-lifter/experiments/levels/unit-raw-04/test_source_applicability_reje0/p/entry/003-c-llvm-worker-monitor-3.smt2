; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x92 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x93 (ite $x92 (_ bv1 1) (_ bv0 1))))
(let ((?x79 ((_ zero_extend 31) ?x93)))
(let (($x33 (= $x92 (and (distinct ?x79 (_ bv0 32)) true))))
(not $x33))))))
(check-sat)
