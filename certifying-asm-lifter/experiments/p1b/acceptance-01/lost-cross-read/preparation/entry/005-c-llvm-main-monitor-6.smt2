; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x7 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x41 (ite $x7 (_ bv1 1) (_ bv0 1))))
(let ((?x38 ((_ zero_extend 31) ?x41)))
(let (($x19 (= $x7 (and (distinct ?x38 (_ bv0 32)) true))))
(not $x19))))))
(check-sat)
