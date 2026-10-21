; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x61 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x27 (ite $x61 (_ bv1 1) (_ bv0 1))))
(let ((?x11 ((_ zero_extend 31) ?x27)))
(let (($x51 (= $x61 (and (distinct ?x11 (_ bv0 32)) true))))
(not $x51))))))
(check-sat)
