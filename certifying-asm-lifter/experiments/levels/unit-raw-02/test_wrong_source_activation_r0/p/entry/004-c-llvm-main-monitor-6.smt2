; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x46 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x56 (ite $x46 (_ bv1 1) (_ bv0 1))))
(let ((?x17 ((_ zero_extend 31) ?x56)))
(let (($x5 (= $x46 (and (distinct ?x17 (_ bv0 32)) true))))
(not $x5))))))
(check-sat)
