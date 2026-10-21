; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x6 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x39 (ite $x6 (_ bv1 1) (_ bv0 1))))
(let ((?x9 ((_ zero_extend 31) ?x39)))
(let (($x16 (= $x6 (and (distinct ?x9 (_ bv0 32)) true))))
(not $x16))))))
(check-sat)
