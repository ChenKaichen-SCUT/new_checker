; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x44 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x26 (ite $x44 (_ bv1 1) (_ bv0 1))))
(let ((?x56 ((_ zero_extend 31) ?x26)))
(let (($x5 (= $x44 (and (distinct ?x56 (_ bv0 32)) true))))
(not $x5))))))
(check-sat)
