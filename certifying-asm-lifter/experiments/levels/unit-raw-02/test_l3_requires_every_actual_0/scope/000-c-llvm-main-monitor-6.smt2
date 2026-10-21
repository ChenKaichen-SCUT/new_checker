; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x5 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x31 (ite $x5 (_ bv1 1) (_ bv0 1))))
(let ((?x43 ((_ zero_extend 31) ?x31)))
(let (($x60 (= $x5 (and (distinct ?x43 (_ bv0 32)) true))))
(not $x60))))))
(check-sat)
