; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x5 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x42 (ite $x5 (_ bv1 1) (_ bv0 1))))
(let ((?x40 ((_ zero_extend 31) ?x42)))
(let (($x31 (= $x5 (and (distinct ?x40 (_ bv0 32)) true))))
(not $x31))))))
(check-sat)
