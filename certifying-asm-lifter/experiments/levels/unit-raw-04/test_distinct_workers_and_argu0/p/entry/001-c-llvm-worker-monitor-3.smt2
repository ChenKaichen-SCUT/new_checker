; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x19 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x112 (ite $x19 (_ bv1 1) (_ bv0 1))))
(let ((?x9 ((_ zero_extend 31) ?x112)))
(let (($x46 (= $x19 (and (distinct ?x9 (_ bv0 32)) true))))
(not $x46))))))
(check-sat)
