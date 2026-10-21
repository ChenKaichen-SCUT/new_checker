; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x14 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x25 (ite $x14 (_ bv1 1) (_ bv0 1))))
(let ((?x23 ((_ zero_extend 31) ?x25)))
(let (($x27 (= $x14 (and (distinct ?x23 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
