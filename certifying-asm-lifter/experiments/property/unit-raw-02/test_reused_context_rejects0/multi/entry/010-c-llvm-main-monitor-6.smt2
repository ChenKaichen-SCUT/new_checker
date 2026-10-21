; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x64 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x115 (ite $x64 (_ bv1 1) (_ bv0 1))))
(let ((?x101 ((_ zero_extend 31) ?x115)))
(let (($x26 (= $x64 (and (distinct ?x101 (_ bv0 32)) true))))
(not $x26))))))
(check-sat)
