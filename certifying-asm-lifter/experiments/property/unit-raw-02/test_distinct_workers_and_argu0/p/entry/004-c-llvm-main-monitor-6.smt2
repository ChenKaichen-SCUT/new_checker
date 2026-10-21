; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x38 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x45 (ite $x38 (_ bv1 1) (_ bv0 1))))
(let ((?x102 ((_ zero_extend 31) ?x45)))
(let (($x60 (= $x38 (and (distinct ?x102 (_ bv0 32)) true))))
(not $x60))))))
(check-sat)
