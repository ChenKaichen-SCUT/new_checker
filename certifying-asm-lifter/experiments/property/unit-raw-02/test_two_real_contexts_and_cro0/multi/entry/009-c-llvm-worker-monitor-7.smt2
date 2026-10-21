; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x24 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x50 (ite $x24 (_ bv1 1) (_ bv0 1))))
(let ((?x89 ((_ zero_extend 31) ?x50)))
(let (($x19 (= $x24 (and (distinct ?x89 (_ bv0 32)) true))))
(not $x19))))))
(check-sat)
