; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x61 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x33 (ite $x61 (_ bv1 1) (_ bv0 1))))
(let ((?x23 ((_ zero_extend 31) ?x33)))
(let (($x57 (= $x61 (and (distinct ?x23 (_ bv0 32)) true))))
(not $x57))))))
(check-sat)
