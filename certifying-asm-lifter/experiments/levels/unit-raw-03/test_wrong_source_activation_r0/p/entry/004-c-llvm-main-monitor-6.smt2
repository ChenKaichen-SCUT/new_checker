; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x18 (ite $x57 (_ bv1 1) (_ bv0 1))))
(let ((?x46 ((_ zero_extend 31) ?x18)))
(let (($x47 (= $x57 (and (distinct ?x46 (_ bv0 32)) true))))
(not $x47))))))
(check-sat)
