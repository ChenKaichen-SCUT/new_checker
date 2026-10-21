; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(assert
 (let (($x440 (and (distinct (_ bv0 32) p1-open-rmw-3) true)))
(let ((?x1719 (ite $x440 (_ bv1 1) (_ bv0 1))))
(let ((?x455 ((_ zero_extend 31) ?x1719)))
(let (($x507 (= $x440 (and (distinct ?x455 (_ bv0 32)) true))))
(not $x507))))))
(check-sat)
