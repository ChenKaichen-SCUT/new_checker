; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x55 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x13 (ite $x55 (_ bv1 1) (_ bv0 1))))
(let ((?x64 ((_ zero_extend 31) ?x13)))
(let (($x29 (= $x55 (and (distinct ?x64 (_ bv0 32)) true))))
(not $x29))))))
(check-sat)
