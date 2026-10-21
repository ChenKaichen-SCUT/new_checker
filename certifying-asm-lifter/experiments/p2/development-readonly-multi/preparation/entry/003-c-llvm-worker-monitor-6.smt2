; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-rmw-3 () (_ BitVec 32))
(assert
 (let (($x1193 (and (distinct (_ bv0 32) p1-open-rmw-3) true)))
(let ((?x235 (ite $x1193 (_ bv1 1) (_ bv0 1))))
(let ((?x1180 ((_ zero_extend 31) ?x235)))
(let (($x1183 (= $x1193 (and (distinct ?x1180 (_ bv0 32)) true))))
(not $x1183))))))
(check-sat)
