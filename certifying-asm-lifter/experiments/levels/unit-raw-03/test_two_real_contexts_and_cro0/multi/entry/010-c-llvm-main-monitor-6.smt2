; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x40 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x49 (ite $x40 (_ bv1 1) (_ bv0 1))))
(let ((?x34 ((_ zero_extend 31) ?x49)))
(let (($x51 (= $x40 (and (distinct ?x34 (_ bv0 32)) true))))
(not $x51))))))
(check-sat)
