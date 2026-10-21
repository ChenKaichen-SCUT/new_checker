; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x17 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x54 (ite $x17 (_ bv1 1) (_ bv0 1))))
(let ((?x21 ((_ zero_extend 31) ?x54)))
(let (($x29 (= $x17 (and (distinct ?x21 (_ bv0 32)) true))))
(not $x29))))))
(check-sat)
