; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x52 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x55 ((_ zero_extend 31) ?x52)))
(let (($x91 (= $x24 (and (distinct ?x55 (_ bv0 32)) true))))
(not $x91))))))
(check-sat)
