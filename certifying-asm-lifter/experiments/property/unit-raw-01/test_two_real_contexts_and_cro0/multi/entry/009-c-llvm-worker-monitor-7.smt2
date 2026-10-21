; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x62 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x20 (ite $x62 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x20)))
(let (($x55 (= $x62 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x55))))))
(check-sat)
