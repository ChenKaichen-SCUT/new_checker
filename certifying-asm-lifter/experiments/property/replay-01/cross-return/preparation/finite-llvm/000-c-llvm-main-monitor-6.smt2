; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x2533 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x3052 (ite $x2533 (_ bv1 1) (_ bv0 1))))
(let ((?x400 ((_ zero_extend 31) ?x3052)))
(let (($x723 (= $x2533 (and (distinct ?x400 (_ bv0 32)) true))))
(not $x723))))))
(check-sat)
