; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x49 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x30 (ite $x49 (_ bv1 1) (_ bv0 1))))
(let ((?x11 ((_ zero_extend 31) ?x30)))
(let (($x26 (= $x49 (and (distinct ?x11 (_ bv0 32)) true))))
(not $x26))))))
(check-sat)
