; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) p1-open-rmw-3) true)))
(let ((?x39 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x47 ((_ zero_extend 31) ?x39)))
(let (($x35 (= $x24 (and (distinct ?x47 (_ bv0 32)) true))))
(not $x35))))))
(check-sat)
