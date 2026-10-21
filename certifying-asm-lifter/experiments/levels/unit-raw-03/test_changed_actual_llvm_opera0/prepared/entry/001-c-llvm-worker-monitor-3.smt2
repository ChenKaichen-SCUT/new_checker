; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-1|) true)))
(let ((?x11 (ite $x57 (_ bv1 1) (_ bv0 1))))
(let ((?x32 ((_ zero_extend 31) ?x11)))
(let (($x5 (= $x57 (and (distinct ?x32 (_ bv0 32)) true))))
(not $x5))))))
(check-sat)
