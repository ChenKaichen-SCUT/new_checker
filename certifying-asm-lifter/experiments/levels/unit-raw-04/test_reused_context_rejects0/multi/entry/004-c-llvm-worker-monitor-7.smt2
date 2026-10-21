; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x20 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x73 (ite $x20 (_ bv1 1) (_ bv0 1))))
(let ((?x33 ((_ zero_extend 31) ?x73)))
(let (($x62 (= $x20 (and (distinct ?x33 (_ bv0 32)) true))))
(not $x62))))))
(check-sat)
