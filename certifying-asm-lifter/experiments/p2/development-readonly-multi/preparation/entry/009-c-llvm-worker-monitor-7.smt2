; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-read-2 () (_ BitVec 32))
(assert
 (let (($x16 (and (distinct (_ bv0 32) p1-open-read-2) true)))
(let ((?x1194 (ite $x16 (_ bv1 1) (_ bv0 1))))
(let ((?x1181 ((_ zero_extend 31) ?x1194)))
(let (($x1178 (= $x16 (and (distinct ?x1181 (_ bv0 32)) true))))
(not $x1178))))))
(check-sat)
