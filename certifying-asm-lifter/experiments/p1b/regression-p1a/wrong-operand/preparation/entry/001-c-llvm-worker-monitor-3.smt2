; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x10 (and (distinct (_ bv0 32) p1-open-rmw-1) true)))
(let ((?x20 (ite $x10 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x20)))
(let (($x28 (= $x10 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x28))))))
(check-sat)
