; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x582 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x2622 (ite $x582 (_ bv1 1) (_ bv0 1))))
(let ((?x404 ((_ zero_extend 31) ?x2622)))
(let (($x1314 (= $x582 (and (distinct ?x404 (_ bv0 32)) true))))
(not $x1314))))))
(check-sat)
