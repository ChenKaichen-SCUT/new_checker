; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x17 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x15 (ite $x17 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x15)))
(let (($x40 (= $x17 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x40))))))
(check-sat)
