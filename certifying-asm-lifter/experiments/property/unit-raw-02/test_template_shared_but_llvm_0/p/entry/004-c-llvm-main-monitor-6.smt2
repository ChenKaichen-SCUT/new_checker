; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x34 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x18 (ite $x34 (_ bv1 1) (_ bv0 1))))
(let ((?x36 ((_ zero_extend 31) ?x18)))
(let (($x42 (= $x34 (and (distinct ?x36 (_ bv0 32)) true))))
(not $x42))))))
(check-sat)
