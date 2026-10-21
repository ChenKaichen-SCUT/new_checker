; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x42 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x121 (ite $x42 (_ bv1 1) (_ bv0 1))))
(let ((?x45 ((_ zero_extend 31) ?x121)))
(let (($x53 (= $x42 (and (distinct ?x45 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
