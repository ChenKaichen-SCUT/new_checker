; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x16 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x20 (ite $x16 (_ bv1 1) (_ bv0 1))))
(let ((?x43 ((_ zero_extend 31) ?x20)))
(let (($x33 (= $x16 (and (distinct ?x43 (_ bv0 32)) true))))
(not $x33))))))
(check-sat)
