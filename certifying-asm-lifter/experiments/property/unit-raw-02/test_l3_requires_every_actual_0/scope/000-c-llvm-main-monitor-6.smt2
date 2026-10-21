; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x49 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x18 (ite $x49 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x18)))
(let (($x16 (= $x49 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
