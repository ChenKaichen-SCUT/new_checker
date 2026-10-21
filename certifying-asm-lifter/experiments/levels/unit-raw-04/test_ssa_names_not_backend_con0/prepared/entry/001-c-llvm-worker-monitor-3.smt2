; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x46 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x49 (ite $x46 (_ bv1 1) (_ bv0 1))))
(let ((?x25 ((_ zero_extend 31) ?x49)))
(let (($x29 (= $x46 (and (distinct ?x25 (_ bv0 32)) true))))
(not $x29))))))
(check-sat)
