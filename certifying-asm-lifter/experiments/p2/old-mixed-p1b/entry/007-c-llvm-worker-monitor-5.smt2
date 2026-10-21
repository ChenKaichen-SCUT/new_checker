; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x23 (and (distinct p1-open-rmw-1 p1-open-rmw-3) true)))
(let ((?x45 (ite $x23 (_ bv1 1) (_ bv0 1))))
(let ((?x19 ((_ zero_extend 31) ?x45)))
(let (($x20 (= $x23 (and (distinct ?x19 (_ bv0 32)) true))))
(not $x20))))))
(check-sat)
