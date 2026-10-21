; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x56 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x79 (ite $x56 (_ bv1 1) (_ bv0 1))))
(let ((?x37 ((_ zero_extend 31) ?x79)))
(let (($x35 (= $x56 (and (distinct ?x37 (_ bv0 32)) true))))
(not $x35))))))
(check-sat)
