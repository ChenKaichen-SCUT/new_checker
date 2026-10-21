; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x32 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x9 (ite $x32 (_ bv1 1) (_ bv0 1))))
(let ((?x10 ((_ zero_extend 31) ?x9)))
(let (($x16 (= $x32 (and (distinct ?x10 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
