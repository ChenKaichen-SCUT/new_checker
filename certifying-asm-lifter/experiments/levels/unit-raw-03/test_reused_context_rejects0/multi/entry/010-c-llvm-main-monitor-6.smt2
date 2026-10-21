; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x66 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x10 (ite $x66 (_ bv1 1) (_ bv0 1))))
(let ((?x30 ((_ zero_extend 31) ?x10)))
(let (($x27 (= $x66 (and (distinct ?x30 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
