; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x64 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x23 (ite $x64 (_ bv1 1) (_ bv0 1))))
(let ((?x108 ((_ zero_extend 31) ?x23)))
(let (($x43 (= $x64 (and (distinct ?x108 (_ bv0 32)) true))))
(not $x43))))))
(check-sat)
