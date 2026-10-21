; benchmark generated from python API
(set-info :status unknown)
(declare-fun p1-open-read-2 () (_ BitVec 32))
(assert
 (let (($x1196 (and (distinct (_ bv0 32) p1-open-read-2) true)))
(let ((?x1724 (ite $x1196 (_ bv1 1) (_ bv0 1))))
(let ((?x1188 ((_ zero_extend 31) ?x1724)))
(let (($x1173 (= $x1196 (and (distinct ?x1188 (_ bv0 32)) true))))
(not $x1173))))))
(check-sat)
