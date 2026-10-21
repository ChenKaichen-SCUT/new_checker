; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x6 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x70 (ite $x6 (_ bv1 1) (_ bv0 1))))
(let ((?x260 ((_ zero_extend 31) ?x70)))
(let (($x43 (= $x6 (and (distinct ?x260 (_ bv0 32)) true))))
(not $x43))))))
(check-sat)
