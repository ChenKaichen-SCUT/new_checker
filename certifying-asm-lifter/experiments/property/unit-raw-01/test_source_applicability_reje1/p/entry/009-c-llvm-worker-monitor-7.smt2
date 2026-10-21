; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x13 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x121 (ite $x13 (_ bv1 1) (_ bv0 1))))
(let ((?x26 ((_ zero_extend 31) ?x121)))
(let (($x61 (= $x13 (and (distinct ?x26 (_ bv0 32)) true))))
(not $x61))))))
(check-sat)
