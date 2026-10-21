; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x8 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x41 (ite $x8 (_ bv1 1) (_ bv0 1))))
(let ((?x27 ((_ zero_extend 31) ?x41)))
(let (($x53 (= $x8 (and (distinct ?x27 (_ bv0 32)) true))))
(not $x53))))))
(check-sat)
