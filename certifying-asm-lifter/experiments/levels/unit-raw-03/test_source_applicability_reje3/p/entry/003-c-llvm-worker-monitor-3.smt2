; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct (_ bv0 32) |source-create-1:p1-open-rmw-1|) true)))
(let ((?x21 (ite $x57 (_ bv1 1) (_ bv0 1))))
(let ((?x20 ((_ zero_extend 31) ?x21)))
(let (($x35 (= $x57 (and (distinct ?x20 (_ bv0 32)) true))))
(not $x35))))))
(check-sat)
