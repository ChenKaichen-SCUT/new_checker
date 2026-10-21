; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x5 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x18 (ite $x5 (_ bv1 1) (_ bv0 1))))
(let ((?x47 ((_ zero_extend 31) ?x18)))
(let (($x30 (= $x5 (and (distinct ?x47 (_ bv0 32)) true))))
(not $x30))))))
(check-sat)
