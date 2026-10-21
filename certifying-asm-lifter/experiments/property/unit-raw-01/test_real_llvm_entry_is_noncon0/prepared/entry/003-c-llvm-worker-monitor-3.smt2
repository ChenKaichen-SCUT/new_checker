; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x11 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x114 (ite $x11 (_ bv1 1) (_ bv0 1))))
(let ((?x41 ((_ zero_extend 31) ?x114)))
(let (($x52 (= $x11 (and (distinct ?x41 (_ bv0 32)) true))))
(not $x52))))))
(check-sat)
