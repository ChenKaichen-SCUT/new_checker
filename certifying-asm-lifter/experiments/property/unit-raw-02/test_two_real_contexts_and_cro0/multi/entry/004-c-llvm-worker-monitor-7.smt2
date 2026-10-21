; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x34 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x89 (ite $x34 (_ bv1 1) (_ bv0 1))))
(let ((?x53 ((_ zero_extend 31) ?x89)))
(let (($x39 (= $x34 (and (distinct ?x53 (_ bv0 32)) true))))
(not $x39))))))
(check-sat)
