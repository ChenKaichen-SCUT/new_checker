; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x7 (and (distinct (_ bv0 32) p1-open-rmw-1) true)))
(let ((?x26 (ite $x7 (_ bv1 1) (_ bv0 1))))
(let ((?x34 ((_ zero_extend 31) ?x26)))
(let (($x27 (= $x7 (and (distinct ?x34 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
