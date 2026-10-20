; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x36 (and (distinct (_ bv2 32) p0-main-read-0) true)))
(let ((?x62 (ite $x36 (_ bv1 1) (_ bv0 1))))
(let ((?x67 ((_ zero_extend 31) ?x62)))
(let (($x45 (= $x36 (and (distinct ?x67 (_ bv0 32)) true))))
(not $x45))))))
(check-sat)
