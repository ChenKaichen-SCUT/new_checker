; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x49 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x17 (ite $x49 (_ bv1 1) (_ bv0 1))))
(let ((?x35 ((_ zero_extend 31) ?x17)))
(let (($x54 (= $x49 (and (distinct ?x35 (_ bv0 32)) true))))
(not $x54))))))
(check-sat)
