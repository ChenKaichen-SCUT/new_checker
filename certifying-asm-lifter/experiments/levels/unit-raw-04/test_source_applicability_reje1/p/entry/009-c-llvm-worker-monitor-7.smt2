; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x22 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x7 (ite $x22 (_ bv1 1) (_ bv0 1))))
(let ((?x29 ((_ zero_extend 31) ?x7)))
(let (($x58 (= $x22 (and (distinct ?x29 (_ bv0 32)) true))))
(not $x58))))))
(check-sat)
