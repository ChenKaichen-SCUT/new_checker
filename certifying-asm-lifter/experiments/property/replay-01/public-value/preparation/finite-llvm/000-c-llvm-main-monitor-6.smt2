; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x1546 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x746 (ite $x1546 (_ bv1 1) (_ bv0 1))))
(let ((?x2524 ((_ zero_extend 31) ?x746)))
(let (($x3049 (= $x1546 (and (distinct ?x2524 (_ bv0 32)) true))))
(not $x3049))))))
(check-sat)
