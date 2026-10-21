; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x10 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x5 (ite $x10 (_ bv1 1) (_ bv0 1))))
(let ((?x7 ((_ zero_extend 31) ?x5)))
(let (($x14 (= $x10 (and (distinct ?x7 (_ bv0 32)) true))))
(not $x14))))))
(check-sat)
