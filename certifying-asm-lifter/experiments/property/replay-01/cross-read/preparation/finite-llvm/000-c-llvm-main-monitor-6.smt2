; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x352 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x722 (ite $x352 (_ bv1 1) (_ bv0 1))))
(let ((?x1546 ((_ zero_extend 31) ?x722)))
(let (($x2803 (= $x352 (and (distinct ?x1546 (_ bv0 32)) true))))
(not $x2803))))))
(check-sat)
