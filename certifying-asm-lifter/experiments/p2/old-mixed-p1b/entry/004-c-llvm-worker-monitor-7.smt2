; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-read-2 () (_ BitVec 32))
(assert
 (let (($x15 (and (distinct (_ bv0 32) p1-open-read-2) true)))
(let ((?x44 (ite $x15 (_ bv1 1) (_ bv0 1))))
(let ((?x19 ((_ zero_extend 31) ?x44)))
(let (($x50 (= $x15 (and (distinct ?x19 (_ bv0 32)) true))))
(not $x50))))))
(check-sat)
