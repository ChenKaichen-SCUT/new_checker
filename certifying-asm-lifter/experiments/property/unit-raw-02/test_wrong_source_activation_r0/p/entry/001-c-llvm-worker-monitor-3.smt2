; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x17 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x13 (ite $x17 (_ bv1 1) (_ bv0 1))))
(let ((?x44 ((_ zero_extend 31) ?x13)))
(let (($x45 (= $x17 (and (distinct ?x44 (_ bv0 32)) true))))
(not $x45))))))
(check-sat)
