; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-read-2 () (_ BitVec 32))
(assert
 (let (($x15 (and (distinct (_ bv0 32) p1-open-read-2) true)))
(let ((?x54 (ite $x15 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x54)))
(let (($x21 (= $x15 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x21))))))
(check-sat)
