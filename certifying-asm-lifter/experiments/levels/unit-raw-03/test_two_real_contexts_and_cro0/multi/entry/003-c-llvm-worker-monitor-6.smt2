; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x61 (and (distinct (_ bv0 32) |source-create-0:p1-open-rmw-3|) true)))
(let ((?x54 (ite $x61 (_ bv1 1) (_ bv0 1))))
(let ((?x55 ((_ zero_extend 31) ?x54)))
(let (($x59 (= $x61 (and (distinct ?x55 (_ bv0 32)) true))))
(not $x59))))))
(check-sat)
