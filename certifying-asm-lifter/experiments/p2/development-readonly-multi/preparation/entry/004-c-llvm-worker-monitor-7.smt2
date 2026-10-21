; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-read-2 () (_ BitVec 32))
(assert
 (let (($x16 (and (distinct (_ bv0 32) p1-open-read-2) true)))
(let ((?x1177 (ite $x16 (_ bv1 1) (_ bv0 1))))
(let ((?x54 ((_ zero_extend 31) ?x1177)))
(let (($x1188 (= $x16 (and (distinct ?x54 (_ bv0 32)) true))))
(not $x1188))))))
(check-sat)
