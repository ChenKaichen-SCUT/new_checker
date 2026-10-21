; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x39 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x14 (ite $x39 (_ bv1 1) (_ bv0 1))))
(let ((?x38 ((_ zero_extend 31) ?x14)))
(let (($x17 (= $x39 (and (distinct ?x38 (_ bv0 32)) true))))
(not $x17))))))
(check-sat)
