; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x47 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x20 (ite $x47 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x20)))
(let (($x13 (= $x47 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x13))))))
(check-sat)
