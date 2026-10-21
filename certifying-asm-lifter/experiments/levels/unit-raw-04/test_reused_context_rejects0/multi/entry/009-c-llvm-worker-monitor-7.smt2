; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x112 (ite $x57 (_ bv1 1) (_ bv0 1))))
(let ((?x73 ((_ zero_extend 31) ?x112)))
(let (($x5 (= $x57 (and (distinct ?x73 (_ bv0 32)) true))))
(not $x5))))))
(check-sat)
