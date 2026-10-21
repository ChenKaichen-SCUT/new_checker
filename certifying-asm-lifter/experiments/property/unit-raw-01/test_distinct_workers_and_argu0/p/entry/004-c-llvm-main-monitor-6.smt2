; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-main-read-0 () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) p0-main-read-0) true)))
(let ((?x21 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x121 ((_ zero_extend 31) ?x21)))
(let (($x38 (= $x24 (and (distinct ?x121 (_ bv0 32)) true))))
(not $x38))))))
(check-sat)
