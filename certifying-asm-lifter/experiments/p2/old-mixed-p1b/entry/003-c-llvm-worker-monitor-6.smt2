; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) p1-open-rmw-3) true)))
(let ((?x28 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x41 ((_ zero_extend 31) ?x28)))
(let (($x38 (= $x24 (and (distinct ?x41 (_ bv0 32)) true))))
(not $x38))))))
(check-sat)
