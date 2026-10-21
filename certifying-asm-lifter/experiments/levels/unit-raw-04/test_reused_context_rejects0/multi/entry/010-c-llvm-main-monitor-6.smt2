; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x64 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x30 (ite $x64 (_ bv1 1) (_ bv0 1))))
(let ((?x91 ((_ zero_extend 31) ?x30)))
(let (($x33 (= $x64 (and (distinct ?x91 (_ bv0 32)) true))))
(not $x33))))))
(check-sat)
