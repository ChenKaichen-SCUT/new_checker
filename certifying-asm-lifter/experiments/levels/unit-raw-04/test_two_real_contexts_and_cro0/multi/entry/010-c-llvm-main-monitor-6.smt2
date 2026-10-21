; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x62 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x121 (ite $x62 (_ bv1 1) (_ bv0 1))))
(let ((?x5 ((_ zero_extend 31) ?x121)))
(let (($x29 (= $x62 (and (distinct ?x5 (_ bv0 32)) true))))
(not $x29))))))
(check-sat)
