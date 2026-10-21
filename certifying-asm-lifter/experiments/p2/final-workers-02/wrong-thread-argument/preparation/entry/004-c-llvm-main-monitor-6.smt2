; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x7 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x18 (ite $x7 (_ bv1 1) (_ bv0 1))))
(let ((?x19 ((_ zero_extend 31) ?x18)))
(let (($x20 (= $x7 (and (distinct ?x19 (_ bv0 32)) true))))
(not $x20))))))
(check-sat)
