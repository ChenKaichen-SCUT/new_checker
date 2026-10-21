; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x499 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x330 (ite $x499 (_ bv1 1) (_ bv0 1))))
(let ((?x61 ((_ zero_extend 31) ?x330)))
(let (($x66 (= $x499 (and (distinct ?x61 (_ bv0 32)) true))))
(not $x66))))))
(check-sat)
