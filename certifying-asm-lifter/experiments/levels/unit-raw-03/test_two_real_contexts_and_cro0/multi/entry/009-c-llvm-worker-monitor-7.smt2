; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x56 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x15 (ite $x56 (_ bv1 1) (_ bv0 1))))
(let ((?x42 ((_ zero_extend 31) ?x15)))
(let (($x44 (= $x56 (and (distinct ?x42 (_ bv0 32)) true))))
(not $x44))))))
(check-sat)
