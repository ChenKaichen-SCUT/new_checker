; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(declare-fun p1-open-rmw-1 () (_ BitVec 32))
(assert
 (let (($x1192 (and (distinct p1-open-rmw-1 p1-open-rmw-3) true)))
(let ((?x1184 (ite $x1192 (_ bv1 1) (_ bv0 1))))
(let ((?x54 ((_ zero_extend 31) ?x1184)))
(let (($x296 (= $x1192 (and (distinct ?x54 (_ bv0 32)) true))))
(not $x296))))))
(check-sat)
