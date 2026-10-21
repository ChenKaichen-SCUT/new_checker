; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x17 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x54 (ite $x17 (_ bv1 1) (_ bv0 1))))
(let ((?x11 ((_ zero_extend 31) ?x54)))
(let (($x9 (= $x17 (and (distinct ?x11 (_ bv0 32)) true))))
(not $x9))))))
(check-sat)
