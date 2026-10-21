; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x48 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x73 (ite $x48 (_ bv1 1) (_ bv0 1))))
(let ((?x70 ((_ zero_extend 31) ?x73)))
(let (($x49 (= $x48 (and (distinct ?x70 (_ bv0 32)) true))))
(not $x49))))))
(check-sat)
