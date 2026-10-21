; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x48 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x70 (ite $x48 (_ bv1 1) (_ bv0 1))))
(let ((?x28 ((_ zero_extend 31) ?x70)))
(let (($x24 (= $x48 (and (distinct ?x28 (_ bv0 32)) true))))
(not $x24))))))
(check-sat)
