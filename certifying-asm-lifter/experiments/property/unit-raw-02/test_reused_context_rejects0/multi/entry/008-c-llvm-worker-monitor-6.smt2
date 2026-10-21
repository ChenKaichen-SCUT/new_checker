; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x11 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x115 (ite $x11 (_ bv1 1) (_ bv0 1))))
(let ((?x101 ((_ zero_extend 31) ?x115)))
(let (($x57 (= $x11 (and (distinct ?x101 (_ bv0 32)) true))))
(not $x57))))))
(check-sat)
