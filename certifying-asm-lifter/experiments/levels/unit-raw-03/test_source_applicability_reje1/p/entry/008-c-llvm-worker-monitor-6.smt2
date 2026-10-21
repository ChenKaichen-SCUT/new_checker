; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let (($x30 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-3|) true)))
(let ((?x17 (ite $x30 (_ bv1 1) (_ bv0 1))))
(let ((?x49 ((_ zero_extend 31) ?x17)))
(let (($x54 (= $x30 (and (distinct ?x49 (_ bv0 32)) true))))
(not $x54))))))
(check-sat)
