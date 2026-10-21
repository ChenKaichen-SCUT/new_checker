; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x32 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x10 (ite $x32 (_ bv1 1) (_ bv0 1))))
(let ((?x30 ((_ zero_extend 31) ?x10)))
(let (($x33 (= $x32 (and (distinct ?x30 (_ bv0 32)) true))))
(not $x33))))))
(check-sat)
