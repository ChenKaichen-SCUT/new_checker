; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x110 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x20 (ite $x110 (_ bv1 1) (_ bv0 1))))
(let ((?x7 ((_ zero_extend 31) ?x20)))
(let (($x61 (= $x110 (and (distinct ?x7 (_ bv0 32)) true))))
(not $x61))))))
(check-sat)
