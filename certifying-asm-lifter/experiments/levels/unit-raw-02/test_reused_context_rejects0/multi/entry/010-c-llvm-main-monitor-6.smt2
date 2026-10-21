; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x66 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x7 (ite $x66 (_ bv1 1) (_ bv0 1))))
(let ((?x24 ((_ zero_extend 31) ?x7)))
(let (($x32 (= $x66 (and (distinct ?x24 (_ bv0 32)) true))))
(not $x32))))))
(check-sat)
