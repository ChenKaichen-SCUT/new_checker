; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x2906 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x449 (ite $x2906 (_ bv1 1) (_ bv0 1))))
(let ((?x2683 ((_ zero_extend 31) ?x449)))
(let (($x2524 (= $x2906 (and (distinct ?x2683 (_ bv0 32)) true))))
(not $x2524))))))
(check-sat)
