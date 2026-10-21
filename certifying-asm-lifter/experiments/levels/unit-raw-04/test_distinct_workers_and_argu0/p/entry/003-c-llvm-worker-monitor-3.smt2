; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x70 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x30 ((_ zero_extend 31) ?x70)))
(let (($x39 (= $x24 (and (distinct ?x30 (_ bv0 32)) true))))
(not $x39))))))
(check-sat)
