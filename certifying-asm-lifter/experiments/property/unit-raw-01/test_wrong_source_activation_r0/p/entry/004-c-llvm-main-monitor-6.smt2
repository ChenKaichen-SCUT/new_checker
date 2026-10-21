; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x39 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x35 (ite $x39 (_ bv1 1) (_ bv0 1))))
(let ((?x57 ((_ zero_extend 31) ?x35)))
(let (($x5 (= $x39 (and (distinct ?x57 (_ bv0 32)) true))))
(not $x5))))))
(check-sat)
