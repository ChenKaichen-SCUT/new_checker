; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x42 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x34 (ite $x42 (_ bv1 1) (_ bv0 1))))
(let ((?x6 ((_ zero_extend 31) ?x34)))
(let (($x12 (= $x42 (and (distinct ?x6 (_ bv0 32)) true))))
(not $x12))))))
(check-sat)
