; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x12 (and (distinct p1-open-rmw-1 p1-open-rmw-3) true)))
(let ((?x29 (ite $x12 (_ bv1 1) (_ bv0 1))))
(let ((?x18 ((_ zero_extend 31) ?x29)))
(let (($x19 (= $x12 (and (distinct ?x18 (_ bv0 32)) true))))
(not $x19))))))
(check-sat)
