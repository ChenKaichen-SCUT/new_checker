; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x44 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x8 (ite $x44 (_ bv1 1) (_ bv0 1))))
(let ((?x26 ((_ zero_extend 31) ?x8)))
(let (($x5 (= $x44 (and (distinct ?x26 (_ bv0 32)) true))))
(not $x5))))))
(check-sat)
