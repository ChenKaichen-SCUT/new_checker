; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x14 (ite $x21 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x14)))
(let (($x42 (= $x21 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x42))))))
(check-sat)
