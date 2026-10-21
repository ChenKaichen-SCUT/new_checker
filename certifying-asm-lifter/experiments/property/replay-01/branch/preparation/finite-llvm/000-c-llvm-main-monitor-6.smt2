; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x1167 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x513 (ite $x1167 (_ bv1 1) (_ bv0 1))))
(let ((?x326 ((_ zero_extend 31) ?x513)))
(let (($x564 (= $x1167 (and (distinct ?x326 (_ bv0 32)) true))))
(not $x564))))))
(check-sat)
