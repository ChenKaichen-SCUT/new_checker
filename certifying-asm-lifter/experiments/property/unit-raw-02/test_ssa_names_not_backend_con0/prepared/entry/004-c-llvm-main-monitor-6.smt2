; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x51 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x39 (ite $x51 (_ bv1 1) (_ bv0 1))))
(let ((?x28 ((_ zero_extend 31) ?x39)))
(let (($x101 (= $x51 (and (distinct ?x28 (_ bv0 32)) true))))
(not $x101))))))
(check-sat)
