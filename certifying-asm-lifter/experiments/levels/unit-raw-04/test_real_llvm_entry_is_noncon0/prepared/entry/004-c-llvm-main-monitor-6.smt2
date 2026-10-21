; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x42 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x19 (ite $x42 (_ bv1 1) (_ bv0 1))))
(let ((?x31 ((_ zero_extend 31) ?x19)))
(let (($x45 (= $x42 (and (distinct ?x31 (_ bv0 32)) true))))
(not $x45))))))
(check-sat)
