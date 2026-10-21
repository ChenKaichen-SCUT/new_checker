; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x11 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x58 (ite $x11 (_ bv1 1) (_ bv0 1))))
(let ((?x31 ((_ zero_extend 31) ?x58)))
(let (($x69 (= $x11 (and (distinct ?x31 (_ bv0 32)) true))))
(not $x69))))))
(check-sat)
