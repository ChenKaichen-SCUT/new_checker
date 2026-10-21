; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x7 (and (distinct (_ bv0 32) p1-open-rmw-1) true)))
(let ((?x35 (ite $x7 (_ bv1 1) (_ bv0 1))))
(let ((?x37 ((_ zero_extend 31) ?x35)))
(let (($x16 (= $x7 (and (distinct ?x37 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
