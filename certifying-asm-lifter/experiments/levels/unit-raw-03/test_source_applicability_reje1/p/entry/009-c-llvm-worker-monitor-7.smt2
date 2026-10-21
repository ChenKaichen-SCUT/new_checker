; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x12 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x43 (ite $x12 (_ bv1 1) (_ bv0 1))))
(let ((?x67 ((_ zero_extend 31) ?x43)))
(let (($x27 (= $x12 (and (distinct ?x67 (_ bv0 32)) true))))
(not $x27))))))
(check-sat)
