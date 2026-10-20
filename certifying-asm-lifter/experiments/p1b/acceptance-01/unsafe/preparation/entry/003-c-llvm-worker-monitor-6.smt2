; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(assert
 (let (($x13 (and (distinct (_ bv0 32) p1-open-rmw-3) true)))
(let ((?x41 (ite $x13 (_ bv1 1) (_ bv0 1))))
(let ((?x38 ((_ zero_extend 31) ?x41)))
(let (($x42 (= $x13 (and (distinct ?x38 (_ bv0 32)) true))))
(not $x42))))))
(check-sat)
